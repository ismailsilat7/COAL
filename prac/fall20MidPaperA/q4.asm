INCLUDE IRVINE32.inc
.data
    arrayD DD 362, 210, 900, 101, 450
    arrayB DB 10, 64, 76, 09, 100
    ismail DW 2 DUP(?)
.code
    MAIN PROC

        MOV ECX, 2
        MOV ESI, 0
    sum:
        MOV EAX, [arrayD + (ESI * TYPE arrayD) + TYPE arrayD]
        MOVZX BX, [arrayB + ESI * TYPE arrayB]
        ADD AX, BX
        MOV [ismail + ESI], AX
        ADD ESI, 2 
        LOOP sum

        MOV ECX, LENGTHOF ismail
        MOV ESI, OFFSET ismail
    DISPLAY:
        MOV BX, [ESI]
        MOVZX EAX, BX
        call WRITEDEC
        ADD ESI, TYPE ismail
        call crlf
        LOOP DISPLAY

    exit
    MAIN ENDP
END MAIN