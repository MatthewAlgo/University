;// Interchange x and y

.data
    x: .long 10
    y: .long 20
.text
.globl main

main: 
    mov x, %eax ;// eax = x
    mov y, %ebx ;// ebx = y
    mov %eax, y ;// y = x
    mov %ebx, x
    jmp etexit
etexit:
    movl $1, %eax
    movl $0, %edx
    int $0x80
    