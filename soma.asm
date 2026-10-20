.data
msg1:  .asciiz "Digite um numero: "
msg2:  .asciiz "Resultado: "

.text
.globl main
main:
    # pede o número
    li   $v0, 4
    la   $a0, msg1
    syscall

    # lê o número
    li   $v0, 5
    syscall
    move $t0, $v0          # $t0 = número digitado

    # resto da divisão por 2
    li   $t1, 2
    div  $t0, $t1
    mfhi $t2               # $t2 = resto

    beq  $t2, $zero, par   # resto 0 -> par

impar:
    addi $t3, $t0, 8       # ímpar: soma 8
    j    imprime

par:
    addi $t3, $t0, 5       # par: soma 5

imprime:
    li   $v0, 4
    la   $a0, msg2
    syscall

    move $a0, $t3          # resultado em $a0
    li   $v0, 1
    syscall

    # encerra
    li   $v0, 10
    syscall
