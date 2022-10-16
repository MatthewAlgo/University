.data
    var1: .long 16
    var2: .long 16
    var3: .long 32
    result1: .space 4 ;// Reserves space for an integer value
    result2: .space 4
    result3: .space 4
    result4: .space 4 ;// XOR
.text
.globl main

main: 
    mov var1, %eax
    mov var2, %ebx
    and %ebx, %eax
    mov %eax, result1
    ;// Final and value is inside result1

    mov var1, %eax
    not %eax
    mov %eax, result2
    ;// Final and value is inside result1

    mov var1, %eax
    mov var2, %ebx
    or %ebx, %eax
    mov %eax, result3

    mov var1, %eax
    mov var2, %ebx
    xor %ebx, %eax
    mov %eax, result4

    mov $0, %eax
    mov $1, %ebx
    int $0x80