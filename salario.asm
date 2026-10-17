.data
msg1:   .asciiz "Horas normais trabalhadas: "
msg2:   .asciiz "Horas extras trabalhadas: "
msg3:   .asciiz "Porcentagem de desconto: "
msg4:   .asciiz "Salario bruto: "
msg5:   .asciiz "\nSalario liquido: "

.text
.globl main

main:
	# le horas normais
	li   $v0, 4
	la   $a0, msg1
	syscall
	li   $v0, 5
	syscall
	move $t0, $v0          # t0 = horas normais

	# le horas extras
	li   $v0, 4
	la   $a0, msg2
	syscall
	li   $v0, 5
	syscall
	move $t1, $v0          # t1 = horas extras

	# le porcentagem de desconto
	li   $v0, 4
	la   $a0, msg3
	syscall
	li   $v0, 5
	syscall
	move $t2, $v0          # t2 = porcentagem

	# valores fixos
	li   $t3, 10           # valor da hora normal
	li   $t4, 15           # valor da hora extra
	li   $t5, 100          # divisor da porcentagem

	# salario bruto
	mul  $t6, $t0, $t3     # t6 = horas * 10
	mul  $t7, $t1, $t4     # t7 = extras * 15
	add  $s0, $t6, $t7     # s0 = bruto

	# desconto e liquido
	mul  $t8, $s0, $t2     # t8 = bruto * porcentagem
	div  $t9, $t8, $t5     # t9 = desconto
	sub  $s1, $s0, $t9     # s1 = liquido

	# imprime bruto
	li   $v0, 4
	la   $a0, msg4
	syscall
	li   $v0, 1
	move $a0, $s0
	syscall

	# imprime liquido
	li   $v0, 4
	la   $a0, msg5
	syscall
	li   $v0, 1
	move $a0, $s1
	syscall

	# encerra
	li   $v0, 10
	syscall
