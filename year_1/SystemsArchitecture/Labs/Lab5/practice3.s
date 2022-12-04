.data
    format: .asciz "Numarul de afisat este %d\n"
    format2: .asciz "Suma numerelor %d si %d este %d\n"
    format3: .asciz "Numele studentului cu cea mai mare medie este %s\n"
    x: .long 100

.text
.globl main

main: 
    pushl x
    pushl $format

    call printf

    popl %ebx
    popl %ebx

    pushl $0
    call fflush
    popl %ebx

    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80