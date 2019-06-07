	.global	_start

	.text
_start:
	mov	x8, #64		// syscall write
	mov	x0, #1		// stdout
	ldr	x1, message
	mov	x2, #14
	svc	#0
	mov	x8, #93		// syscall exit
	svc	#0

message:
	.dword	_message

	.data
_message:
	.ascii	"Hello, world!\n"
