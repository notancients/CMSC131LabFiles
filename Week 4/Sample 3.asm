global _start

section .data
    SYS_EXIT equ 60
    x db 25
    y db 5
    result db 0

section .text

_start:

    mov al, byte[x]
    cmp al, byte[y]
    jb is_above

    mov al, byte[x]
    mov byte[result], al

    jmp exit_here

is_above:
    mov al, byte[y]
    mov byte[result], al

exit_here:
    mov rax, 60
    xor rdi, rdi
    syscall
