global _start

section .data
    SYS_EXIT equ 60
    x db 25
    y db 5
    isEqual db "N"

section .text

_start:

    mov al, byte[x]
    cmp al, byte[y]
    jne exit_here

    mov byte[isEqual], "Y"

exit_here:
    mov rax, 60
    xor rdi, rdi
    syscall
