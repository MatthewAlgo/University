.data
    vector: .long 2, 4, 6, 8
    s: .asciz "Hello World!"
    bytevar: .space 1
    longvar: .space 4
.text

.globl main

main:
    mov $vector, %eax
    mov $s, %ebx

    mov $3, %ecx
    jmp et_loop


et_loop:
    movl (%eax, %ecx, 4), %edx
    mov %edx, longvar
    
    mov $0, %edx
    
    movb (%ebx, %ecx, 1), %dl
    mov %dl, bytevar

    loop et_loop

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80

