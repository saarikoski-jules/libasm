; + and - can be specified as the first char, otherwise only chars specified in base are allowed

section .text
	global _ft_atoi_base
	extern _ft_strlen

_ft_atoi_base:
	push rdi
	mov rdi, rsi	; TODO: is the value of rsi only in rdi now, or in both?
	_ft_strlen








	