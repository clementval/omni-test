module shape_mod
  type shape
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
  contains
    procedure :: isFilled
    procedure :: print_coord
  end type shape

  type, extends(shape) :: square
  end type

contains
  logical function isFilled(this)
    class(shape) :: this
    isFilled = this%filled
  end function

  SUBROUTINE print_coord(this)
    class(shape) :: this
    print*,this%x
    print*,this%y
  END SUBROUTINE
end module
