INCLUDE Irvine32.inc

.data

.code
    main PROC

        MOV ECX, 25
        MOV EAX, 1
    printSequence:
        call WriteInt
        call crlf
        ADD EAX, 4
        loop printSequence

    exit
    main ENDP
END main