;Write a program that implements the following arithmetic expression:
;EAX = −val2 + 7 − val3 + val1
;Use the following data definitions:
;val1 SDWORD 8
;val2 SDWORD 15
;val3 SDWORD 20
;In comments next to each instruction, write the hexadecimal value of EAX. Insert a call
;DumpRegs statement at the end of the program.
INCLUDE IRVINE32.INC
.data
    val1 SDWORD 8
    val2 SDWORD 15
    val3 SDWORD 20
.code
    main PROC

        MOV EAX, val2 ; 0000000F
        NEG EAX ; FFFFFFF1
        ADD EAX, 7 ; FFFFFFF8
        SUB EAX, val3 ; FFFFFFFE4
        ADD EAX, val1 ; FFFFFFEC

        call WRITEHEX
        call crlf
        call WRITEINT
    exit
    main ENDP
END main