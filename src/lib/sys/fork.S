; int fork(void);
%include 'core.m'

	section	.text
proc fork
	sinvoke	57	; syscall fork
endproc
