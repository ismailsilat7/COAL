;Write a program using the LOOP instruction with indirect addressing that copies a string from
;source to target, reversing the character order in the process. Use the following variables:
;source BYTE "This is the source string",0
;target BYTE SIZEOF source DUP('#')
;Insert the following statements immediately after the loop to display the hexadecimal contents
;of the target string:
;mov esi,OFFSET target ; offset of variable
;mov ebx,1 ; byte format
;mov ecx,SIZEOF target ; counter
;call DumpMem
;If your program works correctly, it will display the following sequence of hexadecimal bytes:
;67 6E 69 72 74 73 20 65 63 72 75 6F 73 20 65 68
;74 20 73 69 20 73 69 68 54

INCLUDE IRVINE32.INC
.data
    source BYTE "This is the source string",0
    target BYTE SIZEOF source DUP('#')
.code
    main PROC

        MOV ECX, LENGTHOF source - 1  ; number of characters to reverse (exclude null terminator)

        MOV ESI, OFFSET source
        ADD ESI, (LENGTHOF source - 2) ; point ESI to the last character (before the null terminator)

        MOV EDI, OFFSET target
    
    COPYSTRING:
        MOV AL, [ESI]
        MOV [EDI], AL
        INC EDI
        DEC ESI
        LOOP COPYSTRING
        MOV BYTE PTR [EDI], 0
        mov esi,OFFSET target ; offset of variable
        mov ebx,1 ; byte format
        mov ecx,SIZEOF target ; counter
        call DumpMem

    exit
    main ENDP
END main