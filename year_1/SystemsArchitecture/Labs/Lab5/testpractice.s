// We have a vector and we wanna check if is is monotonous or not

.data
    vector: .long 1, 2, 44, 34, 65, 67, 89
    length: .long 7
    zero: .long 0
    element: .space 4
    previous_element: .space 4

    sirulemonoton: .asciz "Sirul este monoton crescator\n"
    sirulnuemonoton: .asciz "Sirul nu este monoton crescator\n"

.text
.globl main

et_loop:
    add $1, %ecx
    mov length, %edx
    inc %edx
    cmp %ecx, %edx
    je et_exit
    mov %ecx, %edx
    dec %edx


    // Now we get the element at %ecx
    movl (%eax, %edx, 4), %ebx
    mov %ebx, element
    lea vector, %eax

    // We get the previous element if %edx is not zero
    cmp %edx, zero
    je first_position_element

    // Else we have the previous element here
    // Compare the previous element with the current element
    mov element, %eax
    mov previous_element, %ebx
    cmp %eax, %ebx
    jg nemonoton


    lea vector, %eax
    mov element, %ebx
    mov %ebx, previous_element
    jmp et_loop

first_position_element:
    mov element, %ebx
    mov %ebx, previous_element
    jmp et_loop

main:
    lea vector, %eax
    mov $0, %ecx

    jmp et_loop


nemonoton:
    // Printam ca sirul este nemonoton
    push $sirulnuemonoton
    call printf
    pop %edx

    mov $1, %eax
    mov $0, %ebx
    int $0x80

et_exit:
    // Printam ca sirul este monoton
    push $sirulemonoton
    call printf
    pop %edx

    mov $1, %eax
    mov $0, %ebx
    int $0x80

