INCLUDE Irvine32.inc

.data
    arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20
    msg0 BYTE "Enter value to search: ", 0
    msg1 BYTE "Value found at index: ", 0
    msg2 BYTE "Value not found", 0
.code
main PROC
        
        MOV EDX, OFFSET msg0
        call WriteString
        call ReadDec
        

        MOV ECX, LENGTHOF arr
        MOV ESI, OFFSET arr
        MOV EBX, 0
        iterate:
            MOV BX, WORD PTR [ESI]
            CMP BX, AX
            JE found
            ADD ESI, TYPE arr
            LOOP iterate
        MOV EDX, OFFSET msg2
        call WriteString

        JMP Lexit

        found:
            MOV EDX, OFFSET msg1
            call WriteString
            MOV EAX, LENGTHOF arr
            SUB EAX, ECX
            call WriteDec

        Lexit:  

    exit
main ENDP
END MAIN
