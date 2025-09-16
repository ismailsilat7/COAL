INCLUDE Irvine32.inc

.data
	arrayB BYTE 11h,22h,33h
	arrayW WORD 4444h,5555h,6666h

.code
	main PROC

		;a
		MOV ESI, OFFSET arrayB
		MOV AX, [esi]
		call DumpRegs
		
		INC ESI
		MOV AX, [esi]
		call DumpRegs
		
		INC ESI
		MOV AX, [esi]
		call DumpRegs

		;b
		MOV ESI, OFFSET arrayW
		MOV AX, [esi]
		call DumpRegs
		
		ADD ESI,2
		MOV AX, [esi]
		call DumpRegs
		
		ADD ESI, 2
		MOV AX, [esi]
		call DumpRegs

		;c DIFFERENT INCREMENT IN ESI BECAUSE SIZE OF BOTH ARRAYS IS DIFFERENT (ArrayB is 1 byte only, while ArrayW is 2 bytes)

	exit
	main ENDP
	END main