; int chdir(const char *path);
%include 'core.m'

	section	.text
proc chdir
	sinvoke	80	; syscall chdir
endproc
