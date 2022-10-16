.data
    x: .long 32
    y: .long 32
    result1: .space 4
    result2: .space 4
    pass: .asciz "PASS\n"
    fails: .asciz "FAIL\n"
.text
.globl main

main: 
    movl $0, %edx
    mov y, %eax
    mov x, %ebx
    idiv %ebx

    ;// %eax == y / x = 2
    movl %eax, result1

    mov y, %eax
    mov x, %ebx
    imul %ebx

    mov %eax, result2

    mov result1, %eax
    add result2, %eax
    ;// Final result in %eax

    ;///////////////////
    ;// We compare the two numbers
    mov x, %eax
    mov y, %ebx
    cmp %eax, %ebx
    je equal_values

    mov $4, %eax
    mov $1, %ebx
    mov $fails, %ecx
    mov $5, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80

equal_values:
    mov $4, %eax
    mov $1, %ebx
    mov $pass, %ecx
    mov $5, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80

