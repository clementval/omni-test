MODULE useful
 use xmpf_coarray_decl
 INTEGER , PARAMETER :: n = 2
 REAL ( KIND= 8 ) , PARAMETER :: xmin = 1
 REAL ( KIND= 8 ) , PARAMETER :: xmax = 10
 REAL ( KIND= 8 ) , PARAMETER :: pi = 3.1415926535898
 COMPLEX ( KIND= 8 ) :: green ( 1 : n , 1 : n )
 COMPLEX ( KIND= 8 ) :: solution ( 1 : n )
 COMPLEX ( KIND= 8 ) :: k = ( 2.0 , 0.0 )

CONTAINS
 SUBROUTINE y ( n1 )
  use xmpf_coarray_decl
  INTEGER :: n1


 CONTAINS
  FUNCTION x ( n1 )
   use xmpf_coarray_decl
   REAL :: x
   REAL :: n1

   x = n1 * ( xmax - xmin ) / n
  END FUNCTION x

 END SUBROUTINE y

END MODULE useful

