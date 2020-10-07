; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: jsaariko <jsaariko@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/10/03 15:34:36 by jsaariko      #+#    #+#                  ;
;    Updated: 2020/10/07 15:53:17 by jsaariko      ########   odam.nl          ;
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
	call ___error			; calling ___error sets errno
	mov rax, -1				; Set write return value to -1
	ret
