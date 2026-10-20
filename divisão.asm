.data
msg1: .asciiz "Primeiro numero: "
msg2: .asciiz "Segundo numero (diferente de 0): "
res:  .asciiz "Divisao: "

.text
main:
    li   $v0, 4
    la   $a0, msg1
    syscall
    li   $v0, 5
    syscall
    move $t0, $v0

pede:
    li   $v0, 4
    la   $a0, msg2
    syscall
    li   $v0, 5
    syscall
    move $t1, $v0
    beqz $t1, pede         # repete enquanto for 0

    div  $t0, $t1
    mflo $t2               # quociente

    li   $v0, 4
    la   $a0, res
    syscall
    li   $v0, 1
    move $a0, $t2
    syscall
    li   $v0, 10
    syscall
