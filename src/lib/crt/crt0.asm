format	elf64

section	'.text' executable

	public	_start
	public	environ
	public	errno
	extrn	main

_start:
	pop	rdi		; argc
	mov	rsi, rsp	; argv

	mov	rdx, rsp
skip:	add	rdx, 8
	cmp	qword [rdx], 0
	jne	skip
	add	rdx, 8		; envp

	mov	qword [environ], rdx
	mov	qword [errno], 0

	call	main

	mov	rdi, rax	; exit code is what main returned
	mov	rax, 60		; syscall exit
	syscall

section '.data' writable

environ	dq	1
errno	dq	1
