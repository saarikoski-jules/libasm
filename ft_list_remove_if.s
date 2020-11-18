section .text:
	global _ft_list_remove_if
	extern _asm_list_scoot

; Params:
; rdi: t_list **begin_list
; rsi: void* data
; rdx: int cmp()

_ft_list_remove_if:
