format	elf64 executable 0

segment	readable executable

entry	$
	xor	rdi, rdi
	inc	rdi		; exit code 1
	mov	rax, 60		; syscall exit
	syscall
