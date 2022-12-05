// Function that implements atoi

.data
    string: .asciz "19802354"
    numar: .long 0
    putere: .long 1

    character: .byte 0

    nullul: .long 0
    zero: .long 48
    noua: .long 57

    strisanumber: .asciz "The string is a number\n"
    strisnotanumber: .asciz "The string is not a number\n"

.text

atoi:
    push %ebp
    mov %esp, %ebp

    // We get each character from the string, if the character is 
    // \0, we end the string, else we read in continuation
    mov $0, %ecx
    jmp main_loop 

    pop %ebp
    ret

main_loop:
    // We read each character from the string and determine if it is between an ascii range
    // Every char is a byte long so interpret each byte in the string
    // The current index is ecx

    // There we have stored the address of the string
    mov 8(%ebp), %edi 
    // We reset the edx register
    mov $0, %edx 

    movb (%edi, %ecx, 1), %dl
    movb %dl, character
    // We compare the character with the range 
    cmp nullul, %dl 
    je et_exit
    
    cmp zero, %dl # Character 0
    jl not_a_digit
    cmp noua, %dl # Character 9
    jg not_a_digit

    // Here we move from a character to a digit
    // Numar = numar * putere + char

    inc %ecx
    jmp main_loop

.globl main

main:
    pushl $string
    call atoi
    popl %edx

et_exit:
    // Print that the string is a number
    pushl $strisanumber
    call printf
    popl %edx

    mov $1, %eax
    xor %ebx, %ebx
    int $0x80

not_a_digit:
    // Print that the string is not a number
    pushl $strisnotanumber
    call printf
    popl %edx

    mov $1, %eax
    xor %ebx, %ebx
    int $0x80




