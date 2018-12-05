PROGRAM PART1
  IMPLICIT NONE
  character(64) :: buffer
  character(26) :: alphabet = "abcdefghijklmnopqrstuvwxyz"
  LOGICAL :: istwo = .false., isthree = .false.;
  integer :: twos = 0, threes = 0;
  integer :: i, j, total = 0;
  character(1) :: ref;
  OPEN(unit=1, FILE='input', STATUS='OLD', ACTION='READ')
  
  DO WHILE(1.EQ.1)
    READ(1,*) buffer;
    DO i=1,26
      ref = alphabet(i:i)
      DO j=1,len(buffer)
       if(buffer(j:j).EQ.ref) THEN
         total = total + 1
       END IF
      END DO
      IF(total.EQ.2) THEN
        istwo = .true.
      END IF
      IF(total.EQ.3) THEN
        isthree = .true.
      END IF
      total = 0
    END DO
    IF(istwo) THEN
      twos = twos + 1
    END IF
    IF(isthree) THEN
      threes = threes + 1
    END IF
    istwo = .false.
    isthree = .false.
    PRINT *, "twos: ", twos
    PRINT *, "threes: ", threes
    PRINT *, "checksum: ", threes * twos
    PRINT *, ""
  END DO

END PROGRAM PART1
