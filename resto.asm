.data
msg1: .asciiz "Primeiro numero: "
msg2: .asciiz "Segundo numero: "
res:  .asciiz "Resto: "

.text
main:
    li   $v0, 4
    la   $a0, msg1
    syscall
    li   $v0, 5
    syscall
    move $t0, $v0

    li   $v0, 4
    la   $a0, msg2
    syscall
    li   $v0, 5
    syscall
    move $t1, $v0

    bge  $t0, $t1, calcula # verifica no inicio: $t0 deve ser o maior
    move $t2, $t0          # senao, troca
    move $t0, $t1
    move $t1, $t2

calcula:
    div  $t0, $t1
    mflo $t2               # quociente
    mul  $t2, $t2, $t1     # quociente * menor
    sub  $t3, $t0, $t2     # maior - (quociente * menor)

    li   $v0, 4
    la   $a0, res
    syscall
    li   $v0, 1
    move $a0, $t3
    syscall
    li   $v0, 10
    syscall
