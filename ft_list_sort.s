section .text
	global _ft_list_sort

; rdi: head
; rsi: sorting function


_ft_list_sort:
	mov rbx, rsi		; function pointer now stored in rbx
	mov rcx, rdi
	mov rdx, [rcx]		; first value now stored in rdx
	mov rdi, rdx

	
	mov r9, [rcx + 8]
	cmp r9, 0x0
	je oops
	mov rsi, [r9]		; store head->next->data in rsi, works, idk why!

	call rbx
	ret

oops:
	mov rax, 700
	ret
