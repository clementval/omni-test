PROGRAM test_tbp4
  USE shape

  TYPE(point) :: a
  TYPE(point) :: b
  REAL :: result

  a%x = 1.0
  a%y = 1.0

  b%x = 3.0
  b%y = 3.0

  result = a%length(b)

  PRINT*,'LENGTH A-B = ', result

END PROGRAM test_tbp4
