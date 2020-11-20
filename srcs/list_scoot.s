section .text
	global _list_scoot

; Params:
; rdi: t_list *head
; rsi: void *value
; return new t_list *head


; TODO: Breaks when only one list element?

_list_scoot:			; TODO: when rdi == NULL or rdi->next == NULL
	mov r9, rdi			; store prev val in r9
	mov r10, rdi		; store cur val in r10
						; head will remain at rdi
	; cmp qword [rdi + 8], 0x0


	cmp rdi, rsi		; if the first item is not item to remove, loop
	jne L3
	mov rdi, [rdi + 8]	; else, move list head to the next element and finish
	jmp list_scoot_end
L3:
	mov r10, r9			; move old cur into prev
	mov r9, [r9 + 8]	; cur = cur->next

	; check for list end?
	cmp r9, 0x0
	je end

	cmp r9, rsi			; check if cur element is the element we're looking for
	jne L3				; if not, loop again

	mov r8, [r9 + 8]	; r8 holds pointer to cur->next
	mov [r10 + 8], r8	; store cur->next into prev->next

	jmp list_scoot_end

list_scoot_end:
	mov rax, rdi		; return new list head in case it has changed
end:
	ret
