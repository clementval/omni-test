# This file is released under terms of BSD license
# See LICENSE file for more information

# This CMakeLists.txt file is the entry point for the configuration and the
# compilation of the CLAW Fortran compiler.

cmake_minimum_required(VERSION 2.8)

project(omni-test)

enable_language(Fortran)
enable_testing()

find_package(Java REQUIRED)
include(UseJava)

set(OMNI_DEV_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../omni-compiler" CACHE FILEPATH "OMNI Compiler development repository location")

set(OMNI_F_FRONT ${OMNI_DEV_PATH}/F-FrontEnd/src/F_Front)
set(OMNI_F_BACK  ${OMNI_DEV_PATH}/F-BackEnd/build/om-f-back.jar)

add_subdirectory(testcases)
