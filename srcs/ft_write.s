; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: jsaariko <jsaariko@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/10/03 15:34:36 by jsaariko      #+#    #+#                  ;
;    Updated: 2020/11/19 14:06:54 by jsaariko      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_write
	extern ___error

_ft_write:
	mov rax, 0x02000004		; set syscall to write
	syscall					; make syscall
	jc fail					; Check if syscall returns negative (carry flag gets set as unsigned), jump to fail
	ret						; if everything went smoothly, return
fail:

	push r12

	mov r12, rax
	call ___error			; sets errno
	mov [rax], r12
	mov rax, -1				; Set write return value to -1

	pop r12

	ret

; TODO: Should i push and pop rdi before using it/use another register
