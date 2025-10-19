; 1. Selecting Array Elements
; C++ to ASM
; int array[] = {10,60,20,33,72,89,45,65,72,18};
; int sample = 50;
;int ArraySize = sizeof array / sizeof sample;
;int index = 0;
;int sum = 0;
;while( index < ArraySize ) {
;   if( array[index] <= sample ) {
;       sum += array[index];
;   }
;   index++;
;}

INCLUDE Irvine32.inc

.data
    array DWORD 10,60,20,33,72,89,45,65,72,18
    sample DWORD 50
    sum DWORD 0
.code
    main PROC
        MOV EBX, 0
        MOV ECX, LENGTHOF array
        MOV EAX, sum
        MOV EDX, sample
    whileArray:
        CMP EBX, ECX
        JNL done
        CMP array[EBX * TYPE array], EDX
        JNLE dontSum
        ADD EAX, array[EBX * TYPE array]
        dontSum:
        INC EBX
        JMP whileArray

    done:
        MOV sum, EAX
        call WriteDec
        call crlf

    exit
    main endp
end main