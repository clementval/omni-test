MODULE test_tbp4
 use xmpf_coarray_decl
 USE shape

CONTAINS
 FUNCTION test ( a , b )
  use xmpf_coarray_decl
  REAL :: test
  TYPE(point) :: a
  TYPE(point) :: b

  a % x = 1.0
  a % y = 1.0
  b % x = 3.0
  b % y = 3.0
  test = a % length ( b )
  test = a % plen ( b )
  PRINT * ,"LENGTH A-B = " , test
 END FUNCTION test

END MODULE test_tbp4

