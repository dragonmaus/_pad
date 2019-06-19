%include 'core.m'

	section	.text
proc getdents
	sinvoke	78	; syscall getdents
endproc
