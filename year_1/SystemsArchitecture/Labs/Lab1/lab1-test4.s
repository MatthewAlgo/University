.data
    x: .long 20, 30, 10, 40, 50
    travel: .long 2, 5, 3
    sumdistances: .long 0
    travellength: .long 3
    currentposition: .long 0
    currentcounter: .long 0

.text

.globl main

main:
    lea x, %eax
    lea travel, %ebx

    # eax points to distances array
    # ebx points to travel array

    mov $0, %ecx
    mov $0, currentcounter
    jmp loopthroughdays
loopthroughdays:
    mov currentcounter, %ecx
    cmp travellength, %ecx
    je etexit
    mov %ecx, currentcounter

    movl (%ebx, %ecx, 4), %edx
    # %edx contine valoarea de la ziua %ecx

    cmp %edx, currentposition # Where we need to move
    jl currentissmallerthanedx
    cmp %edx, currentposition # Where we need to move
    jg positiongreaterthanedx
    
    mov currentcounter, %ecx
    add $1, %ecx
    mov %ecx, currentcounter
    jmp loopthroughdays

currentissmallerthanedx:
    mov currentposition, %ecx # Where we are now
    
    cmp %ecx, %edx # We compare the two values (if we arrived to our destination today)
    je prepareforloopagain # If they are equal, We return to the main loop portion
    # Else we add the second value

    # We need to find a way to increment the distance

    mov sumdistances, %ebx
    add (%eax, %ecx, 4), %ebx # We access the second array and add the value
    mov %ebx, sumdistances
    lea travel, %ebx # We convert back to memory address


    add $1, %ecx
    mov %ecx, currentposition
    jmp currentissmallerthanedx

positiongreaterthanedx:
    mov currentposition, %ecx # Where we are now
    
    cmp %ecx, %edx # We compare the two values (if we arrived to our destination today)
    je prepareforloopagain # If they are equal, We return to the main loop portion
    # Else we add the second value

    # We need to find a way to increment the distance

    mov sumdistances, %ebx
    add (%eax, %ecx, 4), %ebx # We access the second array and add the value
    mov %ebx, sumdistances
    lea travel, %ebx # We convert back to memory address


    sub $1, %ecx
    mov %ecx, currentposition
    jmp positiongreaterthanedx

prepareforloopagain:
    mov currentcounter, %ecx
    inc %ecx
    mov %ecx, currentcounter
    jmp loopthroughdays

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
