module mo_module
  implicit none
  
  contains

  subroutine sub1()
    use mo_kind, only : r4
    real(kind=r4) :: t
  end subroutine sub1



end module mo_module
