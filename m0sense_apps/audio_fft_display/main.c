/* BL702 Driver*/
#include <bflb_platform.h>
#include <bl702_glb.h>
#include <hal_adc.h>
#include <hal_dma.h>
#include <hal_gpio.h>
/* USB STDIO */
#include <usb_stdio.h>
#include <math.h>
#include <string.h>

#include "io_def.h"

#define SAMPLE_COUNT (2 * 512)
static adc_data_parse_t data_parse;
static bool pingpong_idx = false;
static int16_t raw_adc_buffer[2][SAMPLE_COUNT * (sizeof(uint32_t) / sizeof(int16_t))];

#include "riscv_math.h"
#include "riscv_const_structs.h"
#include "riscv_common_tables.h"
#include "mcu_lcd.h"

#define FFT_SIZE SAMPLE_COUNT
static float32_t fft_input[FFT_SIZE];
static float32_t fft_output[FFT_SIZE];

// Tabla cromática de notas (de C0 a B7)
typedef struct {
    const char* name;
    float freq;
} note_t;

uint16_t color_back =  0x0000;
uint16_t color_font =  0xffff;



void lcd_fill_rect(uint16_t x, uint16_t y, uint16_t width, uint16_t height, uint16_t color) {
    for (uint16_t i = 0; i < height; i++) {
        lcd_draw_area(x, y + i, x + width - 1, y + i, color);
    }
}

void draw_frequency_spectrum(float32_t* fft_output, int fft_size, uint16_t color) {
    int graph_x = 0;
    int graph_y = 10;        // Reservamos las primeras 10 filas para el texto de la frecuencia pico
    int graph_width = 160;   // Ancho de la pantalla LCD
    int graph_height = 60;   // Altura para la grafica (160x60)
    int bar_width = 2;// graph_width / (fft_size / 2);  // Ancho de cada barra

    // Limpia la región donde se dibujará el espectro
    lcd_fill_rect(graph_x, graph_y, graph_width, graph_height, color_back);

    // Dibuja las barras del espectro
    for (int i = 1; i < fft_size / 2; i++) {  // Ignora la componente DC (i=0)
        float real = fft_output[2 * i];
        float imag = fft_output[2 * i + 1];
        float magnitude = sqrtf(real * real + imag * imag);

        // Escala la magnitud para ajustarla a la altura de la gráfica
        int bar_height = (int)((magnitude / 200000.0f) * graph_height);
        if (bar_height > graph_height) {
            bar_height = graph_height;  // Limita la altura máxima
        }

        // Calcula las coordenadas de la barra
        int x = graph_x + i * bar_width;
        int y = graph_y + (graph_height - bar_height);

        // Dibuja la barra
        lcd_fill_rect(x, y, bar_width - 1, bar_height, color);
    }
}

// Área del espectrograma actualizada para usar la pantalla completa de 160x80
#define SPEC_X        0
#define SPEC_Y_START  0
#define SPEC_WIDTH    160
#define SPEC_HEIGHT   80

static int spectrogram_y = SPEC_Y_START;

// Escala de color: de azul a celeste, verde, amarillo, naranja y rojo.
static uint16_t map_intensity_to_color(int intensity) {
    // Se definen los puntos de control (stops) en intensidad y sus colores correspondientes (en RGB 8 bits)
    const int stops[6] = {0, 51, 102, 153, 204, 255};
    const int r_vals[6] = {0,   0,   0, 255, 255, 255};
    const int g_vals[6] = {0, 255, 255, 255, 128,   0};
    const int b_vals[6] = {255, 255,   0,   0,   0,   0};

    // Se asegura que intensity esté entre 0 y 255
    if (intensity < 0)
        intensity = 0;
    if (intensity > 255)
        intensity = 255;

    int idx = 0;
    for (int i = 0; i < 5; i++) {
        if (intensity >= stops[i] && intensity <= stops[i+1]) {
            idx = i;
            break;
        }
    }
    int start = stops[idx], end = stops[idx+1];
    float fraction = (float)(intensity - start) / (end - start);
    int r = r_vals[idx] + (int)((r_vals[idx+1] - r_vals[idx]) * fraction);
    int g = g_vals[idx] + (int)((g_vals[idx+1] - g_vals[idx]) * fraction);
    int b = b_vals[idx] + (int)((b_vals[idx+1] - b_vals[idx]) * fraction);
    // Conversión de RGB 8 bits a RGB565
    uint16_t color = ((r >> 3) << 11) | ((g >> 2) << 5) | (b >> 3);
    return color;
}

