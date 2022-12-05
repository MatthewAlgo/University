.data
    numar: .space 4
    suma: .long 0
    doi: .long 2
    zero: .long 0
    unu: .long 1
    formatcitire: .asciz "%d"

    n: .space 4
    vectordenumere: .space 100 
    // Se da un vector de n numere citit de la tastatura, sa se verifice daca numere sunt perfecte

    formatafisare: .asciz "Numar afisat: %d\n"
    formatafisaresuma: .asciz "Suma afisata: %d\n"

    nreperf: .asciz "Numarul este perfect\n"
    nrnueperf: .asciz "Numarul nu este perfect\n"

    ebxeste: .asciz "Ebx este %d\n"

.text

perfect:
    // Pe esp o sa fie adresa de intoarcere acum
    pushl %ebp
    // esp -> x, adresa de intoarcere, ebp
    movl %esp, %ebp
    /// De aici incepe functia propriu-zisa


    movl 8(%ebp), %eax
    // Numarul nostru x se afla in eax acum
    // Facem operatii pe ea
    push %eax
    push $ebxeste
    call printf
    popl %edx
    popl %edx

    
    mov $1, %ecx
    jmp et_loop

    popl %ebp
    ret

et_loop:
    // Numar in %eax
    // Contor in %ecx
    // Il comparam pe ecx cu numar / 2
    mov $0, %edx
    mov 8(%ebp), %eax
    idiv doi

    cmp %ecx, %eax
    je end_func

    // Vedem daca ecx divide eax
    mov $0, %edx
    mov 8(%ebp), %eax
    idiv %ecx

    cmp %edx, zero
    je adauga_la_suma
    
    inc %ecx
    jmp et_loop

adauga_la_suma:
    add %ecx, suma
    
    inc %ecx
    jmp et_loop

end_func:
    add %ecx, suma

    // Printam suma
    pushl suma
    pushl $formatafisaresuma
    call printf
    popl %ebx
    popl %ebx
    
    mov suma, %eax
    mov numar, %ebx

    cmp %eax, %ebx
    je numarul_este_perfect
    jne numarul_nu_este_perfect

    popl %ebp
    ret

numarul_este_perfect:
    movl $1, 8(%ebp)
    popl %ebp
    ret
numarul_nu_este_perfect:
    movl $0, 8(%ebp)
    popl %ebp
    ret


// Reading from keyboard procedure here
readandsolve: 
    push %ebp
    mov %esp, %ebp

    // We read number n vroom the keyboard
    push $n
    push $formatcitire
    call scanf
    popl %ebx
    popl %ebx
    
    // Pampananannananananannam panam
    // Now we read the vector in a loop
    mov n, %ecx
    jmp et_loop_vector_read_and_solve

    pop %ebp
    ret
    // Does not return anything

et_loop_vector_read_and_solve: 
    // We read n numbers from the keyboard
    // We can read in n as the counter now is remembered in ecx
    push $n
    push $formatcitire
    call scanf
    popl %ebx
    popl %ebx

    // Acum il avem pe n si putem sa apelam procedura pentru el
    mov n, %edx
    mov %edx, numar # Avem nevoie de numar in functie
    pushl n
    call perfect
    popl %ebx

    // Print the value of ebx for debugging
    push %ebx
    push $ebxeste
    call printf
    popl %edx
    popl %edx
    
    // Resetam suma
    mov $0, suma

    cmp %ebx, unu
    je print_nr_este_perf
    jne print_nr_nu_este_perf

.globl main

print_nr_este_perf:
    pushl $nreperf
    call printf
    popl %edx

    cmp %ecx, unu
    je et_exit
    dec %ecx
    jmp et_loop_vector_read_and_solve

print_nr_nu_este_perf:
    pushl $nrnueperf
    call printf
    popl %edx

    
    cmp %ecx, unu
    je et_exit
    dec %ecx
    jmp et_loop_vector_read_and_solve


main:
    call readandsolve

    mov $1, %eax
    xor %ebx, %ebx
    int $0x80

et_exit:
    pop %ebp
    ret

    mov $1, %eax
    xor %ebx, %ebx
    int $0x80