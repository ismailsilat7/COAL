;Declare two 16-bit variables: num1 = 1234h, num2 = 5678h.
; Load them into registers.
; Use xchg to swap their contents.
; Store the swapped results back into the variables.

INCLUDE Irvine32.inc
.data
    num1 WORD 01234h
    num2 WORD 05678h
.code
    main PROC

        MOVZX EAX, num1 ; Initial num1
        call DumpRegs

        MOV AX, num2 ; Initial num2
        call DumpRegs

        MOV AX, num1 
        XCHG AX, num2
        MOV num1, AX

        MOV AX, num1 ; num1 swapped value
        call DumpRegs

        MOV AX, num2 ; num2 swapped value
        call DumpRegs

        MOV AX, num1 
        XCHG AX, num2
        MOV num1, AX

        MOV AX, num1 ; num1 reswapped value
        call DumpRegs

        MOV AX, num2 ; num2 reswapped value
        call DumpRegs

    exit
    main ENDP
    END main