%include 'core.m'

	section	.text
proc fsync
	sinvoke	74	; syscall fsync
endproc
