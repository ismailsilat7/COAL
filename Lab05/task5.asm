INCLUDE Irvine32.inc

.data
	arrayD DWORD 1000h,2000h,3000h,4000h

.code
	main PROC
		;a)
		MOV EAX, [arrayD + 1 * TYPE arrayD]
		
		;b)
		MOV EBX, [arrayD + 3 * TYPE arrayD]
		call DumpRegs

	exit
	main ENDP
	END main