global _start

section .data
    SYS_EXIT equ 60
    bnum db 5
    wnum dw 2000
    dnum dd 100000
    qnum dq 1234567890
    message db "Hello!", 10

section .text

_start:
    mov ecx, dword[dnum]
    mov cl, byte[bnum]
    mov dword[dnum], ecx
    mov cx, word[wnum]

    ;exit code
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall