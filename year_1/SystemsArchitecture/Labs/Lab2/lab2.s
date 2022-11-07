.data
    x1: .long 1073741824 # 2^30
    x2: .long 268435456 # 2^28 -> 2^28 * 2^30 = 2^58

    sum: .long 4
    dif: .long 4
    multire: .long 4
    divizare: .long 4
.text

.globl main

main:
    mov $2, %edx # 2^33
    mov $0, %eax
    mov $16, %ecx # 2^4 -> 2^19
    idiv %ecx

    mov $0, %ecx
    mov $16, %eax
    jmp untilthegrave

untilthegrave:
    dec %eax
    loop untilthegrave

etexit:
    mov $0x0, %eax
    mov $0x1, %ebx
    int $0x80 