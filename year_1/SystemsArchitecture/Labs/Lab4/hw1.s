.data

stre: .asciz "This string"
reve: .space 12 # 12 including the string terminator
arraylen: .long 12
indexinfirststring: .long 0

.text

.globl main

main: 

    lea stre, %edi
    mov arraylen, %ecx
    sub $2, %ecx # Now points to the last letter
    jmp mainloop

mainloop:
    lea stre, %edi
    movb (%edi, %ecx, 1), %dl
    mov indexinfirststring, %ebx
    lea reve, %eax 
    movb %dl, (%eax, %ebx, 1)
    inc %ebx
    mov %ebx, indexinfirststring
    
    dec %ecx
    mov $-1, %edx
    cmp %ecx, %edx
    je etexit
    
    jmp mainloop
    
etexit:

    # Add the string terminator to the end of the last string
    mov arraylen, %eax
    dec %eax
    lea reve, %edi
    mov $0, %bl
    movb %bl, (%edi, %eax, 1)  

    mov $4, %eax
    mov $1, %ebx
    mov $reve, %ecx
    mov $12, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80



