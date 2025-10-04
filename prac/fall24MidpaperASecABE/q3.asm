INCLUDE Irvine32.inc

.data
    week1 DWORD 5, 3, 7, 2, 4
    week2 DWORD 4, 6, 1, 3, 5
    total DWORD 5 DUP(?)

    msg BYTE "Total for each snack sales in week1 & week2 separated by commas", 0
    comma BYTE ','
.code
    main PROC

        MOV ECX, 0
        MOV EDI, OFFSET total

        MOV EAX, [week1 + ECX * TYPE week1]
        ADD EAX, [week2 + ECX * TYPE week2]
        MOV [EDI], EAX
        ADD EDI, TYPE total
        INC ECX

        MOV EAX, [week1 + ECX * TYPE week1]
        ADD EAX, [week2 + ECX * TYPE week2]
        MOV [EDI], EAX
        ADD EDI, TYPE total
        INC ECX

        MOV EAX, [week1 + ECX * TYPE week1]
        ADD EAX, [week2 + ECX * TYPE week2]
        MOV [EDI], EAX
        ADD EDI, TYPE total
        INC ECX

        MOV EAX, [week1 + ECX * TYPE week1]
        ADD EAX, [week2 + ECX * TYPE week2]
        MOV [EDI], EAX
        ADD EDI, TYPE total
        INC ECX

        MOV EAX, [week1 + ECX * TYPE week1]
        ADD EAX, [week2 + ECX * TYPE week2]
        MOV [EDI], EAX

        MOV ESI, OFFSET total
        MOV EDX, OFFSET msg
        call WriteString
        call crlf

        MOV EAX, [ESI]
        call WriteInt
        MOV AL, comma
        call WriteChar
        ADD ESI, TYPE total

        MOV EAX, [ESI]
        call WriteInt
        MOV AL, comma
        call WriteChar
        ADD ESI, TYPE total

        MOV EAX, [ESI]
        call WriteInt
        MOV AL, comma
        call WriteChar
        ADD ESI, TYPE total

        MOV EAX, [ESI]
        call WriteInt
        MOV AL, comma
        call WriteChar
        ADD ESI, TYPE total

        MOV EAX, [ESI]
        call WriteInt

    exit
    main ENDP
END main