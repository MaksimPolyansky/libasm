section .text
	global _ft_strlen

_ft_strlen:
	xor rax, rax					; i = 0

.while:
	cmp byte[rdi + rax], 0			; s[i] == '\0'?
	je .return						; if yes, jump to return
	inc rax							; i++
	jmp .while						; again

.return:
	ret								; return rax (i)
