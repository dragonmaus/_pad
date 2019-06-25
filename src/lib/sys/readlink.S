; long int readlink(const char *path, char *buf, unsigned long int count);
%include 'core.m'

	section	.text
proc readlink
	sinvoke	89	; syscall readlink
endproc
