global _start

section .text

_start:
    mov rcx, 10
    jmp exit_here
    add rcx, 50

exit_here:
    mov rax, 60
    xor rdi, rdi
    syscall
