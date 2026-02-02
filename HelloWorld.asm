.data
    hello_msg: .asciiz "Hello, World!\n"

.text
.globl main

main:
    # Carica l'indirizzo della stringa in $a0
    la $a0, hello_msg
    # Imposta il codice syscall per la stampa di stringa (print_string)
    li $v0, 4
    # Esegue la syscall
    syscall

    # Imposta il codice syscall per terminare il programma (exit)
    li $v0, 10
    # Esegue la syscall
    syscall
