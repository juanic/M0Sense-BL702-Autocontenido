set(BSP_COMMON_DIR ${CMAKE_SOURCE_DIR}/bsp/bsp_common)
set(TARGET_REQUIRED_LIBS fatfs)
set(TARGET_REQUIRED_PRIVATE_INCLUDE ${BSP_COMMON_DIR}/spi_sd)
set(TARGET_REQUIRED_SRCS ${BSP_COMMON_DIR}/fatfs/fatfs_spi_sd.c ${BSP_COMMON_DIR}/spi_sd/bsp_spi_sd.c)
set(mains main.c)
generate_bin()



