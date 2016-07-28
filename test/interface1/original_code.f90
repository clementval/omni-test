MODULE mod_interface
  IMPLICIT NONE

  INTERFACE length
    MODULE PROCEDURE length_real
    MODULE PROCEDURE length_int
  END INTERFACE

CONTAINS

  SUBROUTINE length_real(a)
    REAL :: a
    PRINT*, a
  END SUBROUTINE

  SUBROUTINE length_int(a)
    INTEGER :: a
    PRINT*, a
  END SUBROUTINE

END MODULE mod_interface
