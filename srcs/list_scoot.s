section .text
	global _asm_list_scoot

; Params:
; rdi: t_list *head
; rsi: void *value
; return new t_list *head


; TODO: Breaks when only one list element?

_asm_list_scoot:		; TODO: when rdi == NULL or rdi->next == NULL
	mov r9, rdi		; head in r9
	mov r10, rdi	; store prev value

	cmp rdi, rsi
	jne L3
	mov rdi, [rdi + 8]
	jmp list_scoot_end
L3:
	mov r10, r9
	mov r9, [r9 + 8]
	cmp r9, rsi
	jne L3

	mov r8, [r9 + 8]	; r8 holds pointer to cur->next
	mov [r10 + 8], r8	; store cur->next into prev->next

	jmp list_scoot_end

list_scoot_end:
	mov rax, rdi
	ret
