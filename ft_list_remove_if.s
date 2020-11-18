section .text
	global _ft_list_remove_if
	extern _asm_list_scoot

; Params:
; rdi: t_list **begin_list
; rsi: void* data
; rdx: int cmp()

; _ft_list_remove_if:
	; cmp rdi, 0x0 ; if NULL, return 
	; je end

	; mov r14, [rdi]	; store value of data
	; mov r13, rdi	; cur item
	; mov r12, rsi	; store item

	; push rdi
	; push rsi

; L1:
	; mov rax, 0
	; mov rdi, [r13]
	; mov rsi, r12
	; call rdx



	; pop rsi
	; pop rdi

; end:
	; ret

_ft_list_remove_if:
	push rdi

	lea r9, [rdi]
	mov rdi, [r9]
	call rdx
	
	pop rdi
	ret