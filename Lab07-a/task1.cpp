INCLUDE Irvine32.inc

.data
    msg1 BYTE "AX: ",0
    msg2 BYTE "BX: ", 0
.code
main PROC
    
    MOV EAX, 0
    MOV EBX, 0

    MOV AX, 45 ; A = 45
    MOV BX, 20 ; B = 20

    CMP AX,BX
    JE equal_case
    JG greater_case
    JMP less_case

    equal_case:
        MOV CX, 2
        MOV DX, 0
        DIV CX
        MOV BX, AX
        JMP Lexit

    greater_case:
        SUB AX, BX
        JMP Lexit

    less_case:
        ADD AX, BX

    Lexit:
        MOV EDX, OFFSET msg1
        call WriteString
        call WriteDec
        call crlf

        MOV EDX, OFFSET msg2
        MOV AX, BX
        call WriteString
        call WriteDec
        call crlf


    exit
main ENDP
END MAIN