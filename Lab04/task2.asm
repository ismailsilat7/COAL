;Declare a signed byte variable with value -50 and an unsigned byte variable with value 200.
; Use movzx to load the unsigned value into a 32-bit register.
; Use movsx to load the signed value into another 32-bit register.
; Display both results with DumpRegs.

INCLUDE Irvine32.inc
.data
    var1 SBYTE -50 ; CE in SBYTE hexadecimal representation - FFFF FFCE in DWORD
    var2 BYTE 200  ; C8 in BYTE hexadecimal representation
.code
    main PROC

        MOVSX EAX, var1 ; MOV var1 with sign-extend
        call DumpRegs

        MOVZX EAX, var2 ; MOV var2 with zero-extend
        call DumpRegs

    exit
    main ENDP
    END main