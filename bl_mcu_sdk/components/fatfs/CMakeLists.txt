﻿################# Add global include #################
list(APPEND ADD_INCLUDE
"${CMAKE_CURRENT_SOURCE_DIR}"
)
#######################################################

################# Add private include #################
# list(APPEND ADD_PRIVATE_INCLUDE
# )
#######################################################

############## Add current dir source files ###########
file(GLOB_RECURSE sources "${CMAKE_CURRENT_SOURCE_DIR}/*.c")
list(APPEND ADD_SRCS  ${sources})
# aux_source_directory(src ADD_SRCS)
# list(REMOVE_ITEM ADD_SRCS "${CMAKE_CURRENT_SOURCE_DIR}")
#######################################################

########### Add required/dependent components #########
list(APPEND ADD_REQUIREMENTS common)
#######################################################

############ Add static libs ##########################
#list(APPEND ADD_STATIC_LIB "libxxx.a")
#######################################################

############ Add dynamic libs #########################
# list(APPEND ADD_DYNAMIC_LIB "libxxx.so")
#######################################################

############ Add global compile option ################
#add components denpend on this component
# list(APPEND ADD_DEFINITIONS -Dxxx)
#######################################################

############ Add private compile option ################
#add compile option for this component that won't affect other modules
# list(APPEND ADD_PRIVATE_DEFINITIONS -Dxxx)
#######################################################

generate_library()
