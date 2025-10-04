INCLUDE IRVINE32.inc
.data

    Aa BYTE 0
    Bb BYTE 5
    Cc BYTE 4
    Ddd BYTE 6

.code
    main PROC

        MOVZX EAX, Aa
        MOVZX EBX, Bb
        ADD EAX, EBX

        MOVZX EBX, Cc
        MOVZX ECX, Ddd
        SUB EBX, ECX

        SUB EAX, EBX

        MOV Aa, AL

        call WriteInt

    exit
    main ENDP
END main