.data
    var1: .long 16
    var2: .long 64
.text
.globl main

main:
    mov var1, %eax
    mov var2, %ebx
    jmp compare
compare:
    cmp %eax, %ebx
    jne loopbody ;// If eax != ebx jump to loopbody
    jmp etexit ;// If we get here, jump to exit

loopbody:
    add $1, %eax
    jmp compare

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80    


