#!/bin/bash

FFRONT_REFERENCE="/Users/clementval/versioning/meteoswiss/omni-compiler-base/F-FrontEnd"
FFRONT_DEV="/Users/clementval/versioning/meteoswiss/omni-compiler/F-FrontEnd"



function runAllTests {
  FFRONT_DIR=$1
  FFRONT_TC=$2
  local DUMMY_XML="dummy_output.xml"
  echo "RUNNING ALL TESTS ($FFRONT_TC) FOR: $FFRONT_DIR"

  local FFRONT_EXEC="/src/F_Front"
  local FFRONT_TEST="/test/testdata"

  local FAILED_TESTS=0
  local SUCCESSTESTS=0

  rm -f $FFRONT_TC
  
  for i in $(ls $FFRONT_DIR$FFRONT_TEST/*.f90 $FFRONT_DIR$FFRONT_TEST/*.f)
  do 
    $FFRONT_DIR$FFRONT_EXEC -o $DUMMY_XML $i 2>&1 $FRONT_TC 
    if [[ $? != 0 ]]
    then
      NAKED_TC=${i#$FFRONT_DIR}
      echo "TC failed $NAKED_TC" >> $FFRONT_TC 
      FAILED_TESTS=$(($FAILED_TESTS+1))
    else
      SUCCESSTESTS=$(($SUCCESSTESTS+1))
    fi
    rm -f $DUMMY_XML
  done
  
  echo "FAILED:  $FAILED_TESTS"
  echo "SUCCESS: $SUCCESSTESTS"
}



# Run all tests in the references to be able to compare the ouputs

REF_OUTPUT="ref.output"
DEV_OUTPUT="dev.output"

runAllTests $FFRONT_REFERENCE $REF_OUTPUT

runAllTests $FFRONT_DEV $DEV_OUTPUT

diff $REF_OUTPUT $DEV_OUTPUT

