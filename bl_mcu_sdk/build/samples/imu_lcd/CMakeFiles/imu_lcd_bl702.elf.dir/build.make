# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "C:/Program Files/CMake/bin/cmake.exe"

# The command to remove a file.
RM = "C:/Program Files/CMake/bin/cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build

# Include any dependencies generated for this target.
include samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/compiler_depend.make

# Include the progress variables for this target.
include samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/progress.make

# Include the compile flags for this target's objects.
include samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/flags.make

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/main.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/flags.make
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/main.c.obj: D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/m0sense_apps/imu_lcd/main.c
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/main.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/main.c.obj"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/main.c.obj -MF CMakeFiles/imu_lcd_bl702.elf.dir/main.c.obj.d -o CMakeFiles/imu_lcd_bl702.elf.dir/main.c.obj -c D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/m0sense_apps/imu_lcd/main.c

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/imu_lcd_bl702.elf.dir/main.c.i"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/m0sense_apps/imu_lcd/main.c > CMakeFiles/imu_lcd_bl702.elf.dir/main.c.i

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/imu_lcd_bl702.elf.dir/main.c.s"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/m0sense_apps/imu_lcd/main.c -o CMakeFiles/imu_lcd_bl702.elf.dir/main.c.s

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/flags.make
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.obj: D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.obj"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.obj -MF CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.obj.d -o CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.obj -c D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.i"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c > CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.i

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.s"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c -o CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.s

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/flags.make
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.obj: D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.obj"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.obj -MF CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.obj.d -o CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.obj -c D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.i"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c > CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.i

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.s"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c -o CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.s

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/flags.make
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.obj: D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.obj"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.obj -MF CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.obj.d -o CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.obj -c D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.i"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c > CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.i

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.s"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c -o CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.s

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/flags.make
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.obj: D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.obj"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.obj -MF CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.obj.d -o CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.obj -c D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.i"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c > CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.i

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.s"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c -o CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.s

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/flags.make
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.obj: D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.obj"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.obj -MF CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.obj.d -o CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.obj -c D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.i"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c > CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.i

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.s"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c -o CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.s

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/flags.make
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.obj: D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.obj: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.obj"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.obj -MF CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.obj.d -o CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.obj -c D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.i"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c > CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.i

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.s"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c -o CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.s

# Object files for target imu_lcd_bl702.elf
imu_lcd_bl702_elf_OBJECTS = \
"CMakeFiles/imu_lcd_bl702.elf.dir/main.c.obj" \
"CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.obj" \
"CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.obj" \
"CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.obj" \
"CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.obj" \
"CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.obj" \
"CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.obj"

# External object files for target imu_lcd_bl702.elf
imu_lcd_bl702_elf_EXTERNAL_OBJECTS =

D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/main.c.obj
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/mcu_lcd.c.obj
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/st7735s.c.obj
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/mcu_lcd/font.c.obj
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/bflb_platform.c.obj
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/bsp_common/platform/syscalls.c.obj
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/D_/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/bsp/board/bl702/board.c.obj
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/build.make
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: libraries/bl702_driver/libbl702_driver.a
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: libraries/usb_stack/libusb_stack.a
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: libraries/shell/libshell.a
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: libraries/usb_stdio/libusb_stdio.a
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: libraries/bl702_driver/libbl702_driver.a
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: libraries/common/libcommon.a
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: libraries/usb_stack/libusb_stack.a
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: libraries/shell/libshell.a
D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf: D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/drivers/bl702_driver/bl702_flash.ld
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking C executable D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && C:/riscv64-tools/bin/riscv64-unknown-elf-gcc.exe -TD:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/drivers/bl702_driver/bl702_flash.ld -Wl,-Map=D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.map -march=rv32imafc -mabi=ilp32f -Wl,--cref -Wl,--gc-sections -nostartfiles -g3 -fms-extensions -ffunction-sections -fdata-sections -Wall -Wchar-subscripts -std=c99 --specs=nano.specs -u _printf_float $(imu_lcd_bl702_elf_OBJECTS) $(imu_lcd_bl702_elf_EXTERNAL_OBJECTS) -o D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf  ../../libraries/bl702_driver/libbl702_driver.a -lc ../../libraries/usb_stack/libusb_stack.a ../../libraries/shell/libshell.a ../../libraries/usb_stdio/libusb_stdio.a -lm ../../libraries/bl702_driver/libbl702_driver.a ../../libraries/common/libcommon.a ../../libraries/usb_stack/libusb_stack.a ../../libraries/shell/libshell.a 
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold "Generate D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.bin"
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold "Copy D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.bin into download path"
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && riscv64-unknown-elf-objcopy -Obinary D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.bin
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && riscv64-unknown-elf-objdump -d -S D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf >D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.asm
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && riscv64-unknown-elf-size D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && "C:/Program Files/CMake/bin/cmake.exe" -E copy D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.bin D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/tools/bflb_flash_tool/img/project.bin

# Rule to build all files generated by this target.
samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/build: D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/out/m0sense_apps/imu_lcd/imu_lcd_bl702.elf
.PHONY : samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/build

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/clean:
	cd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd && $(CMAKE_COMMAND) -P CMakeFiles/imu_lcd_bl702.elf.dir/cmake_clean.cmake
.PHONY : samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/clean

samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/m0sense_apps/imu_lcd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd D:/Documentos/REPOS/Github/M0Sense-BL702-Autocontenido/bl_mcu_sdk/build/samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : samples/imu_lcd/CMakeFiles/imu_lcd_bl702.elf.dir/depend

