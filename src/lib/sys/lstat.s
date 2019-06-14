%include 'core.m'

	section	.text
proc lstat
	sinvoke	6	; syscall lstat
endproc
