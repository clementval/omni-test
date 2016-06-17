MODULE consumer
  USE, INTRINSIC :: iso_c_binding 


CONTAINS
  FUNCTION SLEEP() BIND(C, NAME="sleep") 

  END FUNCTION SLEEP

  SUBROUTINE dummy() BIND(C, NAME="dummySleep") 

  END SUBROUTINE dummy
END MODULE consumer
