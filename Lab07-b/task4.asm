INCLUDE Irvine32.inc

.data
    
    varA DWORD ?
    varB DWORD ?
    getNumA BYTE "Enter number A: ", 0
    getNumB BYTE "Enter number B: ", 0
    msgTrue BYTE "Condition True", 0
    msgFalse BYTE "Condition False", 0

.code 
    main PROC
        
        MOV EDX, OFFSET getNumA
        call WriteString
        call ReadInt
        MOV varA, EAX

        MOV EDX, OFFSET getNumB
        call WriteString
        call ReadInt
        MOV varB, EAX

        MOV EAX, varA
        MOV EBX, varB

        CMP EAX, EBX
        JLE falseCond
        CMP EAX, 100
        JGE falseCond  
        MOV EDX, OFFSET msgTrue
        JMP displayMsg
    falseCond:
        MOV EDX, OFFSET msgFalse
    displayMsg:
        call WriteString


    exit
    main ENDP
END main