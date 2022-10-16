.data
    a: .long 4
    b: .long 16
    c: .long 32
    min: .space 4
.text
.globl main

main: 
    movl $a, %eax
    movl $b, %ebx
    cmp %eax, %ebx
    jge agreaterthanb
    jmp asmallerthanb
agreaterthanb:
    mov c, %ecx
    cmp %ecx, %eax
    jge bisthesmallest ;// c >= a >= b

    cmp %ecx, %ebx
    jge bisthesmallest ;// a > c >= b

    jmp cisthesmallest ;// a > b > c
    
asmallerthanb: ;// a < b
    mov c, %ecx
    cmp %ecx, %eax
    jle cisthesmallest ;// c <= a < b

    cmp %ecx, %ebx
    jge aisthesmallest ;// a < b <= c

    ;// c > a guaranteed and c < b => a < c < b
    jmp aisthesmallest

bisthesmallest:
    mov %ebx, min
    jmp jetexit

cisthesmallest: 
    mov %ecx, min
    jmp jetexit
aisthesmallest:
    mov %eax, min
    jmp jetexit
jetexit:

    mov $4, %eax
    mov $1, %ebx
    mov $min, %ecx
    mov $4, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80