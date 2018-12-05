PROGRAM PART2

    IMPLICIT NONE
    CHARACTER(64) :: lines(257)
    INTEGER :: i, j, k, numerr
    OPEN(unit=1, FILE='input', STATUS='OLD', ACTION='READ')
    
    DO i=1,257
         READ(1,*) lines(i)
    END DO
    DO i=1,257
        DO j=1,257
            numerr = 0
            DO k=1,26
                IF(lines(i)(k:k) /= lines(j)(k:k)) THEN
                    numerr = numerr + 1
                END IF
            END DO
            IF(numerr.EQ.1) THEN
                PRINT*, lines(i)
            END IF
        END DO
    END DO

END PROGRAM PART2
