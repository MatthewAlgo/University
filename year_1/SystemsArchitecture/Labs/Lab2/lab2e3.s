.data
    a: .long 5
    b: .long 3
    c: .long 10

    min: .space 4
.text

.globl main

main:
    mov a, %eax
    mov b, %ebx
    cmp %eax, %ebx
    jge bgreaterthana # b >= a
    jmp bsmallerthana # b < a

bgreaterthana:
    mov c, %ecx
    cmp %ebx, %ecx
    jge aisthesmallest # c >= b >= a

    cmp %eax, %ecx
    jge aisthesmallest # b >= c >= a

    jmp cisthesmallest # c <= a <= b

bsmallerthana:
    mov c, %ecx
    cmp %eax, %ecx
    jge bisthesmallest # c >= a > b

    # c?b < a
    cmp %ebx, %ecx
    jge bisthesmallest # b <= c < a

    jmp cisthesmallest # c < b < a
    
aisthesmallest:
    mov %eax, min
    jmp end

cisthesmallest:
    mov %ecx, min
    jmp end

bisthesmallest:
    mov %ebx, min
    jmp end

end:
    mov $0, %eax
    mov $1, %ebx
    int $0x80