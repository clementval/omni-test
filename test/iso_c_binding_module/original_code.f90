MODULE consumer
  USE, INTRINSIC :: iso_c_binding 


INTERFACE
  FUNCTION dosleep(seconds) BIND (C, name="sleep")
!    IMPORT :: c_int
    INTEGER (c_int) :: dosleep
!    INTEGER (c_int), INTENT(IN), VALUE :: seconds
  END FUNCTION dosleep
END INTERFACE

CONTAINS
  FUNCTION SLEEP() BIND(C, NAME="sleep") 

  END FUNCTION SLEEP

  SUBROUTINE dummy() BIND(C, NAME="dummySleep") 

  END SUBROUTINE dummy
END MODULE consumer
