.data
.text
.global main

main: 
    mov $3, %eax
    shl $2, %eax
    mov $2, %ebx
    mul %ebx
    mov $0, %edx
    mov $8, %ebx
    div %ebx
    sub %eax, %ebx
et_exit:
    mov $1, %eax