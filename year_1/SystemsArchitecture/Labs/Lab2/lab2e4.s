.data
    x1: .long 29
    method1: .space 4
    method2: .space 4

    primenum: .asciz "Number is prime"
    notprimenum: .asciz "Number is not prime"

.text

.globl main

main:
    mov x1, %eax
    mov $2, %ecx
    jmp mainlooptocheckifprime

increment:
    add $1, %ecx
    cmp %ecx, %eax
    jne mainlooptocheckifprime
    jmp endprim

mainlooptocheckifprime:
    mov $0, %edx
    mov x1, %eax
    idiv %ecx

    mov $0, %eax
    cmp %eax, %edx
    mov x1, %eax

    jne increment
    jmp endneprim

endprim:
    mov $4, %eax
    mov $1, %ebx
    mov $primenum, %ecx
    mov $15, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80
    
endneprim:
    mov $4, %eax
    mov $1, %ebx
    mov $notprimenum, %ecx
    mov $20, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80