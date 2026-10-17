.data
msg1:   .asciiz "Digite a quantidade de camisas pequenas: "
msg2:   .asciiz "Digite a quantidade de camisas medias: "
msg3:   .asciiz "Digite a quantidade de camisas grandes: "
msg4:   .asciiz "Valor arrecadado: "

.text
.globl main

main:
	# le pequenas
	li   $v0, 4
	la   $a0, msg1
	syscall
	li   $v0, 5
	syscall
	move $t0, $v0          # t0 = pequenas

	# le medias
	li   $v0, 4
	la   $a0, msg2
	syscall
	li   $v0, 5
	syscall
	move $t1, $v0          # t1 = medias

	# le grandes
	li   $v0, 4
	la   $a0, msg3
	syscall
	li   $v0, 5
	syscall
	move $t2, $v0          # t2 = grandes

	# precos fixos
	li   $t3, 10           # preco da pequena
	li   $t4, 12           # preco da media
	li   $t5, 15           # preco da grande

	# quantidade * preco
	mul  $t6, $t0, $t3     # t6 = pequenas * 10
	mul  $t7, $t1, $t4     # t7 = medias * 12
	mul  $t8, $t2, $t5     # t8 = grandes * 15

	# soma tudo
	add  $t9, $t6, $t7
	add  $t9, $t9, $t8     # t9 = total

	# imprime o resultado
	li   $v0, 4
	la   $a0, msg4
	syscall
	li   $v0, 1
	move $a0, $t9
	syscall

	# encerra
	li   $v0, 10
	syscall
