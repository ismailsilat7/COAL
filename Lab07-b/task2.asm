INCLUDE Irvine32.inc

.data
    
    var1 DWORD ?
    var2 DWORD ?
    var3 DWORD ?

    largestSignedNum DWORD ?
    largestUnsignedNum DWORD ?

    getNum BYTE "Enter number: ", 0

    largestSigned BYTE "Largest (Signed): ", 0
    largestUnSigned BYTE "Largest (UnSigned): ", 0

.code 
    main PROC
        
        MOV EDX, OFFSET getNum
        call WriteString
        call ReadInt
        MOV var1, EAX

        MOV EDX, OFFSET getNum
        call WriteString
        call ReadInt
        MOV var2, EAX

        MOV EDX, OFFSET getNum
        call WriteString
        call ReadInt
        MOV var3, EAX

        ; find largest unsigned
        MOV EAX, var3
        CMP EAX, var2
        JA LUS1
        MOV EAX, var2
    LUS1:
        CMP EAX, var1
        JA LUS2
        MOV EAX, var1
        LUS2:
            MOV largestunsignedNum, EAX
        
        ; find largest signed
        MOV EAX, var3
        CMP EAX, var2
        JG LS1
        MOV EAX, var2
    LS1:
        CMP EAX, var1
        JG LS2
        MOV EAX, var1
        LS2:
            MOV largestSignedNum, EAX
        
        ; print largest
        MOV EDX, OFFSET largestUnsigned
        call WriteString
        MOV EAX, largestUnsignedNum
        call WriteDec
        Mov AL, ','
        call WriteChar
        MOV EAX, largestUnsignedNum
        call WriteInt
        call crlf
        
        MOV EDX, OFFSET largestSigned
        call WriteString
        MOV EAX, largestSignedNum
        call WriteInt
        call crlf

    exit
    main ENDP
END main
