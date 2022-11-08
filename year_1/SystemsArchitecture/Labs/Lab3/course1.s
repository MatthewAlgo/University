.data
    v: .long 1, 2, 3, 4, 5
    n: .long 5
    s: .long 0
.text
.globl main
main:
#   the sum of the numbers in the array
    mov $v, %esi
    mov $0, %ecx
et_loop:
    cmp n, %ecx
    je et_exit
    # mov (%esi, %ecx, 4), %eax    
    
    mov 0(%esi), %eax # accesam v[0]
    add %eax, s
    inc %ecx
    add $4, %esi

    jmp et_loop
et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80