INCLUDE Irvine32.inc
.code
	main PROC
		mov AL, 7Fh
		add AL, 1
		call DumpRegs
	exit
	main ENDP
	END main