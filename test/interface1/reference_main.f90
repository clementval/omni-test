PROGRAM test_interface
 use xmpf_coarray_decl
 USE mod_interface
 INTEGER :: i
 REAL :: r

 i = 1
 r = 2.5
 CALL length ( i )
 CALL length ( r )
END PROGRAM test_interface

