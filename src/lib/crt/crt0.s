	global	_start
	global	environ
	global	errno

	extern	main

	section	.text
_start:
	pop	rdi		; argc
	mov	rsi, rsp	; argv

	mov	rdx, rsp
skip:	add	rdx, 8
	cmp	qword [rdx], 0
	jne	skip
	add	rdx, 8		; envp

	mov	qword [environ], rdx
	mov	dword [errno], 0

	call	main

	mov	rdi, rax	; exit code is what main returned
	mov	rax, 60		; syscall exit
	syscall

	section	.bss
environ:
	resq	1
errno:
	resd	1
