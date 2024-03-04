global _start

section .data
    SYS_EXIT equ 60

    ; This will be the numbers that we compare
    a db 21
    b db 15
    c db 7

    ; This will be the variables for the results
    largestNum db 0
    largestInput db "N"

section .text

_start:
    ; We first assume that A is the largest input to avoid additional jumps
    ; Not the most dynamic but this makes it cleaner
    assign_a:
        mov byte[largestInput], "A"
        mov bl, byte[a]
        mov byte[largestNum], bl
    
    ; setup al for comparison
    mov al, byte[a]

    ; line for comparing a to b
    compare_b:
        cmp al, byte[b]
        jb b_is_larger
    
    ; It's okay to go to this function since we are just comparing and not
    ; assigning any values
    compare_c:
        cmp al, byte[c]
        jb c_is_larger

    ; necessary to add this here for if a is the largest variable
    jmp exit_here


b_is_larger:
    mov byte[largestInput], "B"
    mov bl, byte[b]
    mov byte[largestNum], bl
    mov al, byte[b]

    ; jump to compare_c since we still haven't compared the last variable
    jmp compare_c

c_is_larger:
    mov byte[largestInput], "C"
    mov bl, byte[c]
    mov byte[largestNum], bl
    mov al, byte[c]

    ; not really needed but this makes easier to read
    jmp exit_here

exit_here:
    mov rax, 60
    xor rdi, rdi
    syscall
