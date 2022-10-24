.data
    x: .long 7
    equalsstring: .asciz "Number is 0"
    lessstring: .asciz "Number is less than 0"
    greaterstring: .asciz "Number is greater than 0"
.text

.globl main

main:
    # We read from stdin
    # mov $3, %eax
    # mov $1, %ebx
    # movl $x, %ecx
    # mov $4, %edx
    # int $0x80

    mov x, %eax
    cmp $0, %eax
    je equals

    cmp $0, %eax
    jg greater

    cmp $0, %eax
    jl less

equals:
    mov $4, %eax
    mov $0, %ebx
    mov $equalsstring, %ecx
    mov $11, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80
greater:
    mov $4, %eax
    mov $0, %ebx
    mov $greaterstring, %ecx
    mov $24, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80
less:
    mov $4, %eax
    mov $0, %ebx
    mov $lessstring, %ecx
    mov $21, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80


    
