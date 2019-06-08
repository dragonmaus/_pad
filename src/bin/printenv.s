	global	_start

	section	.text
_start:
	pop	rdi		; argc
	cmp	rdi, 1
	jg	.arg

	pop	rdi
	pop	rdi
.env:	pop	rsi		; envp
	or	rsi, rsi
	je	.exit
	mov	rdi, rsi
	xor	rcx, rcx
	not	rcx		; MAX_INT
	xor	rax, rax
	cld
repne	scasb
	not	rcx		; ~rcx = string length + 1 (for newline)
	dec	rdi
	mov	byte [rdi], 0x0A; replace null terminator with newline
	mov	rdx, rcx
	mov	rdi, 1		; stdout
	mov	rax, 1		; syscall write
	syscall
	jmp	.env
.arg:	; TODO: implement this
.exit:	xor	rdi, rdi	; exit code 0
	mov	rax, 60		; syscall exit
	syscall
