INCLUDE IRVINE32.INC
.data
    subject1 DWORD 70, 45, 60, 55, 80
    subject2 DWORD 65, 55, 80, 50, 70
    subject3 DWORD 80, 65, 50, 60, 90
.code
    MAIN PROC

        MOV ECX, 5
        MOV EAX, 0
        MOV ESI, 0
        MOV EBX, 0
    iterate:
        
        MOV EAX, [subject1 + ESI]
        CMP EAX, 50
        JL failed

        MOV EAX, [subject2 + ESI]
        CMP EAX, 50
        JL failed

        MOV EAX, [subject3 + ESI]
        CMP EAX, 50
        JL failed

        INC EBX

        failed:
        ADD ESI, TYPE subject1
        LOOP iterate

        MOV EAX, EBX
        call WriteInt

    exit
    MAIN ENDP
END MAIN