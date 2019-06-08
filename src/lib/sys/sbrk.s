;   void *
; sbrk(long int n)
; {
;   if (n) return brk((brk(0) + n));
;   return brk(0);
; }

	global	sbrk

	section	.text
sbrk:
	or	rdi, rdi
	jz	query
resize:	push	rdi
	call	query
	pop	rdi
	add	rdi, rax
	mov	rax, 12		; syscall brk
	syscall
	ret
query:	xor	rdi, rdi
	mov	rax, 12		; syscall brk
	syscall
	ret
