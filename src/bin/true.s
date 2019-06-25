%include 'core.m'

	section	.text
	global	_start
_start:
	sinvoke	60, 0	; syscall exit