/// Función para dibujar una fila del espectrograma con velocidad reducida a la mitad
void draw_spectrogram_row(float32_t* fft_output, int fft_size) {
    int num_bins = fft_size / 2;  // Número de bandas de frecuencia
    // 🧹 Borrar la fila actual antes de escribir sobre ella
    lcd_fill_rect(SPEC_X, spectrogram_y, SPEC_WIDTH, 2, color_back);
    for (int x = 0; x < SPEC_WIDTH; x++) {
        int start_bin = x * num_bins / SPEC_WIDTH;
        int end_bin = (x + 1) * num_bins / SPEC_WIDTH;
        float magnitude_avg = 0.0f;
        int count = 0;
        for (int i = start_bin; i < end_bin; i++) {
            float real = fft_output[2 * i];
            float imag = fft_output[2 * i + 1];
            float mag = sqrtf(real * real + imag * imag);
            magnitude_avg += mag;
            count++;
        }
        if (count > 0) {
            magnitude_avg /= count;
        }
        // Se escala la magnitud para obtener un valor de intensidad de 0 a 255.
        int intensity = (int)(magnitude_avg / 500.0f * 255);
        if (intensity > 255) intensity = 255;
        
        // Se mapea la intensidad a un color según la escala definida
        uint16_t pixel_color = map_intensity_to_color(intensity);
        
        // Dibuja el píxel en la posición (x, spectrogram_y)
        lcd_fill_rect(SPEC_X + x, spectrogram_y, 1, 1, pixel_color);
    }
    
    // Se incrementa la fila en cada llamada (velocidad de barrido anterior)
    spectrogram_y++;
    
    // Al llegar al final del área se borra la pantalla y se reinicia la posición
    if (spectrogram_y >= (SPEC_Y_START + SPEC_HEIGHT)) {
        //lcd_fill_rect(SPEC_X, SPEC_Y_START, SPEC_WIDTH, SPEC_HEIGHT, color_back);
        spectrogram_y = SPEC_Y_START;
    }
}



void dma_ch0_irq_callback(struct device* dev, void* args, uint32_t size, uint32_t state)
{
    int16_t* adc_buffer = raw_adc_buffer[pingpong_idx];
    pingpong_idx = !pingpong_idx;
    device_read(device_find("adc"), 0, raw_adc_buffer[pingpong_idx],
                sizeof(raw_adc_buffer[0]) / sizeof(uint8_t)); /* size need convert to uint8_t*/

    uint32_t res_all = 0;
    for (int i = 0; i < SAMPLE_COUNT; i++) {
        adc_buffer[i] = (((uint32_t*)adc_buffer)[i] & 0xffff) >> 2;
        res_all += (uint32_t)adc_buffer[i];
    }
    // Conversión a float32_t para FFT
    for (int i = 0; i < FFT_SIZE; i++) {
        fft_input[i] = (float32_t)adc_buffer[i];
    }

    // Cálculo de la FFT
    riscv_rfft_fast_instance_f32 S;
    riscv_rfft_fast_init_f32(&S, FFT_SIZE);
    riscv_rfft_fast_f32(&S, fft_input, fft_output, 0);

    // Se dibuja una nueva fila del espectrograma utilizando la FFT calculada
    draw_spectrogram_row(fft_output, FFT_SIZE);
}



