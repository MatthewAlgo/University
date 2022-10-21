# Not completed yet
.data
    memory: .space 256
    character: .space 1
    str_len: .space 1
.text
.globl main

main:
    ;// Read command
    mov string, %ebx
    jmp reading

    ;// Exit command
    mov $1, %eax
    mov $0, %ebx
    int $0x80

reading:


    mov $3, %eax ;// Sys_read
    mov $0, %ebx ;// From stdin
    mov character, %ecx ;// Load the memory location pointer
    mov $1, %edx ;// Load the size
    int $0x80

    cmp %temp, $10
    je end_reading

    inc %str_len
    movl %al, temp
    movl %ebx, %al
    inc %ebx
    jmp reading


    ;// Print comman
end_reading: 
    mov $0, byte[ebx]

    mov $4, %eax
    mov $1, %ebx
    mov $memory, %ecx
    mov $12, %edx
    int $0x80