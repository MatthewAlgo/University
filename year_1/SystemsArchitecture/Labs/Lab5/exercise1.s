.data
    numar: .space 4
    suma: .long 0
    doi: .long 2
    zero: .long 0
    unu: .long 1
    formatcitire: .asciz "%d"

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

.globl main

main:
    pushl $numar
    pushl $formatcitire
    call scanf
    popl %ebx
    popl %ebx

    pushl numar
    pushl $formatafisare
    call printf
    popl %ebx
    popl %ebx

    pushl $0
    call fflush
    popl %ebx

    pushl numar
    call perfect
    popl %ebx


    // Print ebx for debugging
    pushl %ebx
    pushl $ebxeste
    call printf
    popl %edx
    popl %edx
    


    cmp %ebx, unu
    je print_nr_este_perf
    jne print_nr_nu_este_perf

    mov $1, %eax
    xor %ebx, %ebx
    int $0x80

print_nr_este_perf:
    pushl $nreperf
    call printf
    popl %ebx

    mov $1, %eax
    xor %ebx, %ebx
    int $0x80

print_nr_nu_este_perf:
    pushl $nrnueperf
    call printf
    popl %ebx

    mov $1, %eax
    xor %ebx, %ebx
    int $0x80