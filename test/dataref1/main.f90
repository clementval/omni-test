PROGRAM main
  USE shape_mod
  
  type(shape) :: shp        ! declare an instance of shape
  type(square) :: sq        ! declare an instance of shape
  logical filled
  !filled = shp%isFilled()
  !CALL shp%isFilled()
  sq%x = 4.0
  sq%y = 4.0
  CALL sq%shape%print_coord()
  CALL sq%print_coord()
END PROGRAM
