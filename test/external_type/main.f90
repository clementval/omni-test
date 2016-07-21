
PROGRAM main
  USE testmod

  CLASS(mytype) :: this

  this%r1 = 0.1
  this%r2 = 0.2

  PRINT*, this%r1
  PRINT*, this%r2

END PROGRAM main
