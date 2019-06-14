%include 'core.m'

	section	.text
proc wait4
	sinvoke	61	; syscall wait4
endproc
