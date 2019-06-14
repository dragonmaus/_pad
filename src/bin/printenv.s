%include 'core.m'

	section	.text
proc _start
	pop	rdi		; argc
;	cmp	rdi, 1
;	jg	.arg		; TODO: implement this
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
	sinvoke	1, 1, rcx	; syscall write (RDI already set)
	jmp	.env
.exit:	sinvoke	60, 0
endproc
