INCLUDE Irvine32.inc
.code
	main PROC
		mov AL, 7Fh
		sub AL, 80h
		call DumpRegs
	exit
	main ENDP
	END main