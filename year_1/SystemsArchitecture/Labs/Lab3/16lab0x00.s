.data
    vector: .long 3, 7, 9, 23, 76
    vectorlen: .long 5
    pivotr: .space 4
    pivotl: .space 4
    middle: .space 4

    wordtosearch: .long 23
.text

.globl main

main: 
    lea vector, %eax
    movl vectorlen, %ecx
    mov vectorlen, %eax
    mov %eax, pivotr
    mov $0, pivotl
    jmp et_loop

et_loop:
    # Do binary search
    mov pivotr, %eax
    mov pivotl, %edx
    sub %edx, %eax
    shr %eax # eax = (pivotr - pivotl) / 2

etexit: 
    mov $0, %eax
    mov $1, %ebx
    int $0x80
