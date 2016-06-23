MODULE test

  TYPE person
    CHARACTER(LEN=10) :: name
    REAL              :: age
    INTEGER           :: id
  CONTAINS
    PROCEDURE :: display_person
  END TYPE person

CONTAINS

  SUBROUTINE display_person(p)
    CLASS(person), INTENT(IN) :: p
    TYPE(person) :: p1
    
    PRINT*, p%name
  END SUBROUTINE display_person

END MODULE test
