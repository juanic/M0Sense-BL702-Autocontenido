/* BL702 Driver*/
#include <bflb_platform.h>
/* USB STDIO */
#include <usb_stdio.h>

#include "riscv_common_tables.h"
#include "riscv_const_structs.h"
#include "riscv_math.h"
#include "array.h"
#include <stdint.h>
#include "../common.h"

#include "../HelperFunctions/math_helper.c"
#include "../HelperFunctions/ref_helper.c"

#define DELTAF32 (0.05f)
#define DELTAQ31 (63)
#define DELTAQ15 (1)
#define DELTAQ7 (1)

int test_flag_error = 0;

uint32_t fftSize = 1024;
uint32_t ifftFlag = 0;
uint32_t doBitReverse = 1;

static int DSP_rfft_fast_f32(void)
{
    uint16_t i;
    /* clang-format off */
    riscv_rfft_fast_instance_f32 SS;
    /* clang-format on */
    riscv_rfft_fast_init_f32(&SS, 512);
    //BENCH_START(riscv_rfft_fast_f32);
    riscv_rfft_fast_f32(&SS, rfft_testinput_f32_50hz_200Hz_fast, f32_testOutput, 0);
    //BENCH_END(riscv_rfft_fast_f32);
    ref_rfft_fast_f32(&SS, rfft_testinput_f32_50hz_200Hz_fast_ref,
                      f32_testOutput_ref, 0);
    float32_t resault, resault_ref;
    uint32_t index, index_ref;
    riscv_max_f32(f32_testOutput, 512, &resault, &index);
    riscv_max_f32(f32_testOutput_ref, 512, &resault_ref, &index_ref);

    if (index != index_ref) {
        //BENCH_ERROR(riscv_rfft_fast_f32);
        printf("expect: %ld, actual: %ld\n", index_ref, index);
        test_flag_error = 1;
    }
    //BENCH_STATUS(riscv_rfft_fast_f32);
}

int main(void)
{
    bflb_platform_init(0);
    MSG_DBG(
        "Now can use MSG_xxx, LOG_xxx and bflb_platform_printf on uart.\r\n");  // just appear on uart unless use printf

#ifdef M0SENSE_USE_USBSTDIO
    usb_stdio_init();                                        // MUST be called before any call to printf or puts
    printf("Now can use printf, puts on usb_cdc_acm.\r\n");  // on usb, ttyACMx on Linux or COMx on Windows.
#endif
    BENCH_INIT;
    bflb_platform_init(0); 
    printf("start fft test.\n");
    DSP_rfft_fast_f32();
    //DSP_rfft_f32();
    BENCH_FINISH;
    if (test_flag_error) {
        printf("test error apprears, please recheck.\n");
        return 1;
    } else {
        printf("all test are passed. Well done!\n");
    }
    while (1) {
        printf("hello, world\r\n");
        mtimer_delay_ms(2000);
    }
}