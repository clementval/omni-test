MODULE shape_mod
 use xmpf_coarray_decl
 TYPE :: shape
  INTEGER :: x
  INTEGER :: y
 END TYPE shape
 TYPE , EXTENDS ( shape ) :: square
 END TYPE square

CONTAINS
 SUBROUTINE select ( element )
  use xmpf_coarray_decl
  CLASS(shape) :: element

  SELECT TYPE ( element )
  CLASS IS ( shape )
   PRINT * ,"SHAPE"
  CLASS IS ( square )
   PRINT * ,"SQUARE"
  CLASS DEFAULT
   PRINT * ,"DEFAULT"
  END SELECT
 END SUBROUTINE select

END MODULE shape_mod

