%include 'core.m'

	section	.text
proc _start
	sinvoke	1, 1, msg, msg_len	; syscall write
	sinvoke	60, rax			; syscall exit
endproc

	section	.data
msg	string	'Hello, world!', 0x0A
