module shape_mod
  type shape
    integer :: color
    logical :: filled
    integer :: x
    integer :: y
  contains
    procedure :: isFilled
  end type shape
contains
  logical function isFilled(this)
    class(shape) :: this
    isFilled = this%filled
  end function
end module
