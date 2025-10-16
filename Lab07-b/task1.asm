INCLUDE Irvine32.inc

.data
    
    on BYTE "Bit 0 is ON", 0
    off BYTE "Bit 0 is OFF", 0

    msg BYTE "For value ", 0
    
    var1 BYTE 5
    var2 BYTE 8
    var3 BYTE 25

.code 
    main PROC
        
        MOV EAX, 0

        MOV EDX, OFFSET msg
        call WriteString
        MOV AL, var1
        call WriteDec
        call crlf

        AND AL, 01010101b ; taking lsb as bit 0 (even)
        OR AL, 01010101b
        XOR AL, 11111111b

        TEST AL, 1
        JNZ var1ZeroSet
        MOV EDX, OFFSET off
        call WriteString
        JMP var1exit
    var1ZeroSet:
        MOV EDX, OFFSET on 
        call WriteString
    var1exit:
        call crlf
        call WriteBin
        call crlf
        call crlf

        MOV EDX, OFFSET msg
        call WriteString
        MOV AL, var2
        call WriteDec
        call crlf

        AND AL, 01010101b ; taking lsb as bit 0 (even)
        OR AL, 01010101b
        XOR AL, 11111111b

        TEST AL, 1
        JNZ var2ZeroSet
        MOV EDX, OFFSET off
        call WriteString
        JMP var2exit
    var2ZeroSet:
        MOV EDX, OFFSET on
        call WriteString
    var2exit:
        call crlf
        call WriteBin
        call crlf
        call crlf

        MOV EDX, OFFSET msg
        call WriteString
        MOV AL, var3
        call WriteDec
        call crlf

        AND AL, 01010101b ; taking lsb as bit 0 (even)
        OR AL, 01010101b
        XOR AL, 11111111b

        TEST AL, 1
        JNZ var3ZeroSet
        MOV EDX, OFFSET off
        call WriteString
        JMP var3exit
    var3ZeroSet:
        MOV EDX, OFFSET on
        call WriteString
    var3exit:
        call crlf
        call WriteBin
        call crlf
        call crlf

    exit
    main ENDP
END main