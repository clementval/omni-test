PROGRAM main
 use xmpf_coarray_decl
 USE shape_mod
 TYPE(shape) :: shp
 TYPE(square) :: sq

 CALL select ( shp )
 CALL select ( sq )
END PROGRAM main

