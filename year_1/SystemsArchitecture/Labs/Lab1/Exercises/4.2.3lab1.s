.data
    a: .long 4
    b: .long 16
    c: .long 32
    min: .space 4
.text
.globl main

main: 
    mov a, %eax
    mov b, %ebx
    cmp %ebx, %eax
    jge agreaterthanb
    jmp asmallerthanb
agreaterthanb:
    mov c, %ecx
    cmp %eax, %ecx
    jge bisthesmallest ;// c >= a >= b

    cmp %ebx, %ecx
    jge bisthesmallest ;// a > c >= b

    jmp cisthesmallest ;// a > b > c
    
asmallerthanb: ;// a < b
    mov c, %ecx
    cmp %eax, %ecx
    jle cisthesmallest ;// c <= a < b

    cmp %ebx, %ecx
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