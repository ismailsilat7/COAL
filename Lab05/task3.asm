INCLUDE Irvine32.inc

.data
	arr1 BYTE 10,20,30,40
	arr2 WORD 100h,200h,300h
	arr3 DWORD 5 DUP(0)

.code
	main PROC

		;a
		MOV AX, LENGTHOF arr1
		MOV BX, LENGTHOF arr2
		MOV CX, LENGTHOF arr3
		call DumpRegs
		;b
		MOV AX, SIZEOF arr1
		MOV BX, SIZEOF arr2
		MOV CX, SIZEOF arr3
		call DumpRegs

	exit
	main ENDP
	END main