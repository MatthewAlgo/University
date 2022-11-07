.data
    x1: .long 13
    divisor: .space 4
    remainder: .space 4

    primenum: .asciz "Number is prime"
    notprimenum: .asciz "Number is not prime"

.text

.globl main

main:
    mov x1, %eax
    sub $1, %eax
    movl %eax, divisor
    mov %eax, %ecx
    jmp etbeginloop

etbeginloop:
    movl $1, %edx
    cmp %ecx, %edx
    je etprim

    movl %ecx, divisor
    mov x1, %eax
    mov $0, %edx
    idiv %ecx

    movl %edx, remainder
    mov $0, %eax

    cmp %eax, %edx
    je etneprim
    loop etbeginloop

etprim:
    mov $4, %eax
    mov $1, %ebx
    mov $primenum, %ecx
    mov $15, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80
    
etneprim:
    mov $4, %eax
    mov $1, %ebx
    mov $notprimenum, %ecx
    mov $20, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80

    