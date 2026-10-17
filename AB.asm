.data
msg1: .asciiz "digite o valor de A inteiro: "
msg2: .asciiz "digite o valor de B inteiro: "
msg3: .asciiz "o valor de C sera: "

.text
.globl main

main:
	li   $v0, 4
	la   $a0, msg1
	syscall
	li   $v0, 5
	syscall
	move $t0, $v0          # t0 = A

	li   $v0, 4
	la   $a0, msg2
	syscall
	li   $v0, 5
	syscall
	move $t1, $v0          # t1 = B

	bne  $t0, $t1, else    # se A != B, vai para o else

	# IF: A == B -> soma
	add  $t2, $t0, $t1
	li   $v0, 4
	la   $a0, msg3
	syscall
	li   $v0, 1
	move $a0, $t2
	syscall
	j    fim

else:
	# ELSE: A != B -> multiplica
	mul  $t3, $t0, $t1
	li   $v0, 4
	la   $a0, msg3
	syscall
	li   $v0, 1
	move $a0, $t3
	syscall

fim:
	li   $v0, 10
	syscall
