# This file is released under terms of BSD license
# See LICENSE file for more information

# OMNI Compiler test case base set up

# Set up input/output filenames
set(ORIGINAL_FILE  ${CMAKE_CURRENT_SOURCE_DIR}/original_code.f90)
set(XCODEML_FILE   ${CMAKE_CURRENT_SOURCE_DIR}/transformed_code.xml)
set(OUTPUT_FILE    ${CMAKE_CURRENT_SOURCE_DIR}/transformed_code.f90)
set(REFERENCE_FILE ${CMAKE_CURRENT_SOURCE_DIR}/reference.f90)

# Transform Fortran to XcodeML to Fortran
add_custom_target(transform-${TEST_NAME}
  ${OMNI_F_FRONT} -o ${XCODEML_FILE} ${ORIGINAL_FILE}
  COMMAND ${Java_JAVA_EXECUTABLE} -cp ${OMNI_F_BACK_JARS} ${OMNI_F_BACK} -l -w 80 -o ${OUTPUT_FILE} ${XCODEML_FILE}
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  DEPENDS ${ORIGINAL_FILE}
  COMMENT "Process XcodeML to Fortran with OMNI Fortran back-end (${OMNI_F_BACK})"
)

# Target to clean the generated file
add_custom_target(
  clean-${TEST_NAME}
  COMMAND rm -f ${OUTPUT_FILE} ${XCODEML_FILE} *.xmod
)

# Add local targets to the global targets
add_dependencies(${BUILD_TEST_TARGET} transform-${TEST_NAME})
add_dependencies(${CLEAN_TEST_TARGET} clean-${TEST_NAME})

# Add test targets
add_test(NAME omni-transform-${TEST_NAME} COMMAND "${CMAKE_COMMAND}"  --build ${CMAKE_BINARY_DIR} --target transform-${TEST_NAME})
add_test(NAME omni-compare-${TEST_NAME} COMMAND diff ${OUTPUT_FILE} ${REFERENCE_FILE})
set_tests_properties(omni-compare-${TEST_NAME} PROPERTIES DEPENDS omni-transform-${TEST_NAME})
