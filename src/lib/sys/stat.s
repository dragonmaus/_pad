%include 'core.m'

	section	.text
proc stat
	sinvoke	4	; syscall stat
endproc
