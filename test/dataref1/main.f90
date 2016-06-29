PROGRAM main
  USE shape_mod
  
  type(shape) :: shp        ! declare an instance of shape
  logical filled
  filled = shp%isFilled()
END PROGRAM
