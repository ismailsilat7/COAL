
INCLUDE Irvine32.inc

.data
    intArr SWORD 0, 0, 0, 150, 120, 35, -12, 66, 4, 0
    msg1 BYTE "First Non-Zero value: ", 0
.code
main PROC
        MOV EAX, 0
        MOV ESI, OFFSET intArr
        check_nonZero:
            CMP SWORD PTR [ESI], 0
            JNE printNum
            ADD ESI, TYPE intArr
            JMP check_nonZero

        printNum:
            MOV AX, SWORD PTR [ESI]
            MOVSX EAX, AX 
            MOV EDX, OFFSET msg1
            call WriteString
            call WriteInt
            call crlf

    exit
main ENDP
END MAIN
