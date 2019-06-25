; int open(const char *path, int flags, int mode);
%include 'core.m'

	section	.text
proc open
	sinvoke	2	; syscall open
endproc
