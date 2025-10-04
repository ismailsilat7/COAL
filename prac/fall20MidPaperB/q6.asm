INCLUDE Irvine32.inc

.data
    array1 BYTE 8 DUP(?)
    array2 BYTE 8 DUP(?)

.code
    main PROC

        MOV ECX, LENGTHOF array1
        MOV ESI, OFFSET array1
        MOV AL, 0
    iterate1:
        INC AL
        MOV [ESI], AL
        ADD ESI, TYPE array1    
        LOOP iterate1
        
        MOV ECX, (SIZEOF array2/TYPE array2)
        MOV ESI, OFFSET array2
    iterate2:
        INC AL
        MOV [ESI], AL
        ADD ESI, TYPE array2    
        LOOP iterate2

        MOV ECX, LENGTHOF array1
        MOV ESI, OFFSET array1
    DISPLAY1:
        MOV BL, [ESI]
        MOVZX EAX, BL
        call WRITEDEC
        ADD ESI, TYPE array1
        call crlf
        LOOP DISPLAY1

        call crlf
        MOV ECX, LENGTHOF array2
        MOV ESI, OFFSET array2
    DISPLAY2:
        MOV BL, [ESI]
        MOVZX EAX, BL
        call WRITEDEC
        ADD ESI, TYPE array2
        call crlf
        LOOP DISPLAY2

    exit
    main ENDP
END main