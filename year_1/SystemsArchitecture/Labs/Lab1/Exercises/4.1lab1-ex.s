.data
    memory: .space 12
    character: .space 1

.text
.globl main

main:
    ;// Read command
    mov $3, %eax ;// Sys_read
    mov $0, %ebx ;// From stdin
    mov character, %ecx ;// Load the memory location pointer
    mov $12, %edx ;// Load the size
    int $0x80

    ;// Print command
    mov $4, %eax
    mov $1, %ebx
    mov $memory, %ecx
    mov $12, %edx
    int $0x80

    ;// Exit command
    mov $1, %eax
    mov $0, %ebx
    int $0x80