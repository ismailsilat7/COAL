INCLUDE Irvine32.inc

.data
    space BYTE ' '
    six BYTE 6
    eight BYTE 8

.code
    main PROC

        MOV ECX, 4
        triangle:
            MOV EDX, ECX

            MOV ECX, EDX
            DEC ECX
            CMP ECX, 0
            JE skipSpaces
            spaces:
                MOV AL, space
                call WriteChar
                LOOP spaces
            skipSpaces:
            MOV ECX, 5
            SUB ECX, EDX
            CMP ECX, 0
            JE skipLeft
            leftTriangle:
                MOVZX EAX, six
                call WriteDec
                LOOP leftTriangle
            skipLeft:
            MOV ECX, 4
            SUB ECX, EDX
            CMP ECX, 0
            JE skipRight
            rightTriangle:
                MOVZX EAX, six
                call WriteDec
                LOOP rightTriangle
            skipRight:
            call crlf
            MOV ECX, EDX
            LOOP triangle
        
        MOV ECX, 4
        rectangle:
            MOVZX EAX, space
            call WriteChar
            call WriteChar
            MOVZX EAX, eight
            call WriteDec
            call WriteDec
            call WriteDec
            call crlf
            LOOP rectangle

    exit
    main ENDP
END main