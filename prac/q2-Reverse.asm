;Use a loop with indirect or indexed addressing to reverse the elements of an integer array in place.
;Do not copy the elements to any other array. Use the SIZEOF, TYPE, and LENGTHOF operators
;to make the program as flexible as possible if the array size and type should be changed in the
;future. Optionally, you may display the modified array by calling the DumpMem method from the
;Irvine32 library.

INCLUDE Irvine32.inc

.data 

    array DISP 1,2,3,4,5,6,7,8,9

.code 
    main PROC

        MOV ECX, (LENGTHOF array / 2)
        MOV ESI, OFFSET array
        MOV EDI, OFFSET [array + SIZEOF array - TYPE array]
    REVERSE:
        MOV EAX, [ESI]
        XCHG EAX, [EDI]
        MOV [ESI], EDX
        ADD ESI, TYPE array
        SUB EDI, TYPE array
        LOOP REVERSE

        MOV ECX, LENGTHOF array
        MOV ESI, OFFSET array
    DISPLAY:
        MOV EAX, [ESI]
        call WRITEDEC
        ADD ESI, TYPE array
        LOOP DISPLAY

    exit
    main ENDP
END main