%include 'core.m'

	section	.text
proc getdents64
	sinvoke	217	; syscall getdents64
endproc
