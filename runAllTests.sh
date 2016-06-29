#!/bin/bash

FFRONT_REFERENCE="/Users/clementval/versioning/meteoswiss/omni-compiler-base/F-FrontEnd"
FFRONT_DEV="/Users/clementval/versioning/meteoswiss/omni-compiler/F-FrontEnd"



# These tests are failing on the reference so skip them in the dev

SKIPPED_TESTS="/test/testdata/_dropdep_use_parameters.f90 \
/test/testdata/aster_comment.f90 \
/test/testdata/blockdata.f90 \
/test/testdata/char_length_param.f90 \
/test/testdata/child_function_call.f90 \
/test/testdata/contains.f90 \
/test/testdata/contains2.f90 \
/test/testdata/contains8.f90 \
/test/testdata/contains_logicalfunc.f90 \
/test/testdata/def_module_include.f90 \
/test/testdata/inquire_by_output_list.f90 \
/test/testdata/many_cont_line.f \
/test/testdata/post_declared_sub_sub_function.f90 \
/test/testdata/post_declared_sub_sub_function2.f90 \
/test/testdata/restricted_expression.f90 \
/test/testdata/restricted_expression2.f90 \
/test/testdata/restricted_expression5.f90"


function runAllTests {
  local FFRONT_DIR=$1
  local FFRONT_TC=$2
  local DUMMY_XML="dummy_output.xml"
  echo "RUNNING ALL TESTS ($FFRONT_TC) FOR: $FFRONT_DIR"

  local FFRONT_EXEC="/src/F_Front"
  local FFRONT_TEST="/test/testdata"

  local FAILED_TESTS=0
  local SUCCESSTESTS=0

  rm -f $FFRONT_TC
  
  for i in $(ls $FFRONT_DIR$FFRONT_TEST/*.f90 $FFRONT_DIR$FFRONT_TEST/*.f)
  do 
    NAKED_TC=${i#$FFRONT_DIR}
    if [[ $SKIPPED_TESTS =~ $NAKED_TC ]]
    then 
      echo "Skip $i, in skip list"
    else 
      COUNTER=0
      while [  $COUNTER -lt 5 ] && [ $? -ne 0 ]
      do
        $FFRONT_DIR$FFRONT_EXEC -o $DUMMY_XML $i 2>&1 $FRONT_TC 
        let COUNTER=COUNTER+1 
      done



      if [ $? -ne 0 ] 
      then
        echo "$NAKED_TC" >> $FFRONT_TC 
        FAILED_TESTS=$(($FAILED_TESTS+1))
      else
        SUCCESSTESTS=$(($SUCCESSTESTS+1))
      fi
      rm -f $DUMMY_XML
    fi
  done
  
  echo "FAILED:  $FAILED_TESTS"
  echo "SUCCESS: $SUCCESSTESTS"
}



# Run all tests in the references to be able to compare the ouputs

REF_OUTPUT="ref.output"
DEV_OUTPUT="dev.output"

runAllTests $FFRONT_REFERENCE $REF_OUTPUT

#runAllTests $FFRONT_DEV $DEV_OUTPUT
#
#diff $REF_OUTPUT $DEV_OUTPUT

