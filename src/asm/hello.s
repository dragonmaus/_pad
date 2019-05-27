format	elf64	executable 0

segment	readable executable

entry	$
	mov	edx, len
	lea	esi, [msg]
	mov	edi, 1		; stdout
	mov	eax, 1		; syscall write
	syscall

	xor	edi, edi	; exit code 0
	mov	eax, 60		; syscall exit
	syscall

segment	readable writeable

msg	db	'Hello, world!', 0xA
len	=	$ - msg
