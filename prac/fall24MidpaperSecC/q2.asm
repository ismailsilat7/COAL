INCLUDE IRVINE32.inc

.data
    array BYTE 50, 60, 70, 80 ; should turn into 80, 50, 60, 70

.code
    main PROC

    MOV ECX, LENGTHOF array - 1
    MOV AL, [array + ECX]
    MOV ESI, OFFSET array

    MOV BL, [ESI]
    MOV [ESI], AL
    INC ESI
    rotate:
        XCHG BL, [ESI]
        INC ESI
        loop rotate

    MOV ECX, LENGTHOF array
    MOV ESI, OFFSET array
    DISPLAY:
        MOVZX EAX, BYTE PTR [ESI]
        call WRITEDEC
        call crlf
        ADD ESI, TYPE array
        LOOP DISPLAY   

    exit
    main ENDP
END main