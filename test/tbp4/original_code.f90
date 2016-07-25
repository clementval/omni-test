MODULE shape
  IMPLICIT NONE

  TYPE :: POINT
    REAL :: X, Y
    CONTAINS
      PROCEDURE, PASS :: LENGTH
  END TYPE POINT

CONTAINS

  FUNCTION LENGTH (A, B) RESULT(result_value)
    CLASS (POINT), INTENT (IN) :: A, B
    REAL :: result_value
    result_value = SQRT ( (A%X - B%X)**2 + (A%Y - B%Y)**2 )
  END FUNCTION LENGTH

END MODULE shape
