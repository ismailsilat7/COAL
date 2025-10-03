;Write a program that uses a loop to calculate the first seven values of the Fibonacci number sequence,
;described by the following formula: Fib(1) = 1, Fib(2) = 1, Fib(n) = Fib(n - 1) + Fib(n - 2). Place
;each value in the EAX register and display it with a call DumpRegs statement (see Section 3.2)
;inside the loop.

INCLUDE IRVINE32.INC

.data
    prev DWORD 0
    curr DWORD 1


.code 
    main PROC
        
        call READDEC
        SUB EAX, 2

        MOV ECX, EAX
        MOV EAX, prev
        call WRITEDEC
        call crlf
        MOV EAX, curr
        call WRITEDEC
        call crlf
    FIB:
        MOV EAX, prev
        XCHG EAX, curr
        MOV prev, EAX
        ADD EAX, curr
        MOV curr, EAX
        call WRITEDEC
        call crlf
        LOOP FIB

    exit
    main ENDP
END main