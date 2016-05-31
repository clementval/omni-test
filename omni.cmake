# This file is released under terms of BSD license
# See LICENSE file for more information

# CMake file to define variable related to the OMNI Compiler programs.

find_package(Java REQUIRED)
include(UseJava)

set(
  OMNI_DEV_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../omni-compiler"
  CACHE FILEPATH "OMNI Compiler development repository location"
)

set(OMNI_F_FRONT ${OMNI_DEV_PATH}/F-FrontEnd/src/F_Front)
set(OMNI_F_BACK_JARS ${OMNI_DEV_PATH}/F-BackEnd/build/om-f-back.jar:${OMNI_DEV_PATH}/XcodeML-Common/build/om-common.jar)
set(OMNI_F_BACK xcodeml.f.util.omx2f)
set(XMOD_DIR __xmod__)
