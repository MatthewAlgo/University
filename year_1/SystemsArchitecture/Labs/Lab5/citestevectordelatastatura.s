.data
    vector: .space 400 # Space for 100 elements
    n: .long 0
    numar_citit: .long 0
    contor: .long 0

    formatcitire: .asciz "%d"
    formatprintare: .asciz "%d\n"
.text

read_vector:
    push %ebp
    mov %esp, %ebp

    // Here we read the current index in the vector
    jmp main_loop

    pop %ebp
    ret

main_loop:
    movl contor, %ecx
    cmp 12(%ebp), %ecx
    je et_exit

    // Citim un numar, apoi il punem in array la ecx
    push $numar_citit
    push $formatcitire
    call scanf
    pop %edx
    pop %edx
    
    movl 8(%ebp), %eax
    mov contor, %ecx
    mov numar_citit, %edx
    movl %edx, (%eax, %ecx, 4) # Il punem in array

    inc %ecx
    mov %ecx, contor
    jmp main_loop

et_exit:
    mov $0, %ecx # Resetam contorul
    mov %ecx, contor

    pushl 12(%ebp) # N
    pushl 8(%ebp) # Adresa vectorului
    call print_vector
    pop %edx
    pop %edx

et_exit_definitiv:
    mov $1, %eax
    mov $0, %ebx
    int $0x80


print_vector:
    push %ebp
    mov %esp, %ebp

    mov $0, %ecx
    jmp main_print_loop

    pop %ebp
    ret

main_print_loop:
    mov contor, %ecx
    cmp 12(%ebp), %ecx # N
    je et_exit_definitiv

    movl 8(%ebp), %eax # The address of the array
    movl (%eax, %ecx, 4), %edx # Trebuie sa printam %edx

    pushl %edx
    pushl $formatprintare
    call printf
    pop %edx
    pop %edx


    mov contor, %ecx
    inc %ecx
    mov %ecx, contor
    jmp main_print_loop

.globl main

main:

    # Sa zicem ca il citim si pe n de la tastatura
    pushl $n
    pushl $formatcitire
    call scanf
    pop %edx
    pop %edx

    pushl n
    pushl $vector
    call read_vector
    pop %edx  
    pop %edx

