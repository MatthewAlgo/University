.data
    # Haide acum sa operam pe arrayuri in x86
    x: .space 400 # 400 de bytes alocati
    counter: .long 0
    n: .long 64
    currentvalueread: .long 0
    # Si sa zicem ca vrem sa facem un array din el
.text
.globl main

main:
    lea x, %edi
    jmp loadvaluesloop

loadvaluesloop:
    lea x, %edi
    mov counter, %ecx
    mov n, %ebx
    cmp %ecx, %ebx
    je prepareloop

    mov %ecx, (%edi, %ecx, 4)
    add $1, %ecx
    mov %ecx, counter
    jmp loadvaluesloop


prepareloop:
    lea x, %edi # Our start value
    mov $0, %ecx
    mov %ecx, counter # We reset the counter
    jmp looparray

looparray:
    mov counter, %ecx # We update the counter
    
    # We check if the counter value is equal to n
    mov n, %ebx
    cmp %ecx, %ebx
    je etexit

    # If it is ok, we move the contents of the memory address in edx (We 'read')
    movl (%edi, %ecx, 4), %edx

    # We increase the counter
    add $1, %ecx
    mov %ecx, counter
    jmp looparray

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80



