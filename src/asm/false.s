format	elf64	executable 0

segment	readable executable

entry	$
	xor	edi, edi
	inc	edi		; exit code 1
	mov	eax, 60		; syscall exit
	syscall
