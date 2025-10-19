; Using the following table as a guide, write a program that asks the user to enter an integer test
; score between 0 and 100. The program should display the appropriate letter grade:
; Score Range - Letter Grade
; 90 to 100   -      A
; 80 to 89    -      B
; 70 to 79    -      C
; 60 to 69    -      D
; 0 to 59     -      F

INCLUDE Irvine32.inc

.data
    letterA BYTE 'A'
    letterB BYTE 'B'
    letterC BYTE 'C'
    letterD BYTE 'D'
    letterF BYTE 'F'
    getScore BYTE "Enter your score: ", 0
    gradeReceived BYTE "Grade received: ", 0
    invalidInput BYTE "Invalid input, must be between 0 & 100", 0
.code
    main PROC
        
        MOV EDX, OFFSET getScore
        call WriteString
        call ReadInt

        CMP EAX,100
        JG displayInvalid

        CMP EAX, 90
        JGE gradeA

        CMP EAX, 80
        JGE gradeB
        
        CMP EAX, 70
        JGE gradeC

        CMP EAX, 60
        JGE gradeD

        CMP EAX, 0
        JGE gradeF
        JMP displayInvalid

        gradeA:
            MOV AL, letterA
            JMP displayGrade
        gradeB:
            MOV AL, letterB
            JMP displayGrade
        gradeC:
            MOV AL, letterC
            JMP displayGrade
        gradeD:
            MOV AL, letterD
            JMP displayGrade
        gradeF:
            MOV AL, letterF
        displayGrade:
            MOV EDX, offset gradeReceived
            call WriteString
            call WriteChar
            call crlf
            JMP Lexit
        
        displayInvalid:
            MOV EDX, offset invalidInput
            call WriteString
            call crlf
        
        Lexit:

    exit
    main endp
end main