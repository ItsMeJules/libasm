bits 64

global ft_strlen

segment .text

ft_strlen:
	push	rcx
	mov	rcx, 0
	jmp	count

count:
	cmp	BYTE [rdi + rcx], 0
	jz	exit
	inc	rcx
	jmp	count

exit:
	mov	rax, rcx
	pop	rcx
	ret
