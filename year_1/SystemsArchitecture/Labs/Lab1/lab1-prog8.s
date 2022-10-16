.data
    x1: .long 16
    x2: .long 32
    counter: .space 4
    message_done: .asciz "Program terminated successfully\n"
    counter_decreased: .asciz "Counter decreased\n"

.text
.globl main

main: 
    mov x1, %eax
    mov x2, %ecx ;// We set the counter to x2
    jmp loopbody

loopbody:
    sub $1, %ecx
    mov %ecx, counter

    mov $4, %eax
    mov $1, %ebx
    mov $counter_decreased, %ecx
    mov $18, %edx
    int $0x80

    mov counter, %ecx
    
    loop loopbody
    jmp etexit

etexit: 
    mov $4, %eax
    mov $1, %ebx
    mov $message_done, %ecx
    mov $32, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80
