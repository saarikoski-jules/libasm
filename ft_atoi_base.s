; + and - can be specified as the first char, otherwise only chars specified in base are allowed
; Build error checking function


section .text
	global _ft_atoi_base
	extern _ft_strlen
	extern _ft_write


; TODO: Test if this works instead of adding rcx into rbx which is zero, if you can just use mov and the value is stored in both
_check_duplicate:
	mov rcx, -1
L2:
	mov rbx, 0
	inc rcx
	add rbx, rcx
L3:
	inc rbx

	cmp byte [rsi + rcx], 0
	je valid
	mov ah, [rsi + rbx]
	cmp ah, [rsi + rcx]
	je L4
	cmp byte [rsi + rbx], 0
	jne L2
	jmp L3
valid:
	mov rax, 1
	ret
L4:
	mov rax, 0
	ret


; fail if there is a + or - within charset
; TODO: if the same char is mentioned multiple times
; contains only one or less chars
; if charset is NULL
_validate_charset:
	cmp rsi, 0x0
	je invalid
	push rcx
	mov rcx, -1
L1:
	inc rcx
	mov ah, [rsi + rcx]
	cmp ah, 43
	je invalid
	cmp ah, 45
	je invalid
	cmp ah, 0
	jne L1
	cmp rcx, 1
	jle invalid
	pop rcx
	call _check_duplicate
	ret
invalid:
	pop rcx
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








	