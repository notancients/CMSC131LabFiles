global _start

section .data
    SYS_EXIT equ 60
    bNum1 db 42
    bNum2 db 73
    wAns dw 0

    wNumA dw 4321
    wNumB dw 1234
    dAns dd 0

    dNumA dd 42000
    dNumB dd 73000
    qAns dq 0

section .text

_start:

    ; wAns = bNumA * bNumB
    mov al, byte[bNum1]
    mul byte[bNum2]
    mov word[wAns], ax

    ; dAns = wNumA * wNumB
    mov ax, word[wNumA]
    mul word[wNumB]
    mov word[dAns], ax
    mov word[dAns+2], dx

    ; qAns = dNumA * dNumB
    mov eax, dword[dNumA]
    mul dword[dNumB]
    mov dword[qAns], eax
    mov dword[qAns+4], edx 
    
    ; This for the function exit
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall