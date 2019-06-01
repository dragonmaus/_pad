format	elf64 executable 0

segment	readable executable

addindex:
	push	rdx
	mov	rdx, rdi
	add	rdi, 6
	std
ailoop:	call	hexchar
	stosw
	shr	rsi, 8
	cmp	rdi, rdx
	jge	ailoop		; loop until rdi == obuf
	add	rdi, 10
	cld
	pop	rdx
	ret

chardump:
	lodsb
	cmp	al, 0x20
	jl	cddot
	cmp	al, 0x7E
	jg	cddot
	ret
cddot:	mov	al, 0x2E
	ret

hexchar:
	push	rbx
	mov	rbx, hctable
	mov	rax, rsi
	mov	ah, al
	shr	ah, 4
	and	al, 0xf
	xlatb
	xchg	ah, al
	xlatb
	pop	rbx
	ret

entry	$
	xor	r15, r15	; current index

	; read 16 bytes
read:	mov	rdx, 16
	mov	rsi, ibuf
	xor	rdi, rdi	; stdin
	xor	rax, rax	; syscall read
	syscall
	mov	r14, rax	; input size

	; quit it no bytes read
	or	r14, r14
	jz	done

	; output current index (format: %08x)
	mov	rsi, r15
	mov	rdi, obuf
	call	addindex

	xor	r13, r13	; current byte in ibuf
hexds:	xor	r12, r12	; current byte in group

	; output a space
	mov	rax, 0x20
	stosb

hexdc:	; output a space
	mov	rax, 0x20
	stosb

	; if there are bytes remaining
	cmp	r13, r14
	jge	nobyte
	; then output current byte (format: %02x)
	mov	rsi, qword[ibuf+r13]
	call	hexchar
	stosw
	jmp	endhdc
nobyte:	; else output two spaces
	mov	rax, 0x2020
	stosw
endhdc:
	inc	r12
	inc	r13
	cmp	r12, 8
	jl	hexdc
	cmp	r13, 16
	jl	hexds

	; output two spaces
	mov	rax, 0x2020
	stosw

	; output a pipe
	mov	rax, 0x7C
	stosb

	mov	r13, r14
	mov	rsi, ibuf
chard:	or	r13, r13
	jz	endcd
	call	chardump
	stosb
	dec	r13
	jmp	chard
endcd:

	; output a pipe
	mov	rax, 0x7C
	stosb

	; output a newline
	mov	rax, 0x0A
	stosb

	sub	rdi, obuf	; get output length
	; write the output
	mov	rdx, rdi
	mov	rsi, obuf
	mov	rdi, 1		; write to stdout
	mov	rax, 1		; syscall write
	syscall

	; increment current index
	add	r15, r14

	; quit if input size < 16
	cmp	r14, 16
	je	read

done:	or	r15, r15
	jz	quit

	; output the final index
	mov	rsi, r15
	mov	rdi, obuf
	call	addindex

	; output a newline
	mov	rax, 0x0A
	stosb

	sub	rdi, obuf	; get output length
	; write the output
	mov	rdx, rdi
	mov	rsi, obuf
	mov	rdi, 1		; write to stdout
	mov	rax, 1		; syscall write
	syscall

quit:	xor	rdi, rdi
	mov	rax, 60		; syscall exit
	syscall

segment	readable

hctable	db	'0123456789abcdef'

segment	readable writeable

ibuf	rb	16
obuf	rb	79
