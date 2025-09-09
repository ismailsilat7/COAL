;Declare three 32-bit variables:
;Xval = 25, Yval = 15, Zval = 40
; Write a program to Compute : - (Xval + Yval - Zval)
; Use add, sub, and neg instructions step by step.
; Store the result in a variable Rval.

INCLUDE Irvine32.inc
.data 
    Xval DWORD 25
    Yval DWORD 15
    Zval DWORD 40
    Rval DWORD ?
.code 
    main PROC
        MOV EAX, Xval
        ADD EAX, Yval
        SUB EAX, Zval
        NEG EAX
        MOV Rval, EAX
        call WriteInt
    exit
    main ENDP
    END main