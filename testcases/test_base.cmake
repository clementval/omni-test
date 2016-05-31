# This file is released under terms of BSD license
# See LICENSE file for more information

# OMNI Compiler test case base set up

# Set up input/output filenames
set(ORIGINAL_FILE  ${CMAKE_CURRENT_SOURCE_DIR}/original_code.f90)
set(XCODEML_FILE   ${CMAKE_CURRENT_SOURCE_DIR}/transformed_code.xml)
set(OUTPUT_FILE    ${CMAKE_CURRENT_SOURCE_DIR}/transformed_code.f90)
set(REFERENCE_FILE ${CMAKE_CURRENT_SOURCE_DIR}/reference.f90)

# Transform Fortran to XcodeML
add_custom_command(
  OUTPUT  ${XCODEML_FILE}
  COMMAND ${OMNI_F_FRONT} -o ${XCODEML_FILE} ${ORIGINAL_FILE}
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  DEPENDS ${ORIGINAL_FILE}
  COMMENT "Precoss original code with Fortran front-end (${OMNI_F_FRONT})"
)
add_custom_target(
  transform-${TEST_NAME}
  DEPENDS ${XCODEML_FILE}
)


# Target to clean the generated file
add_custom_target(
  clean-${TEST_NAME}
  COMMAND rm -f ${OUTPUT_FILE} ${XCODEML_FILE}
)

# Add local targets to the global targets
add_dependencies(${BUILD_TEST_TARGET} transform-${TEST_NAME})
add_dependencies(${CLEAN_TEST_TARGET} clean-${TEST_NAME})
