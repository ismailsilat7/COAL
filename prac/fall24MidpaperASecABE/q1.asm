INCLUDE Irvine32.inc

.data
    caloriesBurned WORD ?
    stepsWeek1 SBYTE 150
    stepsWeek2 SBYTE 58

.code
    main PROC

        MOVSX EAX, stepsWeek1
        MOVSX EBX, stepsWeek2
        MOVZX EDX, caloriesBurned

        MOV ECX, EAX
        ADD ECX, stepsWeek2

        SUB EBX, 5

        XCHG EAX, EBX

        MOV stepsWeek1, AL
        MOV stepsWeek2, BL

    exit
    main ENDP
END main