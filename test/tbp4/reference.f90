MODULE shape
 use xmpf_coarray_decl
 TYPE :: point
  REAL :: x
  REAL :: y
  PROCEDURE , PASS :: length
  GENERIC :: len => length
 END TYPE point

CONTAINS
 FUNCTION length ( a , b ) RESULT(result_value)
  use xmpf_coarray_decl
  REAL :: result_value
  CLASS(point) , INTENT(IN) :: a
  CLASS(point) , INTENT(IN) :: b

  result_value = sqrt ( ( a % x - b % x ) ** ( 2 ) + ( a % y - b % y ) ** ( 2&
   ) )
 END FUNCTION length

END MODULE shape

