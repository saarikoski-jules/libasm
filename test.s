
section .text
	global _test

_test:
	lea rdx, [rel a]
	mov [rdx], dword 12
	mov rax, [rel a]
	ret

section .bss
	a: resq 1