# Binary Search
.data
    v: .long  1, 4, 12, 45, 67, 98, 647, 4563, 74563
    elementwesearchfor: .long 1
    leftpointer: .long 0
    rightpointer: .long 9
    middleel: .space 4
    middleaddress: .space 4
    middleindex: .space 4
.text

.globl main

main:
    jmp processarray

processarray:
    mov $0, %eax
    mov %eax, middleel
    mov rightpointer, %ebx
    add %ebx, %eax
    mov leftpointer, %ebx
    add %ebx, %eax
    mov %eax, middleel

    # If the right pointer is less than the left pointer, the element has not been found
    mov rightpointer, %edx
    mov leftpointer, %eax
    cmp %eax, %edx
    jl elementnotfound

    mov $0, %edx
    mov middleel, %eax
    mov $2, %ebx
    idiv %ebx
    mov %eax, middleel # We have the middle element in here
    mov %eax, middleindex

    # Now we compare the element at index middleel with the element we search for (Load the address)
    lea v, %eax
    mov $4, %ebx
    mov middleel, %ecx
    mov (%eax, %ecx, 4), %edx
    mov %edx, middleaddress

    # Compare the elements with one another
    mov middleaddress, %ebx
    mov elementwesearchfor, %eax
    cmp %eax, %ebx
    jz elementfound
    
    # Else if the element at middle is smaller
    cmp %eax, %ebx
    jl middleisless

    cmp %eax, %ebx
    jg middleisgreater



middleisgreater:
    # We search in the left array
    mov middleindex, %eax
    dec %eax
    mov %eax, rightpointer
    # Modify the right pointer and jump back to the loop
    jmp processarray

middleisless:
    # We search in the right array
    mov middleindex, %eax
    inc %eax
    mov %eax, leftpointer
    jmp processarray

elementfound:
    mov elementwesearchfor, %eax
    mov $1, %eax
    mov $0, %ebx
    int $0x80

elementnotfound:
    mov elementwesearchfor, %eax
    mov $1, %eax
    mov $0, %ebx
    int $0x80

