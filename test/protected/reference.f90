MODULE counter_mod
 use xmpf_coarray_decl
 INTEGER , PROTECTED :: current = 0

CONTAINS
 FUNCTION next ( )
  use xmpf_coarray_decl
  INTEGER :: next

  current = current + 1
  next = current
  RETURN
 END FUNCTION next

END MODULE counter_mod

PROGRAM test_counter
 use xmpf_coarray_decl
 USE counter_mod

 PRINT * , next ( )
END PROGRAM test_counter

