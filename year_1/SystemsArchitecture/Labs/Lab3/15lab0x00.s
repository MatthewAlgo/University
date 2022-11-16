.data
    vector: .long 1245, 342, 543523, 342, 4234, 1245, 543523
    vectorlen: .long 7
    xorredsum: .long 0
    dwordvar: .space 4
    wordvar: .space 2
.text

.globl main

main:
    lea vector, %eax
    movl vectorlen, %ecx
    jmp et_loop

et_loop:
    mov %ecx, %edx
    dec %edx

    movl (%eax, %edx, 4), %ebx
    movl %ebx, dwordvar

    mov xorredsum, %eax
    xor %eax, %ebx
    mov %ebx, xorredsum

    lea vector, %eax # We load the address of the vector into %eax again
    loop et_loop

etexit:
    mov $0, %eax
    mov $1, %ebx
    int $0x80