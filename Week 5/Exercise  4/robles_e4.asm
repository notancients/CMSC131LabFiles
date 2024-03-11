; Create a program that checks if a given positive integer is a prime number. Create a variable                                 
; isPrime ​with the value ​1 if the number is prime, otherwise, its value is ​0​. You may assume that                                    
; the user will only give positive numbers ranging from 2-255.

; Example: 
;   num: 2 
;   isPrime: 1

global _start

section .data
    SYS_EXIT equ 60
    isPrime db 0
    currentDivisor db 1
    num db 51

section .text

_start:
    mov rcx, qword[num] ; set rcx to the number for proper amount of loops

    check_if_prime:

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ; compare first if the current divisor is one or itself
        invalid_divisors:
            mov al, byte[currentDivisor]
            cmp al, byte[num]
            je skip_one_and_itself
            ja exit_here ; skip if divisor is already greater than the number, this happens due to the -
            ; way the loop has be implemented
            cmp al, 1
            je skip_one_and_itself
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ; this is the actual operation
        divide:
            mov ax, 0
            mov ax, word[num]
            div byte[currentDivisor]

        ; check if ah has any remainders, if none, its composite, skip to the end
        check_remainder:
            cmp ah, 0
            je exit_here

        ; flag for skipping 1 and itself
        skip_one_and_itself:
            inc byte[currentDivisor]

        loop check_if_prime

        ; we would only get here if the loop has been exhausted, any composite numbers
        ; would've been caught by check remainder and sent immediately to exit here
        mov byte[isPrime], 1

    exit_here:
        mov rax, SYS_EXIT
        xor rdi, rdi
        syscall