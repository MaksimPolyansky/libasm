section .text
	global _ft_strcpy				; (dst, src) or (rdi, rsi)

_ft_strcpy:
	xor rax, rax

.while:
	mov cl, byte [rsi + rax]		; c = rsi[i]
	cmp cl, 0
	je .return
	mov byte [rdi + rax], cl		; rdi[i] = c
	inc rax
	jmp .while

.return:
	mov byte [rdi + rax], 0
	mov rax, rdi
	ret