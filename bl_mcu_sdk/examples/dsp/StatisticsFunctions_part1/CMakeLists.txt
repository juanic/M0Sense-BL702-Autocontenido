set(TARGET_REQUIRED_PRIVATE_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/..)
list(APPEND TARGET_REQUIRED_SRCS absmax.c absmin.c max.c)
list(APPEND TARGET_REQUIRED_SRCS mean.c min.c power.c rms.c std.c var.c)
set(TARGET_REQUIRED_LIBS nmsis)
set(mains main.c)
generate_bin()