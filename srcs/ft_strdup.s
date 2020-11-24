segment .text
	global _ft_strdup
	extern _ft_strlen
	extern _malloc
	extern _ft_strcpy

_aligned_malloc:


_ft_strdup:
	call _ft_strlen		; get strlen to allocate

	inc rax				; add space for string terminator
	push rdi			; save s1
	mov rdi, rax		; use length of string as argument for malloc

	push rbp			; save original value of frame pointer
	mov rbp, rsp		; store top of stack in rbp
	and rsp, -32		; align stack pointer to 32 bytes as required by malloc
	call _malloc		; allocate memory
	mov rsp, rbp		; get top off stack back before popping
	pop rbp				; get original frame pointer back

	pop rdi				; get s1 back
	mov rsi, rdi		; set s1 as src argument for strcpy call
	mov rdi, rax		; set malloced memory area as dest for strcpy call
	call _ft_strcpy		; call strcpy
	mov rax, rdi		; return dest with copied string in it

	ret


; rbp is a frame pointer, a snapshot of the stack pointer before any added space at
;	the start of the stack. Can be used to find local variables and params from the
;	offset of this register
; rsp is where the top of the stack is located and where data will be popped off of

	; push    rbp
    ; mov     rbp, rsp
    ; and     rsp, -10h
    ; sub     rsp, 8

    ; call    _ft_strdup

	; mov rsp, rbp
    ; pop     rbp
    ; ret