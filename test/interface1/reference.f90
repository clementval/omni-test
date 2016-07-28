MODULE mod_interface
 use xmpf_coarray_decl
 INTERFACE length
  MODULE PROCEDURE length_real , length_int
 END INTERFACE

CONTAINS
 SUBROUTINE length_real ( a )
  use xmpf_coarray_decl
  REAL :: a

  PRINT * , a
 END SUBROUTINE length_real

 SUBROUTINE length_int ( a )
  use xmpf_coarray_decl
  INTEGER :: a

  PRINT * , a
 END SUBROUTINE length_int

END MODULE mod_interface

