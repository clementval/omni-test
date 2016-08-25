MODULE fttimerclass
 use xmpf_coarray_decl
 INTEGER , PRIVATE , PARAMETER :: d = 15
 INTEGER , PUBLIC , PARAMETER :: tp = selected_real_kind ( d )
 INTEGER , PUBLIC , PARAMETER :: tc_seconds = 0
 INTEGER , PUBLIC , PARAMETER :: tc_minutes = 1
 INTEGER , PUBLIC , PARAMETER :: tc_hours = 2
 TYPE , PUBLIC :: fttimer
  PRIVATE
  LOGICAL , PRIVATE :: started = .FALSE.
  LOGICAL , PRIVATE :: stopped = .FALSE.
  REAL ( KIND= tp ) , PRIVATE :: starttime = 0.0_tp
  REAL ( KIND= tp ) , PRIVATE :: finishtime = 0.0_tp
  CONTAINS
  PROCEDURE , PASS :: start => starttimer
  PROCEDURE , PASS :: stop => stoptimer
  PROCEDURE , PASS :: elapsedtime
 END TYPE fttimer
 PRIVATE :: elapsedtime

CONTAINS
 SUBROUTINE starttimer ( self )
  use xmpf_coarray_decl
  CLASS(fttimer) :: self

  self % started = .TRUE.
  CALL cpu_time ( self % starttime )
 END SUBROUTINE starttimer

 SUBROUTINE stoptimer ( self )
  use xmpf_coarray_decl
  CLASS(fttimer) :: self

  CALL cpu_time ( self % finishtime )
  self % stopped = .TRUE.
 END SUBROUTINE stoptimer

 FUNCTION elapsedtime ( self , units )
  use xmpf_coarray_decl
  REAL ( KIND= tp ) :: elapsedtime
  CLASS(fttimer) :: self
  INTEGER , OPTIONAL :: units

  IF ( ( .NOT. self % started ) ) THEN
   elapsedtime = 0.0_tp
   RETURN
  END IF
  IF ( ( .NOT. self % stopped ) ) THEN
  END IF
  elapsedtime = self % finishtime - self % starttime
  IF ( present ( units ) ) THEN
   SELECT CASE ( units )
   CASE ( tc_minutes )
    elapsedtime = elapsedtime / 60.0_tp
   CASE ( tc_hours )
    elapsedtime = elapsedtime / 3600.0_tp
   CASE DEFAULT
   END SELECT
  END IF
 END FUNCTION elapsedtime

END MODULE fttimerclass

