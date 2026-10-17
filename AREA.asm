.data
msg1:   .asciiz "Largura do terreno: "
msg2:   .asciiz "Comprimento do terreno: "
msg3:   .asciiz "Area do terreno: "

.text
.globl main

main:
	# le a largura
	li   $v0, 4
	la   $a0, msg1
	syscall
	li   $v0, 5
	syscall
	move $t0, $v0          # t0 = largura

	# le o comprimento
	li   $v0, 4
	la   $a0, msg2
	syscall
	li   $v0, 5
	syscall
	move $t1, $v0          # t1 = comprimento

	# calcula a area
	mul  $t2, $t0, $t1     # t2 = largura * comprimento

	# imprime o resultado
	li   $v0, 4
	la   $a0, msg3
	syscall
	li   $v0, 1
	move $a0, $t2
	syscall

	# encerra
	li   $v0, 10
	syscall
