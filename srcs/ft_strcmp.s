bits 64

global ft_strcmp

segment .text

ft_strcmp:
	push	rcx
	xor		rcx, rcx
	jmp		compare

compare:
	mov	al, BYTE [rdi + rcx]
	mov	bl, BYTE [rsi + rcx]
	cmp	al, 0
		je	end_loop
	cmp	bl, 0
		je	end_loop
	cmp	al, bl
		jne end_loop
	inc	rcx
	jmp compare
	

end_loop:
	movzx	rcx, al ; movzx = moves a reg of a lesser size into a greater register filling it with zeros
	movzx	rbx, bl
	sub		rcx, rbx
	mov		rax, rcx
	pop		rcx
	ret
