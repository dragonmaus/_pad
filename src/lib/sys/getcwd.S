; int getcwd(char *buf, unsigned int buflen);
%include 'core.m'

	section	.text
proc getcwd
	sinvoke	79	; syscall getcwd
endproc
