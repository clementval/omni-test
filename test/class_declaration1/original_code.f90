MODULE test

  TYPE person
    CHARACTER(LEN=10) :: name
    REAL              :: age
    INTEGER           :: id
  CONTAINS
    PROCEDURE :: display_person
    PROCEDURE :: get_size
  END TYPE person

CONTAINS

  PURE FUNCTION get_size(this)
    CLASS(person), INTENT(IN) :: this
    INTEGER :: get_size
    get_size = 10
  END FUNCTION

  SUBROUTINE display_person(this)
    CLASS(person), INTENT(IN) :: this
    REAL :: d(1:this%get_size())

    PRINT*, this%name
  END SUBROUTINE display_person

END MODULE test
