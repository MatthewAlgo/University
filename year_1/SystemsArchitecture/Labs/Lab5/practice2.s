.data
    x: .long 2
    y: .long 3
    s: .space 4
.text
add:
    pushl %ebp
    mov %esp, %ebp
    pushl %ebx
    movl 8(%ebp), %eax
    addl 12(%ebp), %eax
    movl 16(%ebp),%ebx
    movl %eax, 0(%ebx)
    
    popl %ebx
    popl %ebp
    ret
.globl main
main:
    movl $5, %eax
    movl $6, %ebx
    pushl %eax
    pushl $s
    pushl y
    pushl x
    call add
    popl %edx
    popl %edx
    popl %edx
    popl %eax

eticheta:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80