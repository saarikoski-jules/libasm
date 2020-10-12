section .text
	global _ft_atoi_base
	extern _ft_strlen

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

_validate_charset:
	cmp rsi, 0x0				; check if string is NULL
	je invalid_charset			; if NULL, invalid
	mov rcx, -1					; initialize interator
L1:
	inc rcx						; increment interator
	mov ah, [rsi + rcx]			; move byte at index to be compared
	cmp ah, 43					; invalid if there is a plus
	je invalid_charset
	cmp ah, 45					; invalid if there's a minus
	je invalid_charset
	cmp ah, 0					; if not the null byte, loop again
	jne L1
	cmp rcx, 1					; compare strlen to 1	
	jle invalid_charset			; if 1 or less, charset is invalid
	call _check_duplicate		; return result of check duplicate
	ret
invalid_charset:
	mov rax, 0					; return 0
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
	mov ah, [rdi + rcx]			; move current char to be compared
	push rcx					; save num str index
	mov rcx, -1					; set up iterator
L10:
	inc rcx
	cmp ah, [rsi + rcx]			; check if current byte in charset is saved char
	jne L10						; if not, try the next one
	mov rax, rcx				; when found macthing byte, return value of char
	pop rcx						; get num str index back
	ret

_multiply:
	mov rcx, rsi				; use number of times as iterator
	mov rax, 0					; start off from 0
L11:
	add rax, rdi				; add number to multiply to result
	dec rcx
	cmp rcx, 0					; check if we've added number enough times
	jne L11						; if not, add one more
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
	cmp rax, 0					; if not valid, go to invalid_params
	je invalid_params
	mov rcx, -1					; start up index counter
	mov ah, [rdi]				; move to be compared byte to temp register
	cmp ah, 45					; check if -
	je L7						; jump to label L7 to increment
	cmp ah, 43					; check if +
	jne L8						; if not plus, skip over incrementing
L7:
	inc rcx
L8:								; save strlen of charset into base
	push rdi					; save num string
	mov rdi, rsi				; pass charset into strlen
	call _ft_strlen				; base now stored in rax
	mov rdx, rax				; store base in rdx
	pop rdi						; bring num string back
	mov rax, 0					; zero out rax so I can build my int there
L9:								; main loop
	inc rcx
	push rax					; store result value to get current number in string
	call _find_number			; translate current char into a number
	mov rbx, rax				; store result in rbx
	pop rax						; get result integer back
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
	cmp byte [rdi + rcx + 1], 0	; check if next char is the null byte
	jne L9						; if not, loop again
	cmp byte [rdi], 45			; check if first char of num is -
	jne completed				; if not -, we're done here
	neg rax						; if the first char is -, get the negative value
completed:
	ret							; return actual result
invalid_params:
	mov rax, 0					; if params are invalid, return 0
	ret

; TODO: shouldn't use ah as temporary register for parst where rax is important
; TODO: Test if this works instead of adding rcx into rbx which is zero, if you can just use mov and the value is stored in both
; TODO: Should I use ah as the register...?
