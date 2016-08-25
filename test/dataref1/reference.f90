MODULE shape_mod
 use xmpf_coarray_decl
 TYPE :: shape
  INTEGER :: color
  LOGICAL :: filled
  INTEGER :: x
  INTEGER :: y
  CONTAINS
  PROCEDURE :: isfilled
  PROCEDURE :: print_coord
 END TYPE shape
 TYPE , EXTENDS ( shape ) :: square
 END TYPE square

CONTAINS
 FUNCTION isfilled ( this )
  use xmpf_coarray_decl
  LOGICAL :: isfilled
  CLASS(shape) :: this

  isfilled = this % filled
 END FUNCTION isfilled

 SUBROUTINE print_coord ( this )
  use xmpf_coarray_decl
  CLASS(shape) :: this

  PRINT * , this % x
  PRINT * , this % y
 END SUBROUTINE print_coord

END MODULE shape_mod

