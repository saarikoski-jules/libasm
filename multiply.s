section .text
	global _multiply

_multiply:
	mov rcx, rsi
	mov rax, 0
L11:
	add rax, rdi
	dec rcx
	cmp rcx, 0
	jne L11
	ret
