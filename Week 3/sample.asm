global _start

section .data
    SYS_EXIT equ 60
    bNum1 db 42
    bNum2 db 73
    bAns db 0

    wNum1 dw 4321
    wNum2 dw 1234
    wAns dw 0

    qNum1 dq 42000000
    qNum2 dq 73000000
    qAns dq 0

section .text

_start:

    mov rax, 4
    add rax, 42
    add rax, qWord[qNum2]

    ; sample for subtraction
    sub qword[qNum1], 300

    ; sample for multiplication

    ; This for the function exit
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall