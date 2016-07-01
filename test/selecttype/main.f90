PROGRAM main
  USE shape_mod

  type(shape) :: shp        ! declare an instance of shape
  type(square) :: sq        ! declare an instance of shape

  CALL select(shp)
  CALL select(sq)

END PROGRAM
