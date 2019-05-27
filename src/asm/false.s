format	elf64	executable 0

segment	readable executable

entry	$
	mov	edi, 1		; exit code 1
	mov	eax, 60		; syscall exit
	syscall
