INCLUDE IRVINE32.inc
.data

    string BYTE "24K-0546", 0
    msg1 BYTE "Number of UpperCase Characters: ", 0
    msg2 BYTE "Number of LowerCase Characters: ", 0
.code
    main PROC

        MOV EAX, 0 ;upper case
        MOV EBX, 0 ;lower case

        MOV ECX, LENGTHOF string
        MOV ESI, OFFSET string
        loopstr:
            MOV DL, 'A'
            CMP [ESI], DL
            JL skip
            MOV DL, 'Z' + 1
            CMP[ESI], DL
            JL upperCase
            MOV DL, 'a'
            CMP [ESI], DL
            JL skip
            MOV DL, 'z' + 1
            CMP [ESI], DL
            JL lowerCase

            JMP skip

            upperCase:
                INC EAX
                JMP skip
            lowerCase:
                INC EBX
            skip:
            INC ESI
            LOOP loopstr

        MOV EDX, OFFSET msg1
        call WriteString
        call WriteDec
        call crlf

        MOV EDX, OFFSET msg2
        call WriteString
        XCHG EAX, EBX
        call WriteDec
        XCHG EAX, EBX
        call crlf

    exit
    main ENDP
END main