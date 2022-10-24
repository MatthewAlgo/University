# Swap eax and ebx
.data
    x: .long 4
    y: .long 43
.text
.globl main

main:
    mov x, %eax
    mov y, %ebx

    xor %eax, %ebx
    xor %ebx, %eax
    xor %eax, %ebx

    mov $1, %eax
    mov $0, %ebx
    int $0x80
