INCLUDE Irvine32.inc

.data
    Array1 DB 11, 22, 33
    Array2 DW 135, 195, 210
    Array3 DD 1182, 5394, 3013
    
    result DD 3 DUP(?)
.code
    main PROC

        MOV ECX, 3
        MOV ESI, 0
    sum:
        DEC BYTE PTR [Array1 + ESI * TYPE Array1]
        DEC WORD PTR [Array2 + ESI * TYPE Array2]
        DEC DWORD PTR [Array3 + ESI * TYPE Array3]

        MOV EAX, DWORD PTR [Array3 + ESI * TYPE Array3]
        MOVZX EBX, WORD PTR [Array2 + ESI * TYPE Array2]
        ADD EAX, EBX
        MOVZX EBX, BYTE PTR [Array1 + ESI * TYPE Array1]
        ADD EAX, EBX

        MOV [result + ESI * TYPE result], EAX
        INC ESI
        loop sum

        MOV ECX, LENGTHOF result
        MOV ESI, OFFSET result
    DISPLAY:
        MOV EAX, [ESI]
        call WRITEDEC
        ADD ESI, TYPE result
        call crlf
        LOOP DISPLAY

    exit
    main ENDP
END main