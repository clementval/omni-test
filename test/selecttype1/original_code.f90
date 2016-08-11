module shape_mod
  type shape
    INTEGER :: x
    INTEGER :: y
  end type shape

  type, extends(shape) :: square
  end type

CONTAINS
  SUBROUTINE select(element)
    CLASS(shape) :: element

    SELECT TYPE (element)
    CLASS IS (shape)
        PRINT*,'SHAPE'
    CLASS IS (square)
        PRINT*,'SQUARE'
    CLASS DEFAULT
        PRINT*,'DEFAULT'
    END SELECT
  END SUBROUTINE select
end module
