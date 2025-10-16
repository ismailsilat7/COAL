INCLUDE Irvine32.inc

.data
    
    arr1 DWORD 5 DUP(0)
    getString BYTE "Enter num (Enter 0 to stop): ", 0
    
    msg BYTE "Enter upto 5 numbers", 0

    endmsg BYTE "Total non-zero numbers entered: ", 0

.code 
    main PROC
        
        MOV EAX, 0
        MOV EDX, OFFSET msg
        call WriteString
        call crlf

        MOV ECX, 5
        MOV ESI, OFFSET arr1
        MOV EDX, OFFSET getString
        getNum:
            call WriteString
            call ReadInt
            MOV [ESI], EAX
            ADD ESI, TYPE arr1
            CMP EAX, 0
            LOOPNZ getNum

        MOV ECX, 5
        MOV ESI, OFFSET arr1
        MOV EBX, 0
        countNum:
            MOV EAX, [ESI]
            CMP EAX, 0
            JZ Lexit
            INC EBX
            ADD ESI, TYPE arr1
            LOOP countNum

        Lexit:
        MOV EAX, EBX
        MOV EDX, OFFSET endmsg
        call WriteString
        call WriteDec
        

    exit
    main ENDP
END main