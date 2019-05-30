format	elf64 executable 0

segment	readable executable

entry	$
	pop	rax		; argc
	cmp	rax, 1
	jg	doargs

	pop	rax
	pop	rax
doenv:
	pop	rcx		; envp
	cmp	rcx, 0
	je	exit
	mov	rdx, rcx
find_end:
	inc	rdx
	cmp	byte [rdx], 0
	jne	find_end
	mov	byte [rdx], 0xA	; replace \0 with \n
	sub	rdx, rcx	; length of *envp
	inc	rdx		; include trailing \n
	mov	rsi, rcx	; *envp
	mov	rdi, 1		; stdout
	mov	rax, 1		; syscall write
	syscall
	jmp	doenv

doargs:
	; TODO: implement this

exit:
	xor	rdi, rdi	; exit code 0
	mov	rax, 60		; syscall exit
	syscall
