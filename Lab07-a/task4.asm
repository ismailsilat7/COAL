INCLUDE Irvine32.inc

.data
    msg0 BYTE "Enter day num to get it in word: ", 0
    msg1 BYTE "Monday", 0
    msg2 BYTE "Tuesday", 0
    msg3 BYTE "Wednesday", 0
    msg4 BYTE "Thursday", 0
    msg5 BYTE "Friday", 0
    msg6 BYTE "Saturday", 0
    msg7 BYTE "Sunday", 0
    msg8 BYTE "Invalid day number", 0

.code
main PROC
    mov edx, OFFSET msg0
    call WriteString
    call ReadDec

    cmP EAX, 1
    JE d1
    CMP EAX, 2
    JE d2
    CMP EAX, 3
    JE d3
    Cmp EAX, 4
    JE d4
    CMP EAX, 5
    JE d5
    CMP eAX, 6
    JE d6
    CMP EAX, 7
    JE d7

    JMP notfound

    d1:
        mov edx, OFFSET msg1
        jmp display
    d2:
        mov edx, OFFSET msg2
        jmp display
    d3:
        mov edx, OFFSET msg3
        jmp display
    d4:
        mov edx, OFFSET msg4
        jmp display
    d5:
        mov edx, OFFSET msg5
        jmp display
    d6:
        mov edx, OFFSET msg6
        jmp display
    d7:
        mov edx, OFFSET msg7
        jmp display

    notfound:
        mov edx, OFFSET msg8

    display:
        call WriteString
        call Crlf

    exit
main ENDP
END main


