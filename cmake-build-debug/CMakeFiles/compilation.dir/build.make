# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Users/galwe/OneDrive/Desktop/technion/SemesterE/compilation

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/galwe/OneDrive/Desktop/technion/SemesterE/compilation/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/compilation.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/compilation.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/compilation.dir/flags.make

CMakeFiles/compilation.dir/main.cpp.o: CMakeFiles/compilation.dir/flags.make
CMakeFiles/compilation.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/galwe/OneDrive/Desktop/technion/SemesterE/compilation/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/compilation.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/compilation.dir/main.cpp.o -c /mnt/c/Users/galwe/OneDrive/Desktop/technion/SemesterE/compilation/main.cpp

CMakeFiles/compilation.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/compilation.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/galwe/OneDrive/Desktop/technion/SemesterE/compilation/main.cpp > CMakeFiles/compilation.dir/main.cpp.i

CMakeFiles/compilation.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/compilation.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/galwe/OneDrive/Desktop/technion/SemesterE/compilation/main.cpp -o CMakeFiles/compilation.dir/main.cpp.s

# Object files for target compilation
compilation_OBJECTS = \
"CMakeFiles/compilation.dir/main.cpp.o"

# External object files for target compilation
compilation_EXTERNAL_OBJECTS =

compilation: CMakeFiles/compilation.dir/main.cpp.o
compilation: CMakeFiles/compilation.dir/build.make
compilation: CMakeFiles/compilation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/galwe/OneDrive/Desktop/technion/SemesterE/compilation/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable compilation"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/compilation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/compilation.dir/build: compilation

.PHONY : CMakeFiles/compilation.dir/build

CMakeFiles/compilation.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/compilation.dir/cmake_clean.cmake
.PHONY : CMakeFiles/compilation.dir/clean

CMakeFiles/compilation.dir/depend:
	cd /mnt/c/Users/galwe/OneDrive/Desktop/technion/SemesterE/compilation/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/galwe/OneDrive/Desktop/technion/SemesterE/compilation /mnt/c/Users/galwe/OneDrive/Desktop/technion/SemesterE/compilation /mnt/c/Users/galwe/OneDrive/Desktop/technion/SemesterE/compilation/cmake-build-debug /mnt/c/Users/galwe/OneDrive/Desktop/technion/SemesterE/compilation/cmake-build-debug /mnt/c/Users/galwe/OneDrive/Desktop/technion/SemesterE/compilation/cmake-build-debug/CMakeFiles/compilation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/compilation.dir/depend

