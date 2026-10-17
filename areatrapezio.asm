.data
msg1: .asciiz "Base maior: "
msg2: .asciiz "Base menor: "
msg3: .asciiz "Altura: "
msg4: .asciiz "Area do trapezio: "

.text
.globl main

main:
	# le a base maior
	li   $v0, 4
	la   $a0, msg1
	syscall
	li   $v0, 5
	syscall
	move $t0, $v0          # t0 = base maior

	# le a base menor
	li   $v0, 4
	la   $a0, msg2
	syscall
	li   $v0, 5
	syscall
	move $t1, $v0          # t1 = base menor

	# le a altura
	li   $v0, 4
	la   $a0, msg3
	syscall
	li   $v0, 5
	syscall
	move $t2, $v0          # t2 = altura

	# calcula (base maior + base menor) * altura / 2
	li   $t5, 2
	add  $t3, $t0, $t1     # t3 = soma das bases
	mul  $t4, $t3, $t2     # t4 = soma * altura
	div  $t6, $t4, $t5     # t6 = area

	# imprime o resultado
	li   $v0, 4
	la   $a0, msg4
	syscall
	li   $v0, 1
	move $a0, $t6
	syscall

	# encerra
	li   $v0, 10
	syscall
