section .text
    global _ft_read
    extern ___error

_ft_read:                   ; same as write, but read <3
    mov rax, 0x2000003
    syscall
    jc fail
    ret
fail:

    push r12

    mov r12, rax
    call ___error
    mov [rax], r12
    mov rax, -1

    pop r12

    ret

; TODO: Should i push and pop rdi before using it/use another register