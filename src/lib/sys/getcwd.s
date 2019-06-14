%include 'core.m'

	section	.text
proc getcwd
	sinvoke	79	; syscall getcwd
endproc
