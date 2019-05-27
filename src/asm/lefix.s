; TODO: use a larger buffer

format	elf64	executable 0

segment	readable executable

entry	$
read:
	; read the next character
	mov	edx, 1
	lea	esi, [c]
	xor	edi, edi	; stdin
	xor	eax, eax	; syscall read
	syscall
	cmp	eax, 0		; how many bytes were read?
	je	exit
	jl	fail

	cmp	byte [c], 0xD	; did we read a carriage return ('\r')?
	jne	write

	; write a line feed ('\n')
	mov	edx, 1
	lea	esi, [lf]
	mov	edi, 1		; stdout
	mov	eax, 1		; syscall write
	syscall
	cmp	eax, 1		; how many bytes were written?
	jne	fail

	; read the next character
	mov	edx, 1
	lea	esi, [c]
	xor	edi, edi	; stdin
	xor	eax, eax	; syscall read
	syscall
	cmp	eax, 0		; how many bytes were read?
	je	exit
	jl	fail

	cmp	byte [c], 0xA	; did we read a line feed ('\n')?
	je	read		; yes, skip to next loop iteration

write:
	; write the current character
	mov	edx, 1
	lea	esi, [c]
	mov	edi, 1		; stdout
	mov	eax, 1		; syscall write
	syscall
	cmp	eax, 1		; how many bytes were written?
	jne	fail

	jmp	read

exit:
	xor	edi, edi	; exit code 0
	mov	eax, 60		; syscall exit
	syscall

fail:
	mov	edi, 1		; exit code 1
	mov	eax, 60		; syscall exit
	syscall

segment	readable
lf	db	0xA

segment	readable writeable
c	rb	1
