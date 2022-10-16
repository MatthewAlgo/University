.data
.text
.globl main

main:
    movl $0, %eax
    mov %eax, %ebx
    mov %ebx, %ecx

    movl $1, %eax
    movl $0, %ebx
    int $0x80