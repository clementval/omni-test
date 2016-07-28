MODULE shape
  IMPLICIT NONE

  TYPE :: point
    REAL :: x, y
    CONTAINS
      PROCEDURE :: length
      GENERIC :: plen => length
  END TYPE POINT

CONTAINS

  FUNCTION length (a, b) RESULT(result_value)
    CLASS (point), INTENT (IN) :: a, b
    REAL :: result_value
    result_value = SQRT ( (a%x - b%x)**2 + (a%y - b%y)**2 )
  END FUNCTION length

END MODULE shape
