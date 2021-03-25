bits 64

global ft_strcpy

segment .text

ft_strcpy:
	push	rcx
	mov	rcx, 0
	cmp	rsi, 0
		je	exit
	jmp	copy

copy:
	mov	dl, BYTE [rsi + rcx]
	mov	BYTE [rdi + rcx], dl
	cmp	dl, 0
		je	exit
	inc	rcx
	jmp	copy

exit:
	pop	rcx
	mov	rax, rdi
	ret

