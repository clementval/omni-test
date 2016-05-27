 MODULE counter_mod
  INTEGER, PROTECTED :: current = 0
  CONTAINS

  INTEGER FUNCTION next()
    current = current + 1    ! current can be modified here
    next = current
    RETURN
  END FUNCTION next
END MODULE counter_mod

PROGRAM test_counter
  USE counter_mod
  PRINT *, next( )             ! Prints 1
 ! current = 42                 ! Error: variable is protected
END PROGRAM test_counter
