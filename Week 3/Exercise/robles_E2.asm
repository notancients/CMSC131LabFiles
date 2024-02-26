; call input file using ;; gdb -x input.txt

global _start

section .data
    SYS_EXIT equ 60
    
    age db 1
    daysInYear dw 365
    hoursInDay dd 24

    days dd 0
    hours dq 0

section .text

_start:

    ; solve for days
    ; days = age * daysInYear
    mov ah, 0
    mov al, byte[age]
    ; by this point ax is just age with 0 in front
    mul word[daysInYear]
    mov word[days], ax
    mov word[days+2], dx

    ; zero out all the registers to avoid issues
    mov dx, 0
    mov ax, 0
    
    ; solve for hours using days
    ; hours = days * hoursInDay
    mov eax, dword[days]
    mul dword[hoursInDay]
    mov dword[hours], eax
    mov dword[hours+4], edx

; This for the function exit
exit_here:
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall
    