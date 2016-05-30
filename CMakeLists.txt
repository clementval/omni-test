# This file is released under terms of BSD license
# See LICENSE file for more information

# This CMakeLists.txt file is the entry point for the configuration and the
# compilation of the CLAW Fortran compiler.

cmake_minimum_required(VERSION 2.8)

project(omni-test)

enable_language(Fortran)
enable_testing()

add_subdirectory(testcases)
