INCLUDE IRVINE32.inc

.data
    array BYTE 50, 60, 70, 80 ; should turn into 60, 70, 80, 50

.code
    main PROC

    MOV ECX, LENGTHOF array - 1
    MOV ESI, OFFSET array
    
    MOV AL, [ESI]
    INC ESI

    rotate:
        MOV BL, [ESI]
        MOV [ESI - 1], BL
        INC ESI
        loop rotate
    MOV [ESI - 1], AL

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