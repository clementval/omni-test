# This file is released under terms of BSD license
# See LICENSE file for more information

# This CMakeLists.txt file is the entry point for the compilation and the
# execution of simple test cases for the OMNI Compiler Fortran front-end and
# back-end

cmake_minimum_required(VERSION 2.8)

project(omni-test)

enable_language(Fortran)

enable_testing()

include(omni.cmake)

# set up global transform and clean target
set(BUILD_TEST_TARGET transformation)
set(CLEAN_TEST_TARGET clean-transformation)
add_custom_target(${BUILD_TEST_TARGET})
add_custom_target(${CLEAN_TEST_TARGET})

# Add test suite directory
add_subdirectory(testcases)
