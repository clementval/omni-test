PROGRAM main
 use xmpf_coarray_decl
 USE shape_mod
 TYPE(shape) :: shp
 TYPE(square) :: sq
 LOGICAL :: filled
 sq % x = 4.0
 sq % y = 4.0
 CALL sq % print_coord
 CALL sq % shape % print_coord
END PROGRAM main

