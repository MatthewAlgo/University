.data
    string1: .asciz "Hello, my name is Matthew\n"
    string2: .ascii "Hello, world\0"
    string3: .long 32

.text
.globl main

main: 
    jmp etexit

etexit:
    movl $4, %eax
    movl $1, %ebx
    mov $string1, %ecx
    mov $26, %edx
    int $0x80
    jmp main ;// This will execute an infinite loop, acts like a "while" in C

    movl $1, %eax
    movl $0, %ebx
    int $0x80 