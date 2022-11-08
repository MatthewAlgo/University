# char s[7] = "Hello\n"
# char t[7]

# long n = 7
# for (long i = 0; i < n; i++) {
    # t[i] = s[i]

# for (long i = n; i >= 1; i--) {
    # t[i - 1] = s[i-1]

.data
    # intai punem quad, word, long, string
    # se realizeaza o aliniere in memorie
    # s: .asciz  "ak"
    # n: .long 5
    # memoria arata asa: 50bk
    n: .long 7
    s: .asciz "Hello\n"
    # .align 4 # aliniaza la ceva multiplu de 4
    t: .space 7
    # intai punem tipurile de date mari, in ordine descrescatoare

.text
.globl main

main:   
    mov $t, %edi
    mov $s, %esi
    mov n, %ecx
et_loop:
    mov %ecx, %edx
    dec %edx
    # movb (%esi, %edx, 1), %eax
    mov (%esi, %edx, 1), %al
    mov %al, (%edi, %edx, 1)

    loop et_loop

    mov $4, %eax
    mov $1, %ebx
    mov $t, %ecx
    mov $7, %edx
    int $0x80

    mov $1, %eax