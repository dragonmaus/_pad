%include 'core.m'

	section	.text
proc readlink
	sinvoke	89	; syscall readlink
endproc
