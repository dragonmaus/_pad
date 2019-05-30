format	elf64 executable 0

segment	readable executable

entry	$
	xor	rdi, rdi	; exit code 0
	mov	rax, 60		; syscall exit
	syscall
