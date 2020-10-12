; + and - can be specified as the first char, otherwise only chars specified in base are allowed
; Build error checking function


section .text
	global _ft_atoi_base
	extern _ft_strlen
	extern _ft_write


; TODO: Test if this works instead of adding rcx into rbx which is zero, if you can just use mov and the value is stored in both
_check_duplicate:
	mov rcx, -1					; first iterator starts from -1
L2:
	mov rbx, 0					; rbx used as second iterator, initiate at 0
	inc rcx						; increment rcx for this iteration
	add rbx, rcx				; add rcx to zero to copy the amount
L3:
	inc rbx						; start checking duplicates at rcx index plus 1
	cmp byte [rsi + rcx], 0		; see if end of string
	je valid_charset			; if yes, its valid
	mov ah, [rsi + rbx]			; move char to be compared
	cmp ah, [rsi + rcx]			; compare to other index to check for duplicates
	je L4						; invalid, if true
	cmp byte [rsi + rbx], 0		; check if second index has reached end of string
	je L2						; if yes, loop again from the start
	jmp L3						; else increment only internal loop
valid_charset:
	mov rax, 1					; return 1 if valid
	ret
L4:
	mov rax, 0					; return 0 if invalid
	ret


; fail if there is a + or - within charset
; TODO: if the same char is mentioned multiple times
; contains only one or less chars
; if charset is NULL
_validate_charset:
	cmp rsi, 0x0			; check if string is NULL
	je invalid_charset		; if NULL, invalid
	mov rcx, -1				; initialize interator
L1:
	inc rcx					; increment interator
	mov ah, [rsi + rcx]		; move byte at index to be compared
	cmp ah, 43				; invalid if there is a plus
	je invalid_charset
	cmp ah, 45				; invalid if there's a minus
	je invalid_charset
	cmp ah, 0				; if not the null byte, loop again
	jne L1
	cmp rcx, 1				; compare strlen to 1	
	jle invalid_charset		; if 1 or less, charset is invalid
	call _check_duplicate	; return result of check duplicate
	ret
invalid_charset:
	mov rax, 0				; return 0
	ret



_validate_num:
	cmp rdi, 0x0				; check if num string is null
	je invalid_num				; invalid argument
	mov rcx, -1					; initialize num iterator

	mov ah, [rdi]				; move first char of num to compare
	cmp ah, 43					; check if plus
	je L12						; if yes, go to increment
	cmp ah, 45					; check if minus
	jne L5						; if not, skip incrementing
L12:	
	inc rcx						; increment rcx to skip + or -

L5:								; start actual loop
	inc rcx						; increment num iterator
	mov rbx, -1					; set iterator charset
L6:								; second loop
	inc rbx						; increment charset iterator
	cmp byte [rdi + rcx], 0		; if at the end of num string, valid
	je valid_num
	cmp byte [rsi + rbx], 0		; if at the end of charset, invalid
	je invalid_num
	mov ah, [rdi + rcx]			; move char to be compared
	cmp ah, byte [rsi + rbx]	; check if match
	je L5						; if match, increment num string
	jmp L6						; else increment charset string
invalid_num:
	mov rax, 0					; if invalid, return 0
	ret
valid_num:
	cmp rcx, 0					; if empty string, invalid
	jle invalid_num
	mov rax, 1					; if valid, return 1
	ret

; TODO: Should I use ah as the register...?






; return zero if:
; + or - within charset
; base is 1 or less
; num has plus or minus anywhere except as the first char
; num has any other chars in it than mentioned in charset
_validate:
	call _validate_charset
	cmp rax, 0					; if charset is not valid, return 0
	je invalid
	call _validate_num			; if charset is valid, check if num is valid
	ret							; return result of validate_num
invalid:
	mov rax, 0					; if invalid, return 0
	ret




_find_number:
	mov ah, [rdi + rcx]
	push rcx
	mov rcx, -1
L10:
	inc rcx
	cmp ah, [rsi + rcx]
	jne L10
	mov rax, rcx
	pop rcx
	ret



_multiply:
	mov rcx, rsi
	mov rax, 0
L11:
	add rax, rdi
	dec rcx
	cmp rcx, 0
	jne L11
	ret

; register use:
; rdi: number to translate
; rsi: charset
; rcx: index
; rax: final int
; rdx, base
; rbx: current number
; ah: temp comparison register
_ft_atoi_base:
	call _validate				; check if params are valid
	cmp rax, 0
	je invalid_params

	mov rcx, -1					; check if first char is - or + and increment over it
	mov ah, [rdi]
	cmp ah, 45
	je L7
	cmp ah, 43
	jne L8
L7:
	inc rcx

L8:								; save strlen of charset into base
	push rdi					; save num string
	mov rdi, rsi
	call _ft_strlen				; base now stored in rax
	mov rdx, rax				; store base in rdx
	pop rdi						; bring num string back
	mov rax, 0

L9:								; main loop
	inc rcx
	push rax
	call _find_number			; translate current char into a number
	mov rbx, rax				; store result in rbx
	pop rax


	push rdi					; save number string on stack
	push rsi					; save charset strin gon stack
	push rcx					; save index on the stack
	mov rdi, rax				; multiply current result
	mov rsi, rdx				; by base
	call _multiply				; result of multiplication is stored in rax, rax = rax * rdx
	pop rcx						; get index back
	pop rsi						; get charset back from stack
	pop rdi						; get number string back from stack
	add rax, rbx				; add new number to the back

	cmp byte [rdi + rcx + 1], 0
	jne L9						; if next char is not null byte, continue 

; result =	result	*	base	+	cur
; rax =		rax		*	rdx		+	_find_number/rbx
	cmp byte [rdi], 45
	jne completed
	neg rax
completed:
	ret
invalid_params:
	mov rax, 0					; if params are invalid, return 0
	ret



; TODO: shouldn't use ah as temporary register for parst where rax is important