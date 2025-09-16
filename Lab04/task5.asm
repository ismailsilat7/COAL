;Write a program to:
; Define a constant named MAX using = with value 100.
; Define another constant named MIN using EQU with value 10.
; Use these constants to initialize two variables and then add them together.
; Show the sum with WriteInt.
INCLUDE Irvine32.inc
MAX = 100 ; declare MAX with = directive (reassignable)
MIN EQU 10 ; declare MIN with EQU directive (not reassignable)
.data 
    var1 BYTE ?
    var2 BYTE ?
    sum BYTE ?
.code
    main PROC
        MOV AL, MAX
        MOV var1, AL ; Store MAX in var1

        MOV AL, MIN
        MOV var2, AL ; Store MIN in var2

        MOV AL, var1 
        ADD AL, var2 ; Add var1 & var2

        MOV sum, AL ; store in result

        MOVZX EAX, sum
        call WriteInt ; display result

    exit
    main ENDP
    END main