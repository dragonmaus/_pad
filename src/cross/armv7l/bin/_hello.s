.globl	_start

.text
_start:
	mov	r7, #4		// syscall write
	mov	r0, #1		// stdout
	ldr	r1, message
	mov	r2, #14
	svc	#0
	mov	r7, #1		// syscall exit
	svc	#0

message:
	.word	_message

.data
_message:
	.ascii	"Hello, world!\n"
