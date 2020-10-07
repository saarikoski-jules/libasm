section .text
    global _ft_read
    extern ___error

_ft_read:                   ; same as write, but read <3
    mov rax, 0x2000003
    syscall
    jc fail
    ret
fail:
    call ___error
    mov [rax], 12
    ret

; TODO: Read segfaults when given bad 