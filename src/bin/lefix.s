; TODO: use a larger buffer

	global	_start

	section	.text
_start:
read:
	; read the next character
	mov	rdx, 1
	lea	rsi, [c]
	xor	rdi, rdi	; stdin
	xor	rax, rax	; syscall read
	syscall
	cmp	rax, 0		; how many bytes were read?
	je	exit
	jl	fail

	cmp	byte [c], 0xD	; did we read a carriage return ('\r')?
	jne	write

	; write a line feed ('\n')
	mov	rdx, 1
	lea	rsi, [lf]
	mov	rdi, 1		; stdout
	mov	rax, 1		; syscall write
	syscall
	cmp	rax, 1		; how many bytes were written?
	jne	fail

	; read the next character
	mov	rdx, 1
	lea	rsi, [c]
	xor	rdi, rdi	; stdin
	xor	rax, rax	; syscall read
	syscall
	cmp	rax, 0		; how many bytes were read?
	je	exit
	jl	fail

	cmp	byte [c], 0xA	; did we read a line feed ('\n')?
	je	read		; yes, skip to next loop iteration

write:
	; write the current character
	mov	rdx, 1
	lea	rsi, [c]
	mov	rdi, 1		; stdout
	mov	rax, 1		; syscall write
	syscall
	cmp	rax, 1		; how many bytes were written?
	jne	fail

	jmp	read

exit:
	xor	rdi, rdi	; exit code 0
	mov	rax, 60		; syscall exit
	syscall

fail:
	mov	rdi, 1		; exit code 1
	mov	rax, 60		; syscall exit
	syscall

	section	.data
lf:
	db	0xA

	section	.bss
c:
	resb	1
