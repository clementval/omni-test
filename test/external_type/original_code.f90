MODULE testmod

  TYPE :: mytype
    REAL :: r1
    REAL :: r2
  END TYPE

  TYPE, EXTENDS(mytype) :: mytype2
    REAL :: r3
  END TYPE

CONTAINS

SUBROUTINE test(t) 
  CLASS(mytype) :: t 
 
  SELECT TYPE (t) 
    CLASS IS (mytype) 
      t%r1 = t%r2 
    CLASS IS (mytype2) 
      t%r3 = t%r2     
  END SELECT 
END SUBROUTINE


END MODULE testmod
