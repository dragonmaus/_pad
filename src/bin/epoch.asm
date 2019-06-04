format	elf64 executable 0

segment	readable executable

fmttime:
	push	rdi
	push	rbx
	push	r15
	push	rdx
	push	rsi
	xor	rdi, rdi
	mov	rax, 201
	syscall			; RAX now contains the current time in seconds since the epoch
	mov	rdi, number
	mov	rbx, numtab
	mov	r15, 10
	cld
ftloop:	or	rax, rax
	jz	ftdone
	cdq
	div	r15
	xchg	rdx, rax
	xlatb
	stosb
	xchg	rdx, rax
	jmp	ftloop
ftdone:	sub	rdi, number	; length of string
	mov	rsi, rdi
	mov	rdi, number
	call	revstr
	pop	rsi
	pop	rdx
	pop	r15
	pop	rbx
	pop	rdi
	ret

revstr:
	push	rsi
	mov	rcx, rsi
	mov	rsi, rdi	; RDI points to start of string
	add	rsi, rcx
	dec	rsi		; RSI points to end of string
	shr	rcx, 1		; loop [length / 2] times (rounded down)
	jz	rsdone
rsloop:	mov	ah, byte[rsi]
	mov	al, byte[rdi]
	mov	[rsi], al
	mov	[rdi], ah
	inc	rdi
	dec	rsi
	dec	rcx
	jnz	rsloop
rsdone:	pop	rax
	ret

entry	$
	call	fmttime
	mov	[number+rax], 0x0A
	inc	rax
	mov	rdx, rax
	mov	rsi, number
	xor	rdi, rdi
	inc	rdi		; stdout
	xor	rax, rax
	inc	rax		; syscall write
	syscall
	xor	rdi, rdi
	mov	rax, 60		; syscall exit
	syscall

segment	readable

numtab	db	'0123456789'

segment	writable

number	rb	11		; enough space to hold a 32-bit number + newline
