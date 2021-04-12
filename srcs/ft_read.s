section .text
	global _ft_read
	extern ___error

_ft_read:
	xor rax, rax
	mov rax, 0x2000003				; system read

.body:
	syscall							; call read
	jc .error
	jmp .return

.error:
	push rax
	call ___error
	pop rdx
	mov [rax],rdx
	mov rax, -1
	jmp .return

.return:
	ret
