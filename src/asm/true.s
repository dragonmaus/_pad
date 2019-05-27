format	elf64	executable 0

segment	readable executable

entry	$
	xor	edi, edi	; exit code 0
	mov	eax, 60		; syscall exit
	syscall
