;1. Counting Array Values
;Write an application that does the following: (1) fill an array with 50 random integers; (2) loop
;through the array, displaying each value, and count the number of negative values; (3) after the
;loop finishes, display the count. Note: The Random32 procedure from the Irvine32 library generates random integers

INCLUDE Irvine32.inc

.data
    array DWORD 50 DUP(?)
    msg BYTE "Number of negative values: ", 0
.code
    main PROC
        call Randomize
        MOV ECX, 50
        MOV ESI, OFFSET array
    generateRandom:
        call Random32
        MOV DWORD PTR [ESI], EAX
        ADD ESI, TYPE array
        LOOP generateRandom
    
        MOV EBX, 0
        MOV ECX, 50
        MOV ESI, OFFSET array
    display:
        MOV EAX, DWORD PTR [ESI]
        call WriteInt
        CMP EAX, 0
        JNL positive
        INC EBX
        positive:
        call crlf
        LOOP display
    
        MOV EDX, OFFSET msg
        call WriteString
        MOV EAX, EBX
        call WriteDec
        call crlf

    exit
    main endp
end main