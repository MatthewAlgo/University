.data
    x: .long 2
    y: .long 3
    s: .space 4
.text

add: 
    pushl %ebp 
    movl %esp, %ebp

    movl 4(%esp), %eax # Stack pointer + 4
    addl 8(%esp), %eax # Stack pointer + 8
    movl 12(%esp), %ebx # Mutam esp+12 in ebx (suma in ebx)
    movl %eax, 0(%ebx) # Mutam in S suma

    popl %ebp
    ret # Practic popeaza ultima adresa adaugata pe stiva (cea de intoarcere)

.globl main
main:
    pushl $s
    pushl y
    pushl x
    call add
    popl %edx # Popam valori pana aducem stiva la valoarea initiala
    popl %edx # Popam valori pana aducem stiva la valoarea initiala
    popl %edx # Popam valori pana aducem stiva la valoarea initiala

    mov $1, %eax
    xor %ebx, %ebx
    int $0x80