%include 'core.m'

	section	.text
proc byte_find
	push	rbx
	mov	rbx, rdi	; save initial pointer
	mov	rcx, rdx	; number of bytes to scan
	mov	al, sil		; byte to scan for
	cld			; scan forward
repne	scasb
	mov	rax, rdi
	sub	rax, rbx	; return (current pointer - initial pointer)
	pop	rbx
endproc
