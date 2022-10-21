# Computes if the number stored in "number" and "cnumber" is prime

.data
    number: .long 53
    cnumber: .long 53
    iterator: .long 2
    isprime: .asciz "Your number is prime"
    notprime: .asciz "Your number is not prime"
.text

.globl main

main:
    # We recreate the prime algorithm
    mov number, %ebx
    mov iterator, %eax

    # We cover the edge cases with 0 and 1
    mov $0, %ecx
    cmp %ebx, %ecx
    je notprime

    mov $1, %ecx
    cmp %ebx, %ecx
    je notprime

    jmp loopbody

loopbody:
    mov number, %eax
    mov iterator, %ebx
    
    mov $0, %edx
    div %ebx # Number = number / iterator
    
    mov $0, %ecx
    cmp %edx, %ecx # We have the modulo in edx
    je numberisnotprime
    jmp addtoiterator

addtoiterator:
    # We increase the iterator
    mov cnumber, %eax
    mov iterator, %ebx
    add $1, %ebx
    mov %ebx, iterator
    
    cmp %eax, %ebx # If the counter is equal to the number then it is prime (it reached its max value)
    je numberisprime
    # Else, we compare errthing again
    mov %eax, number # We reload the value of number
    jmp loopbody

numberisnotprime:
    mov $4, %eax
    mov $1, %ebx
    mov $notprime, %ecx
    mov $24, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80

numberisprime:
    mov $4, %eax
    mov $1, %ebx
    mov $isprime, %ecx
    mov $20, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80