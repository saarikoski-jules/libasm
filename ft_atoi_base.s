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
	cmp rdi, 0x0
	je invalid_num
	push rcx
	mov rcx, -1
L5:
	inc rcx
	
invalid_num:
	mov rax, 0
	ret

; TODO: Should I use ah as the register...?

; return zero if:
; + or - within charset
; base is 1 or less
; num has plus or minus anywhere except as the first char
; num has any other chars in it than mentioned in charset
_validate:
	call _validate_charset
	cmp rax, 0
	je invalid
	call _validate_num
	ret
invalid:
	mov rax, 0
	ret

_ft_atoi_base:
	call _validate
	ret


; _ft_atoi_base:
; 	call _validate
; 	push rdi
; 	mov rdi, rsi	; TODO: is the value of rsi only in rdi now, or in both?
; 	call _ft_strlen
; 	ret








	