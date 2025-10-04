INCLUDE IRVINE32.INC
.data
    sizeMsg BYTE "Enter the size of the array: ", 0
    elementMsg BYTE "Enter array elements ", 0
    resultMsg BYTE "Result (1 = ALL ODD, 0 = NOT ALL ODD): ", 0

.code
    MAIN PROC

        MOV EDX, OFFSET sizeMsg
        call WriteString
        call ReadInt

        MOV ECX, EAX
        MOV EDX, OFFSET elementMsg
        call WriteString
        call crlf
        MOV EBX, 1
    getInput:
        call ReadInt
        AND EAX, 1
        CMP EAX, 0
        JNE skip
        MOV EBX, 0
        skip:
        loop getInput

        MOV EDX, OFFSET resultMsg
        call WriteString
        MOV EAX, EBX
        call WriteDEC
        

        

    exit
    MAIN ENDP
END MAIN