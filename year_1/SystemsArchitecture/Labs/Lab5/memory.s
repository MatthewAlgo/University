.data
    dest: .asciz "Dandalendandalendalendandenadlendalean"
    src: .asciz "Google"
    x: .long 6 # bytes de copiat din src in dest
    zero: .long -1

    formatprint: .asciz "%s\n"
    testprint: .asciz "Value is %c\n"
    testlocation: .asciz "Here\n"
    formatscanflong: .asciz "%d"
    formatscanfstring: .asciz "%s"

.text

memcpy:
    pushl %ebp
    mov %esp, %ebp

    movl 8(%ebp), %eax # Destination
    movl 12(%ebp), %ebx # Source
    movl 16(%ebp), %ecx # X

    jmp et_loop

    pop %ebp
    ret

et_loop:
    dec %ecx
    cmp %ecx, zero
    je program_return

    movb (%ebx, %ecx, 1), %dl
    movb %dl, (%eax, %ecx, 1)
    jmp et_loop

program_return:
    pop %ebp
    ret

.globl main
main:
    pushl x
    pushl $src
    pushl $dest
    call memcpy
    popl %edi
    popl %eax
    popl %eax

    pushl %edi
    pushl $formatprint
    call printf
    popl %eax
    popl %eax

    mov $1, %eax
    mov $0, %ebx
    int $0x80


