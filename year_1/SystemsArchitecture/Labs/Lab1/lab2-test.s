# (Grade 10)
.data
    str1: .ascii "abc"
	str2: .ascii "123"

.text
.globl main
main:

    movl $0, %eax
    movb $4, %ah
    movb $2, %al
    int $0x80