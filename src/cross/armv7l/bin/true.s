.text

.globl	_start

_start:
	mov	r7, #1		// syscall exit
	mov	r0, #0
	svc	#0
