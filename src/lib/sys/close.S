; int close(int fd);
%include 'core.m'

	section	.text
proc close
	sinvoke	3	; syscall close
endproc
