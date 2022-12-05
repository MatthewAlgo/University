.data

    vector: .long 1, 1, 1, 1, 1, 1, 1, 1, 1
    length: .long 9
    prev: .long 0
    curent: .long 0

    zero: .long 0

    nusuntegalestr: .asciz "Numere distincte 2 cate 2\n"
    suntegalestr: .asciz "Numere la fel 2 cate 2\n"

.text

.globl main

main:

    lea vector, %eax
    mov $0, %ecx
    jmp compute


compute:
    mov length, %edx
    cmp %ecx, %edx
    je et_exit_ok


    # Daca suntem la prima pozitie, initalizam prev
    cmp %ecx, zero
    je init_prev

    # Altfel, comparam prev cu curent
    movl (%eax, %ecx, 4), %ebx
    mov %ebx, curent

    mov curent, %ebx
    mov prev, %edx
    cmp %ebx, %edx
    jne nu_sunt_egale

    inc %ecx
    jmp compute


init_prev:
    movl (%eax, %ecx, 1), %ebx
    mov %ebx, prev
    inc %ecx
    jmp compute


nu_sunt_egale:
    pushl $nusuntegalestr
    call printf
    pop %edx

    mov $1, %eax
    mov $0, %ebx
    int $0x80

et_exit_ok:
    pushl $suntegalestr
    call printf
    pop %edx

    mov $1, %eax
    mov $0, %ebx
    int $0x80