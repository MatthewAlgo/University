.data
    vector: .long 10, 20, 30, 40, 50, 60
    counter: .long 6
.text
.globl main

main: 
    lea vector, %edi
    mov $0, %ecx ;// Counter points to the beginning of the array
    movl (%edi, %ecx, 4), %edx ;// Moves %edi + 4*ecx into edx
    jmp loopbody

loopbody:
    add $1, %ecx
    movl (%edi, %ecx, 4), %edx ;// In edx we should have the current number from the array
    cmp counter, %ecx
    jne loopbody
    jmp jetexit

jetexit:
    movl $1, %eax
    movl $0, %edx
    int $0x80


