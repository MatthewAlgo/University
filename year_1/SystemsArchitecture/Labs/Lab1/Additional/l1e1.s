# TODO
.data
    finalval: .long 0
    powercounter: .long 1
    current_power_count: .long 1
    untilwecount: .long 5
    whatwedivide: .long 1
.text

.globl main

main: 
    mov $1, %eax
    jmp loopbody

loopbody: 
    jmp build_ecx_to_power

build_ecx_to_power:
    mov current_power_count, %ecx
    mov powercounter, %edx
    cmp %ecx, %edx
    je add_value

    movl $0, %edx
    imul %eax
    inc %ecx

    
    