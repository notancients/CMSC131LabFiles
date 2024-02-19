global _start

section .data
    SYS_EXIT equ 60
    bnum db 5
    wnum dw 2000
    dnum dd 100000
    qnum dq 123457890
    message db "Hello!",10

section .text

_start:
    mov ax, word[wnum]; ax = wnum ; compared to c, doing it this way means pass by value
    mov al, byte[bnum]  ; al = bnum ; doing it without the brackets is passing by reference
    
    mov ebx, dword[dnum]    ; ebx = dnum
    mov bx, word[wnum]  ; bx = wnum

    ;exit code

    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall