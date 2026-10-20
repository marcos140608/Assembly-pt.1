.data
msg:  .asciiz "Altura em cm: "
rmin: .asciiz "Menor altura: "
rmax: .asciiz "\nMaior altura: "

.text
main:
    li   $t0, 0            # contador
    li   $t1, 9999         # menor (comeca alto)
    li   $t2, 0            # maior (comeca baixo)

loop:
    beq  $t0, 15, fim
    li   $v0, 4
    la   $a0, msg
    syscall
    li   $v0, 5
    syscall
    move $t3, $v0

    bge  $t3, $t1, naoMin  # se altura >= menor, nao atualiza
    move $t1, $t3
naoMin:
    ble  $t3, $t2, naoMax  # se altura <= maior, nao atualiza
    move $t2, $t3
naoMax:
    addi $t0, $t0, 1
    j    loop

fim:
    li   $v0, 4
    la   $a0, rmin
    syscall
    li   $v0, 1
    move $a0, $t1
    syscall
    li   $v0, 4
    la   $a0, rmax
    syscall
    li   $v0, 1
    move $a0, $t2
    syscall
    li   $v0, 10
    syscall
