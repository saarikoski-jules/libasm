segment .text
	global _ft_strdup
	extern _ft_strlen
	extern _malloc
	extern _ft_strcpy

_ft_strdup:
    ; push    rbp
    ; mov     rbp, rsp
    ; and     rsp, -10h
    ; sub     rsp, 8

    ; push    rbp			;this aligns stack by something random..?
    ; mov     rbp, rsp
    ; and     rsp, -10h
    ; sub     rsp, 8



	call _ft_strlen		; get strlen to allocate
	inc rax				; add space for string terminator
	push rdi			; save s1
	mov rdi, rax		; use length of string as argument for malloc
	call _malloc		; call malloc
	pop rdi				; get s1 back
	mov rsi, rdi		; set s1 as src argument for strcpy call
	mov rdi, rax		; set malloced memory area as dest for strcpy call
	call _ft_strcpy		; call strcpy
	mov rax, rdi		; return dest with copied string in it

    ; pop     rbp


	ret



; 			global		_ft_strdup
; 			extern		_malloc
; 			extern		_ft_strlen
; 			extern		_ft_strcpy

; _ft_strdup:

; 		    push    rbp
;     		mov     rbp, rsp
;     		and     rsp, -10h
;     		sub     rsp, 8



; 			push		rbp

; 			mov			rbp, rsp

; 			mov			r12, rdi	; Copy original pointer to a non-volatile
; 									; register.

; 			call		_ft_strlen	; Length of string
; 			mov			rdi, rax

; 			inc			rdi			; +1 for '\0'
; 			call		_malloc		; Malloc appropriate no of bytes
; 			test		rax, rax	; Test if allocation was successful
; 			jz			exit
; 			mov			rdi, rax
; 			mov			rsi, r12
; 			call		_ft_strcpy	; rax = ft_strcpy(rdi, rsi)

; exit:
; 			mov			rsp, rbp
; 			pop			rbp




; 		    pop     rbp




; 			ret