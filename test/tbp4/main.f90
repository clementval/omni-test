MODULE test_tbp4
  USE shape

CONTAINS

  REAL FUNCTION test(a,b)
    TYPE(point) :: a
    TYPE(point) :: b
    REAL :: test

        a%x = 1.0
        a%y = 1.0

        b%x = 3.0
        b%y = 3.0

        test = a%plen(b)

        PRINT*,'LENGTH A-B = ', test
  END FUNCTION test
END MODULE test_tbp4
