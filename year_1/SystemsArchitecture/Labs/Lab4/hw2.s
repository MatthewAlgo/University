# Find maximum value in array 
.data
    arr: .long 25434, 34,254343, 25434, 34, 234, 34, 453,25434 , 654, 234, 234, 654, 6475,254343
    arrlength: .long 15
    currentelement: .space 4
    maximum: .space 4
    countmaximum: .space 4
.text

.globl main

main:
    mov arrlength, %ecx
    mov $-1, maximum
    mov $0, countmaximum
    jmp etloop

etloop:
    mov %ecx, %edx
    dec %edx

    lea arr, %eax
    movl (%eax, %edx, 4), %ebx
    # The current element in array at ebx

    mov %ebx, currentelement
    mov maximum, %eax
    cmp %ebx, %eax 
    je incrementcountermax 
    jl updatemaximum

    cmp $0, %edx
    je etexit

    loop etloop

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80

updatemaximum:
    mov %ebx, maximum
    mov $1, countmaximum

    cmp $0, %edx
    je etexit
    loop etloop

incrementcountermax:
    mov countmaximum, %ebx
    inc %ebx
    mov %ebx, countmaximum

    cmp $0, %edx
    je etexit
    loop etloop
