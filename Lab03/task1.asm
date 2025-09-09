INCLUDE Irvine32.inc

.data
	num1 BYTE 25 ; equivalent to 19h
	num2 WORD 01200h
	num3 DWORD ?

.code 
	main PROC

		MOV AL, num1 ; AL becomes 19h 
		call DumpRegs

		MOV AX, num2 ; AX becomes 1200h
		call DumpRegs

		MOVZX EAX, AX ; EAX becomes 1200h with zero-extends
		MOV num3, EAX ; MOV EAX to num3
		call DumpRegs

	exit
	main ENDP
	END main