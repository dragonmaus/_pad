	.global	_start

	.text
_start:
	mov	r7, #1		// syscall exit
	mov	r0, #1
	svc	#0
