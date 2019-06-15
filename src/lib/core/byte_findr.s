%include 'core.m'

	section	.text
proc byte_findr
	push	rbx
	mov	rbx, rdi	; save initial pointer
	mov	rcx, rdx	; number of bytes to scan
	mov	al, sil		; byte to scan for
	dec	rdx
	add	rdi, rdx	; start at end of region
	std			; and scan backward
.scan:	scasb
	je	.match
	loop	.scan
	add	rdi, rdx
	inc	rdi		; no match; go back to end of region
.match:	inc	rdi		; go back to matching byte (or just past end of region if no match)
	mov	rax, rdi
	sub	rax, rbx	; return (current pointer - initial pointer)
	pop	rbx
endproc
