INCLUDE IRVINE32.inc
.data
    var1 BYTE 1
    var2 BYTE 6
    var3 BYTE 3
    var4 BYTE 4

    number DWORD 1634
    msg1 BYTE "1634 is an armstrong number", 0
    msg2 BYTE "1634 is not an armstrong number", 0

    result1 DWORD ?
    result2 DWORD ?
    result3 DWORD ?
    result4 DWORD ?

.code
    MAIN PROC
        ; Every square is the sum of the first n odd numbers
        ; Every cube is the result of n^2 added to itself n times
        ; Every forth power is the result of n^3 added to itself n times
        MOV ECX, 0
        
        ; Calculate var1 raised to the power 4
        MOV ECX, 3
        MOVZX EAX, var1
    FOURTH1:
        MOV EDX, ECX
        MOV EBX, EAX
        MOVZX ECX, var1 
        MOV EAX, 0
        sum1:
            ADD EAX, EBX
            loop sum1
        MOV result1, EAX
        MOV ECX, EDX
        loop FOURTH1

        ; Calculate var2 raised to the power 4
        MOV ECX, 3
        MOVZX EAX, var2
    FOURTH2:
        MOV EDX, ECX
        MOV EBX, EAX
        MOVZX ECX, var2 
        MOV EAX, 0
        sum2:
            ADD EAX, EBX
            loop sum2
        MOV result2, EAX
        MOV ECX, EDX
        loop FOURTH2

        ; Calculate var3 raised to the power 4
        MOV ECX, 3
        MOVZX EAX, var3
    FOURTH3:
        MOV EDX, ECX
        MOV EBX, EAX
        MOVZX ECX, var3 
        MOV EAX, 0
        sum3:
            ADD EAX, EBX
            loop sum3
        MOV result3, EAX
        MOV ECX, EDX
        loop FOURTH3

        ; Calculate var4 raised to the power 4
        MOV ECX, 3
        MOVZX EAX, var4
    FOURTH4:
        MOV EDX, ECX
        MOV EBX, EAX
        MOVZX ECX, var4 
        MOV EAX, 0
        sum4:
            ADD EAX, EBX
            loop sum4
        MOV result4, EAX
        MOV ECX, EDX
        loop FOURTH4

        ; sum of indivual cubes
        MOV EAX, result1
        ADD EAX, result2
        ADD EAX, result3
        ADD EAX, result4

        ; check if armstrong 
        CMP EAX, number
        JE armStrong
    notArmStrong:
        MOV EDX, OFFSET msg2
        JMP skip
    armstrong:
        MOV EDX, OFFSET msg1
    skip:
        call WriteString
        call crlf

        MOV EAX, result1
        call WriteInt
        call crlf

        MOV EAX, result2
        call WriteInt
        call crlf

        MOV EAX, result3
        call WriteInt
        call crlf

        MOV EAX, result4
        call WriteInt
        call crlf

    exit
    MAIN ENDP
END MAIN