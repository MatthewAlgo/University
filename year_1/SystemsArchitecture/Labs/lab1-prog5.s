.data
    var1: .long 16
    var2: .long 32
    var3: .long 64
    var4: .long -64
.text
.globl main


main: 
    mov var1, %eax
    shl $1, %eax ;// eax logically shifted left
    shr $2, %eax ;// eax logically shifted right 2 positions

    mov var4, %ebx
    sar $1, %ebx
    shr $1, %ebx
    sal $1, %ebx

    movl $1, %eax
    movl $0, %ebx
    int $0x80