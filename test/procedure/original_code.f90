module integer_list_mod
  type :: integerList
   contains
     procedure :: addInteger     
     procedure :: printList => printIntegerList
     generic :: add => addInteger
  end type integerList

contains
  subroutine addInteger(this)
!    class(integerList) :: this
    type(integerList)  :: a
  end subroutine

  subroutine printIntegerList(this)
!    class(integerList) :: this
  end subroutine

end module integer_list_mod