int main(void)
{
    bflb_platform_init(0);
    MSG_DBG(
        "Now can use MSG_xxx, LOG_xxx and bflb_platform_printf on uart.\r\n");  // just appear on uart unless use printf
    GLB_GPIO_Type gpios_lcd[] = {LCD_SCK_PIN, LCD_SDA_PIN};
    GLB_GPIO_Func_Init(GPIO_FUN_SPI, gpios_lcd, sizeof(gpios_lcd) / sizeof(GLB_GPIO_Type));

    if (lcd_init()) {
        printf("[init] lcd init err \r\n");
    }
    lcd_set_dir(3, 0);
    lcd_clear(0xffff);

#ifdef M0SENSE_USE_USBSTDIO
    usb_stdio_init();                                        // MUST be called before any call to printf or puts
    printf("Now can use printf, puts on usb_cdc_acm.\r\n");  // on usb, ttyACMx on Linux or COMx on Windows.
#endif

    { /* configure the pll for ADC */
        uint32_t tmpVal = BL_RD_REG(GLB_BASE, GLB_CGEN_CFG1);
        tmpVal &= (~(1 << BL_AHB_SLAVE1_GPIP));
        BL_WR_REG(GLB_BASE, GLB_CGEN_CFG1, tmpVal);

        /* ROOT_CLOCK_SOURCE_AUPLL_24576000_HZ / 24 = 1024000 HZ */
        PDS_Set_Audio_PLL_Freq(AUDIO_PLL_24576000_HZ);
        GLB_Set_ADC_CLK(ENABLE, GLB_ADC_CLK_AUDIO_PLL, 23);

        tmpVal |= (1 << BL_AHB_SLAVE1_GPIP);
        BL_WR_REG(GLB_BASE, GLB_CGEN_CFG1, tmpVal);
    }

    GLB_GPIO_Type gpios[] = {MIC_IN_PIN};
    GLB_GPIO_Func_Init(GPIO_FUN_ANALOG, gpios, sizeof(gpios) / sizeof(GLB_GPIO_Type));
    printf("[init] goio set mode complete.\r\n");
    /* initialize ADC0 */
    adc_register(ADC0_INDEX, "adc");
    struct device_t* mic_adc = device_find("adc");
    if (!mic_adc) {
        printf("[init] ADC initial failed!\r\n");
        goto _exit;
    }
    /* 1024000 HZ / 16 = 64000 HZ */
    ADC_DEV(mic_adc)->clk_div = ADC_CLOCK_DIV_16;
    /* 64000 HZ / 16 = 4000 HZ (4k) */
    ADC_DEV(mic_adc)->data_width = ADC_DATA_WIDTH_14B_WITH_16_AVERAGE;
    ADC_DEV(mic_adc)->continuous_conv_mode = ENABLE;
    ADC_DEV(mic_adc)->vref = ADC_VREF_2V;
    ADC_DEV(mic_adc)->fifo_threshold = ADC_FIFO_THRESHOLD_16BYTE;
    ADC_DEV(mic_adc)->gain = ADC_GAIN_2;
    device_open(mic_adc, DEVICE_OFLAG_DMA_RX);

    dma_register(DMA0_CH0_INDEX, "dma_ch0");
    struct device* dma_ch0 = device_find("dma_ch0");
    if (!dma_ch0) {
        printf("[init] DMA ch0 for ADC initial failed!\r\n");
        goto _exit;
    }
    DMA_DEV(dma_ch0)->direction = DMA_PERIPH_TO_MEMORY;
    DMA_DEV(dma_ch0)->transfer_mode = DMA_LLI_ONCE_MODE;
    DMA_DEV(dma_ch0)->src_req = DMA_REQUEST_ADC0;
    DMA_DEV(dma_ch0)->dst_req = DMA_REQUEST_NONE;
    DMA_DEV(dma_ch0)->src_addr_inc = DMA_ADDR_INCREMENT_DISABLE;
    DMA_DEV(dma_ch0)->dst_addr_inc = DMA_ADDR_INCREMENT_ENABLE;
    DMA_DEV(dma_ch0)->src_burst_size = DMA_BURST_INCR1;
    DMA_DEV(dma_ch0)->dst_burst_size = DMA_BURST_INCR1;
    DMA_DEV(dma_ch0)->src_width = DMA_TRANSFER_WIDTH_32BIT;
    DMA_DEV(dma_ch0)->dst_width = DMA_TRANSFER_WIDTH_32BIT;
    device_open(dma_ch0, 0);
    device_set_callback(dma_ch0, dma_ch0_irq_callback);
    device_control(dma_ch0, DEVICE_CTRL_SET_INT, NULL);

    /* connect dac device and dma device */
    device_control(mic_adc, DEVICE_CTRL_ATTACH_RX_DMA, dma_ch0);
    printf("[init] ADC initial success!\r\n");

    adc_channel_t posChList[] = {ADC_CHANNEL2};
    adc_channel_t negChList[] = {ADC_CHANNEL_GND};
    adc_channel_cfg_t adc_channel_cfg = {
        .pos_channel = posChList,
        .neg_channel = negChList,
        .num = sizeof(posChList) / sizeof(posChList[0]),
    };
    while (adc_channel_config(mic_adc, &adc_channel_cfg) != SUCCESS) {
        printf("[micrec] ADC channel config error\r\n");
        mtimer_delay_ms(1000);
    }
    printf("[micrec] start success\r\n");

    adc_channel_start(mic_adc);
    device_read(mic_adc, 0, raw_adc_buffer[pingpong_idx],
                sizeof(raw_adc_buffer[0]) / sizeof(uint8_t)); /* size need convert to uint8_t*/
    while (1) {
        __WFI();
        mtimer_delay_ms(100);
    }
    adc_channel_stop(mic_adc);

_exit:
    while (1) {
        __WFI();
    }
}


