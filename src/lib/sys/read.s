%include 'core.m'

	section	.text
proc read
	sinvoke	0	; syscall read
endproc
