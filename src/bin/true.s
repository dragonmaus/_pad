%include 'core.m'

	global	_start

	section	.text
_start:
	sinvoke	60, 0	; syscall exit
