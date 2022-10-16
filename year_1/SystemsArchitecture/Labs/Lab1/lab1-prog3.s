.data
    x1: .long 42
    x2: .long 2
    inmultire: .space 4 ;// We declare (allocate) - 4 bytes of empty memory for inmultire
    impartire: .space 4
    suma: .space 4
    diferenta: .space 4
    rest: .space 4
.text
.globl main

main: 
    ;// Suma, diferenta, inmultirea, catul si restul impartirii
    ;// We are doing the difference of the numbers (x1-x2)
    ;// EDX and EAX for multiplication / division
    mov x1, %eax
    mov x2, %ebx
    add %eax, %ebx ;// ebx = ebx + eax -> the sum is in ebx
    movl %ebx, suma

    mov x1, %ebx
    mov x2, %eax
    sub %eax, %ebx ;// ebx = ebx - eax -> the sum is in ebx
    movl %ebx, diferenta

    mov $0, %edx ;// We load 0 in edx -> we don't want to operate on big numbers
    mov x1, %eax ;// We load the first operand into eax
    imul x2 ;// We execute eax = eax * x2 = x1 * x2 -> the result stored in eax
    movl %eax, inmultire

    mov $0, %edx ;// We load 0 in edx -> we don't want to operate on big numbers
    mov x1, %eax ;// We load the first operand into eax
    idiv x2 ;// We execute eax = eax / x2 -> final result in eax
    movl %eax, impartire

    mov $1, %eax ;// Preparing the registers for exit syscall
    mov $0, %ebx
    int $0x80


    