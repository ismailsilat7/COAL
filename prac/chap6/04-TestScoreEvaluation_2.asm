; Using the following table as a guide, write a program that asks the user to enter an integer test
; score between 0 and 100. The program should display the appropriate letter grade:
; Score Range - Letter Grade
; 90 to 100   -      A
; 80 to 89    -      B
; 70 to 79    -      C
; 60 to 69    -      D
; 0 to 59     -      F

;Run in a loop so that multiple test scores can be entered.
;Accumulate a counter of the number of test scores.
;Perform range checking on the user’s input: Display an error message if the test score is less
;than 0 or greater than 100. (A VideoNote for this exercise is posted on the Web site.)

INCLUDE Irvine32.inc

.data
    letterA BYTE 'A'
    letterB BYTE 'B'
    letterC BYTE 'C'
    letterD BYTE 'D'
    letterF BYTE 'F'
    getScore BYTE "Enter score (-1 to stop) : ", 0
    gradeReceived BYTE "Grade received: ", 0
    invalidInput BYTE "Invalid input, must be between 0 & 100", 0
    numValidInputs BYTE "Valid inputs: ", 0
.code
    main PROC
        
        MOV EBX, 0

    scoreLoop:
        MOV EDX, OFFSET getScore
        call WriteString
        call ReadInt

        CMP EAX, -1
        JE scoreLoopExit

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
            INC EBX
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
    JMP scoreLoop
        
    scoreLoopExit:
        MOV EDX, OFFSET numValidInputs
        call WriteString
        MOV EAX, EBX
        call WriteDec
        call crlf

    exit
    main endp
end main