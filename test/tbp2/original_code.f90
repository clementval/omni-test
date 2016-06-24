MODULE FTTimerClass 
  IMPLICIT NONE
  PRIVATE
  INTEGER, PARAMETER, PRIVATE :: d = 15
  INTEGER, PARAMETER, PUBLIC  :: TP = SELECTED_REAL_KIND(d)
  INTEGER, PARAMETER, PUBLIC  :: TC_SECONDS = 0, TC_MINUTES = 1, TC_HOURS = 2 
  TYPE, PUBLIC :: FTTimer
     LOGICAL      , PRIVATE :: started    = .FALSE.
     LOGICAL      , PRIVATE :: stopped    = .FALSE.
     REAL(KIND=TP), PRIVATE :: startTime  = 0.0_TP
     REAL(KIND=TP), PRIVATE :: finishTime = 0.0_TP

  !   PROCEDURE, PASS :: start => startTimer
  !   PROCEDURE, PASS :: stop  => stopTimer
  !   PROCEDURE, PASS :: elapsedTime         
     PROCEDURE :: start => startTimer
     PROCEDURE :: stop  => stopTimer
     PROCEDURE :: elapsedTime         
  END TYPE FTTimer

CONTAINS

  SUBROUTINE startTimer(self)  
    IMPLICIT NONE
    CLASS(FTTimer) :: self
    self % started = .TRUE.
    CALL CPU_TIME(self % startTime)         
  END SUBROUTINE startTimer

  SUBROUTINE stopTimer(self)  
    IMPLICIT NONE
    CLASS(FTTimer) :: self
    CALL CPU_TIME(self % finishTime)
    self % stopped = .TRUE.
  END SUBROUTINE stopTimer

  FUNCTION elapsedTime(self,units)  
    IMPLICIT NONE
    CLASS(FTTimer)    :: self
    INTEGER, OPTIONAL :: units
    REAL(KIND=TP)     :: elapsedTime
    
    ! Return zero if the timer was never started
    IF ( .NOT.self % started )     THEN
       elapsedTime = 0.0_TP
       RETURN
    END IF 
    
    ! If the timer was not stopped, then return the 
    ! current time elapsed
    IF ( .NOT.self % stopped )     THEN
!       CALL self%stop() 
    END IF 

    elapsedTime =  self % finishTime - self % startTime

    ! Convert to requested units if present
    IF ( PRESENT(units) )     THEN
       SELECT CASE ( units )
          CASE( TC_MINUTES ) 
             elapsedTime = elapsedTime/60.0_TP
          CASE( TC_HOURS )
             elapsedTime = elapsedTime/3600.0_TP
          CASE DEFAULT
       END SELECT 
    END IF 

  END FUNCTION elapsedTime

END MODULE
