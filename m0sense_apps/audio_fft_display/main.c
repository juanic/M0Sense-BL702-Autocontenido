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

static const note_t chromatic_notes[] = {
    {"C0", 16.35}, {"C#0", 17.32}, {"D0", 18.35}, {"D#0", 19.45}, {"E0", 20.60}, {"F0", 21.83}, {"F#0", 23.12}, {"G0", 24.50}, {"G#0", 25.96}, {"A0", 27.50}, {"A#0", 29.14}, {"B0", 30.87},
    {"C1", 32.70}, {"C#1", 34.65}, {"D1", 36.71}, {"D#1", 38.89}, {"E1", 41.20}, {"F1", 43.65}, {"F#1", 46.25}, {"G1", 49.00}, {"G#1", 51.91}, {"A1", 55.00}, {"A#1", 58.27}, {"B1", 61.74},
    {"C2", 65.41}, {"C#2", 69.30}, {"D2", 73.42}, {"D#2", 77.78}, {"E2", 82.41}, {"F2", 87.31}, {"F#2", 92.50}, {"G2", 98.00}, {"G#2", 103.83}, {"A2", 110.00}, {"A#2", 116.54}, {"B2", 123.47},
    {"C3", 130.81}, {"C#3", 138.59}, {"D3", 146.83}, {"D#3", 155.56}, {"E3", 164.81}, {"F3", 174.61}, {"F#3", 185.00}, {"G3", 196.00}, {"G#3", 207.65}, {"A3", 220.00}, {"A#3", 233.08}, {"B3", 246.94},
    {"C4", 261.63}, {"C#4", 277.18}, {"D4", 293.66}, {"D#4", 311.13}, {"E4", 329.63}, {"F4", 349.23}, {"F#4", 369.99}, {"G4", 392.00}, {"G#4", 415.30}, {"A4", 440.00}, {"A#4", 466.16}, {"B4", 493.88},
    {"C5", 523.25}, {"C#5", 554.37}, {"D5", 587.33}, {"D#5", 622.25}, {"E5", 659.25}, {"F5", 698.46}, {"F#5", 739.99}, {"G5", 783.99}, {"G#5", 830.61}, {"A5", 880.00}, {"A#5", 932.33}, {"B5", 987.77},
    {"C6", 1046.50}, {"C#6", 1108.73}, {"D6", 1174.66}, {"D#6", 1244.51}, {"E6", 1318.51}, {"F6", 1396.91}, {"F#6", 1479.98}, {"G6", 1567.98}, {"G#6", 1661.22}, {"A6", 1760.00}, {"A#6", 1864.66}, {"B6", 1975.53},
    {"C7", 2093.00}, {"C#7", 2217.46}, {"D7", 2349.32}, {"D#7", 2489.02}, {"E7", 2637.02}, {"F7", 2793.83}, {"F#7", 2959.96}, {"G7", 3135.96}, {"G#7", 3322.44}, {"A7", 3520.00}, {"A#7", 3729.31}, {"B7", 3951.07}
};
#define NUM_CHROMATIC_NOTES (sizeof(chromatic_notes)/sizeof(chromatic_notes[0]))

const char* freq_to_note(float freq, float* diff_hz) {
    float min_diff = 1e6f;
    int min_idx = 0;
    for (int i = 0; i < NUM_CHROMATIC_NOTES; i++) {
        float d = fabsf(freq - chromatic_notes[i].freq);
        if (d < min_diff) {
            min_diff = d;
            min_idx = i;
        }
    }
    if (diff_hz) *diff_hz = freq - chromatic_notes[min_idx].freq;
    return chromatic_notes[min_idx].name;
}

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
    int bar_width = 2// graph_width / (fft_size / 2);  // Ancho de cada barra

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

void dma_ch0_irq_callback(struct device* dev, void* args, uint32_t size, uint32_t state)
{
    int16_t* adc_buffer = raw_adc_buffer[pingpong_idx];
    pingpong_idx = !pingpong_idx;
    device_read(device_find("adc"), 0, raw_adc_buffer[pingpong_idx],
                sizeof(raw_adc_buffer[0]) / sizeof(uint8_t)); /* size need convert to uint8_t*/

    /* min: 6339, max: 9165 mid: 7752 */
    uint32_t res_all = 0;
    for (int i = 0; i < SAMPLE_COUNT; i++) {
        adc_buffer[i] = (((uint32_t*)adc_buffer)[i] & 0xffff) >> 2;
        res_all += (uint32_t)adc_buffer[i];
    }
    /*
    for (int i = 0; i < SAMPLE_COUNT; i++) {
        adc_buffer[i] -= res_all / SAMPLE_COUNT;
        adc_buffer[i] <<= 6;
        printf("%5d", adc_buffer[i]);
        printf(i % 16 == 15 ? "\r\n" : ", ");
    }*/
    // Conversión a float32_t para FFT
    for (int i = 0; i < FFT_SIZE; i++) {
        fft_input[i] = (float32_t)adc_buffer[i];
    }

    // Cálculo de la FFT
    riscv_rfft_fast_instance_f32 S;
    riscv_rfft_fast_init_f32(&S, FFT_SIZE);
    riscv_rfft_fast_f32(&S, fft_input, fft_output, 0);

    // Buscar el máximo del espectro y mostrar la frecuencia correspondiente
    float max_magnitude = 0.0f;
    int max_index = 0;
    for (int i = 1; i < FFT_SIZE / 2; i++) { // Ignora DC (i=0)
        float real = fft_output[2 * i];
        float imag = fft_output[2 * i + 1];
        float mag = sqrtf(real * real + imag * imag);
        if (mag > max_magnitude) {
            max_magnitude = mag;
            max_index = i;
        }
    }
    // Calcular la frecuencia pico
    float fs = 16000.0f; // Frecuencia de muestreo en Hz
    float freq = (max_index * fs) / FFT_SIZE;

    float diff_hz;
    const char* note = freq_to_note(freq, &diff_hz);

    // Mostrar la frecuencia pico en la parte superior (línea 0)
    char peak_str[32];
    sprintf(peak_str, "Peak: %.2f Hz", freq);
    lcd_draw_str_ascii16(0, 0, color_font, color_back, peak_str, strlen(peak_str));

    // Dibuja el espectro en un área de 160x70 a partir de Y=10
    draw_frequency_spectrum(fft_output, FFT_SIZE, color_font);
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
    /* 1024000 HZ / 4 = 256000 HZ */
    ADC_DEV(mic_adc)->clk_div = ADC_CLOCK_DIV_4;
    /* 256000 HZ / 16 = 16000 HZ (16k) */
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


