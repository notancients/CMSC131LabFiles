; call input file using ;; gdb -x input.txt

global _start

section .data
    SYS_EXIT equ 60
    
    age dw 1
    daysInYear dw 365
    hoursInDay dd 24

    days dd 0
    hours dq 0

section .text

_start:

    ; solve for days
    ; days = age * daysInYear
    mov ax, word[age]
    mul word[daysInYear]
    mov word[days], ax
    mov word[days+2], dx

    ; zero out all the registers to avoid issues
    mov dx, 0
    mov ax, 0
    
    ; solve for hours using days
    ; hours = days * hoursInDay
    mov eax, dword[days] ; typecast into a double word, to avoid size mismatch
    mul dword[hoursInDay]
    mov dword[hours], eax
    mov dword[hours+4], edx

; This for the function exit
exit_here:
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall
    