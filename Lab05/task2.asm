INCLUDE Irvine32.inc

.data
	myByte BYTE 12h
	myWord WORD 1234h
	myDword DWORD 12345678h

.code
	main PROC

		;a)
		MOV ESI, OFFSET myByte
		MOV ESI, OFFSET myWord
		MOV ESI, OFFSET myWord

		;b)
		MOV AX, WORD PTR myDword + 2

		;c)
		MOV BX, TYPE myByte
		MOV BX, TYPE myWord
		MOV BX, TYPE myDword

		call DumpRegs

	exit
	main ENDP
	END main