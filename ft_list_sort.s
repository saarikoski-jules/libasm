section .text
	global _ft_list_sort
	extern _asm_list_scoot

; rdi: head
; rsi: sorting function

; iterate over each item.
; if current item and next item are in the wrong order, reorder
; keep track of swaps
; if zero swaps occur on a given iteration, you're done


_get_smallest_node:
	push r13
	push r14
	mov r13, rdi		; store smallest item in r13
	mov r14, rdi		; current item iterated over stored in r14
						; ..Can i store the same value in two places?
	push rdi
	push rsi
L1:
	mov rdi, [r13]		; Move value of smallest node into first param
	mov rsi, [r14]		; get data from current oterated over node into param
	call rbx			; call function from function pointer
	cmp eax, 0			; compare 4 byte register return (int) to 0
	jl continue			; if arg 1 is smaller, rax is negative -> do nothing
	mov r13, r14		; else store current node to smallest
continue:
	mov r14, [r14 + 8]	; cur = cur->next
	cmp r14, 0x0		; if NULL, stop iterating
	je finish			; TODO: could also do jump if zero??
	jmp L1
finish:
	pop rsi
	pop rdi
	mov rax, r13
	pop r14
	pop r13
	ret



_list_move_back:
	mov r9, r13		; r9 = cur
	cmp r9, 0x0
	je L6
	cmp qword [r9 + 8], 0x0
	je L8
L7:
	mov r9, [r9 + 8]
	cmp qword [r9 + 8], 0x0
	jne L7
L8:
	mov qword [r9 + 8], r14
	jmp list_move_back_end
L6:
	mov r13, r14
list_move_back_end:
	ret



; non volatile registers to use: rbx, rbp, r12 - r15

_ft_list_sort:
	mov rbx, rsi		; function pointer now stored in rbx
	mov r12, rdi		; head of list now stored in r12 ; TODO: Do i need this?
	mov r13, 0x0		; store head of new list here

	push rsi
	push rdi

L4:
	call _get_smallest_node
	mov r14, rax		; store element to reposition in r14


	mov rax, 0
	mov rdi, r12		; head of list
	mov rsi, r14		; param2, elem to remove
	call _asm_list_scoot
	mov r12, rax		; head of new list into r12

	mov qword [r14 + 8], 0

	call _list_move_back

	mov r11, [r12 + 8]
	cmp r11, 0x0
	jne L4

	push r14
	mov r14, r12
	call _list_move_back
	pop r14

end_sort:
	pop rdi
	pop rsi

	mov rdi, r13
	ret