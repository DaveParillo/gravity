# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tim/gravity/gravity/ThirdParty/cppdb-trunk

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tim/gravity/gravity/ThirdParty/cppdb-trunk

# Include any dependencies generated for this target.
include CMakeFiles/test_perf.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test_perf.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_perf.dir/flags.make

CMakeFiles/test_perf.dir/test/test_perf.cpp.o: CMakeFiles/test_perf.dir/flags.make
CMakeFiles/test_perf.dir/test/test_perf.cpp.o: test/test_perf.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tim/gravity/gravity/ThirdParty/cppdb-trunk/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/test_perf.dir/test/test_perf.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test_perf.dir/test/test_perf.cpp.o -c /home/tim/gravity/gravity/ThirdParty/cppdb-trunk/test/test_perf.cpp

CMakeFiles/test_perf.dir/test/test_perf.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_perf.dir/test/test_perf.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tim/gravity/gravity/ThirdParty/cppdb-trunk/test/test_perf.cpp > CMakeFiles/test_perf.dir/test/test_perf.cpp.i

CMakeFiles/test_perf.dir/test/test_perf.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_perf.dir/test/test_perf.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tim/gravity/gravity/ThirdParty/cppdb-trunk/test/test_perf.cpp -o CMakeFiles/test_perf.dir/test/test_perf.cpp.s

CMakeFiles/test_perf.dir/test/test_perf.cpp.o.requires:
.PHONY : CMakeFiles/test_perf.dir/test/test_perf.cpp.o.requires

CMakeFiles/test_perf.dir/test/test_perf.cpp.o.provides: CMakeFiles/test_perf.dir/test/test_perf.cpp.o.requires
	$(MAKE) -f CMakeFiles/test_perf.dir/build.make CMakeFiles/test_perf.dir/test/test_perf.cpp.o.provides.build
.PHONY : CMakeFiles/test_perf.dir/test/test_perf.cpp.o.provides

CMakeFiles/test_perf.dir/test/test_perf.cpp.o.provides.build: CMakeFiles/test_perf.dir/test/test_perf.cpp.o

# Object files for target test_perf
test_perf_OBJECTS = \
"CMakeFiles/test_perf.dir/test/test_perf.cpp.o"

# External object files for target test_perf
test_perf_EXTERNAL_OBJECTS =

test_perf: CMakeFiles/test_perf.dir/test/test_perf.cpp.o
test_perf: libcppdb.so.0.3.1
test_perf: /usr/lib/i386-linux-gnu/libdl.so
test_perf: /usr/lib/i386-linux-gnu/libpthread.so
test_perf: /usr/lib/i386-linux-gnu/libodbc.so
test_perf: CMakeFiles/test_perf.dir/build.make
test_perf: CMakeFiles/test_perf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable test_perf"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_perf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_perf.dir/build: test_perf
.PHONY : CMakeFiles/test_perf.dir/build

CMakeFiles/test_perf.dir/requires: CMakeFiles/test_perf.dir/test/test_perf.cpp.o.requires
.PHONY : CMakeFiles/test_perf.dir/requires

CMakeFiles/test_perf.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_perf.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_perf.dir/clean

CMakeFiles/test_perf.dir/depend:
	cd /home/tim/gravity/gravity/ThirdParty/cppdb-trunk && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tim/gravity/gravity/ThirdParty/cppdb-trunk /home/tim/gravity/gravity/ThirdParty/cppdb-trunk /home/tim/gravity/gravity/ThirdParty/cppdb-trunk /home/tim/gravity/gravity/ThirdParty/cppdb-trunk /home/tim/gravity/gravity/ThirdParty/cppdb-trunk/CMakeFiles/test_perf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_perf.dir/depend

