.data
    helloWord: .asciz "Hello, world!\n"
.text
.globl main

main:
    movl $4, %eax ;// Call WRITE Command
    movl $1, %ebx ;// File descriptor is STDOUT
    mov $helloWord, %ecx ;// Moves the string into the register holding a char pointer to the text
    movl $14, %edx ;// The length of the text
    int $0x80 ;// Syscall with previous arguments

    movl $1, %eax
    movl $0, %ebx
    int $0x80