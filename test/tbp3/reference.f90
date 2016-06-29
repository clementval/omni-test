MODULE tbpinterfacetest
 use xmpf_coarray_decl
 TYPE :: point
  REAL :: x
  REAL :: y
  PROCEDURE , PASS :: length => point_length
 END TYPE point

CONTAINS
 FUNCTION point_length ( a , b )
  use xmpf_coarray_decl
  REAL :: point_length
  CLASS(point) , INTENT(IN) :: a
  CLASS(point) , INTENT(IN) :: b

  point_length = sqrt ( ( a % x - b % x ) ** ( 2 ) + ( a % y - b % y ) ** ( 2&
   ) )
 END FUNCTION point_length

END MODULE tbpinterfacetest

