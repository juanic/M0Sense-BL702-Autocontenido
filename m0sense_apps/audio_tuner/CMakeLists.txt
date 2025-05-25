set(TARGET_REQUIRED_PRIVATE_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/..)
set(TARGET_REQUIRED_LIBS nmsis usb_stack shell usb_stdio)
list(APPEND TARGET_REQUIRED_SRCS rfft.c)
set(BSP_COMMON_DIR ${CMAKE_SOURCE_DIR}/bsp/bsp_common)
set(TARGET_REQUIRED_PRIVATE_INCLUDE ${BSP_COMMON_DIR}/mcu_lcd)
set(TARGET_REQUIRED_SRCS ${sources} ${BSP_COMMON_DIR}/mcu_lcd/mcu_lcd.c
                                    ${BSP_COMMON_DIR}/mcu_lcd/st7735s.c 
                                    ${BSP_COMMON_DIR}/mcu_lcd/font.c )
set(mains main.c)
generate_bin()
