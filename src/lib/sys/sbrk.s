%include 'core.m'

	section	.text
proc sbrk
	or	rdi, rdi
	jz	.brk	; sbrk(0) => brk(0)
.sbrk:	push	rdi
	call	.brk
	pop	rdi
	add	rdi, rax	; rdi += brk(0)
	sinvoke	12, rdi	; brk(rdi);
endproc
.brk:	sinvoke	12, 0	; brk(0)
endproc
