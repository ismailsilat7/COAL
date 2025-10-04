INCLUDE Irvine32.inc

.data
    myArray BYTE 1,2,3,4,5,6,7,8,9,10
    result WORD 10 DUP(?)
.code
    main PROC

        MOV ESI, OFFSET myArray
        MOV EDI, OFFSET result

        MOV ECX, 10
    iterate:
        MOV EAX, 0
        MOVZX EBX, BYTE PTR [ESI]

        MOV EDX, ECX
        MOV ECX, EBX
        square:
            ADD EAX, EBX
            LOOP square
        MOV [EDI], AX
        INC ESI
        ADD EDI, 2
        MOV ECX, EDX
        LOOP iterate

        MOV ECX, LENGTHOF result
        MOV ESI, OFFSET result
    DISPLAY:
        MOV BX, [ESI]
        MOVZX EAX, BX
        call WRITEDEC
        ADD ESI, TYPE result
        call crlf
        LOOP DISPLAY

    exit
    main ENDP
END main