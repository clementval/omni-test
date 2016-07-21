PROGRAM main
  USE testmod

  CLASS(mytype), ALLOCATABLE :: this
  CLASS(mytype2), ALLOCATABLE :: this2

  ALLOCATE(this)
  ALLOCATE(this2)

  this%r1 = 0.1
  this%r2 = 0.2

  this2%r1 = 0.1
  this2%r2 = 0.2

  CALL test(this)
  CALL test(this2)

  PRINT*, this%r1
  PRINT*, this%r2

  DEALLOCATE(this)
  DEALLOCATE(this2)

END PROGRAM main
