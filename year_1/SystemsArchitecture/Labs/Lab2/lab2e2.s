.data
    x1: .long 64
    x2: .long 2
    multirea: .long 16
    result11: .space 4
    result12: .space 4
    resultf1: .space 4
    result21: .space 4
    result22: .space 4
    resultf2: .space 4

    passtring: .asciz "PASS"
    failstring: .asciz "FAIL"

.text

.globl main

main:
    mov x1, %eax
    mov $0, %edx
    mov $16, %ecx
    idiv %ecx
    movl %eax, result11

    mov x2, %eax
    mov $0, %edx
    mov $16, %ecx
    imul %ecx
    mov %eax, result12

    mov result11, %eax
    mov result12, %ebx
    add %ebx, %eax
    mov %eax, resultf1

    mov x1, %eax
    sar $4, %eax
    mov %eax, result21
    
    mov x2, %ebx
    sal $4, %ebx
    mov %ebx, result22

    mov %eax, result21
    mov %ebx, result22
    add %ebx, %eax
    mov %eax, resultf2

    mov resultf1, %eax
    mov resultf2, %ebx
    cmp %eax, %ebx
    je etexit

    jmp eterror

etexit: 
    # print "PASS"
    mov $0x4, %eax
    mov $0x1, %ebx
    mov $passtring, %ecx
    mov $4, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80

eterror:
    # print "FAIL"
    mov $0x4, %eax
    mov $0x1, %ebx
    mov $failstring, %ecx
    mov $4, %edx
    int $0x80

    mov $1, %eax
    mov $1, %ebx
    int $0x80

