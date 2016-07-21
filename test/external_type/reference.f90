MODULE testmod
 use xmpf_coarray_decl
 TYPE :: mytype
  REAL :: r1
  REAL :: r2
 END TYPE mytype
 TYPE , EXTENDS ( mytype ) :: mytype2
  REAL :: r3
 END TYPE mytype2

CONTAINS
 SUBROUTINE test ( t )
  use xmpf_coarray_decl
  CLASS(mytype) :: t

  SELECT TYPE ( t )
  CLASS IS ( mytype )
   t % r1 = t % r2
  CLASS IS ( mytype2 )
   t % r3 = t % r2
  END SELECT
 END SUBROUTINE test

END MODULE testmod

