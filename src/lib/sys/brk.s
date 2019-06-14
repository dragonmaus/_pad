%include 'core.m'

	section	.text
proc brk
	sinvoke	12	; syscall brk
endproc
