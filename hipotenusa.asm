.data
msg1: .asciiz "Cateto 1: "
msg2: .asciiz "Cateto 2: "
msg3: .asciiz "Hipotenusa: "

.text
.globl main

main:
	# le o cateto 1
	li   $v0, 4
	la   $a0, msg1
	syscall
	li   $v0, 5
	syscall
	move $t0, $v0          # t0 = cateto 1

	# le o cateto 2
	li   $v0, 4
	la   $a0, msg2
	syscall
	li   $v0, 5
	syscall
	move $t1, $v0          # t1 = cateto 2

	# a^2 + b^2
	mul  $t2, $t0, $t0     # t2 = cateto1^2
	mul  $t3, $t1, $t1     # t3 = cateto2^2
	add  $t4, $t2, $t3     # t4 = soma dos quadrados

	# raiz quadrada (float)
	mtc1    $t4, $f0       # copia t4 para f0
	cvt.s.w $f0, $f0       # converte inteiro -> float
	sqrt.s  $f12, $f0      # f12 = hipotenusa

	# imprime o resultado
	li   $v0, 4
	la   $a0, msg3
	syscall
	li   $v0, 2            # imprimir float (valor em f12)
	syscall

	# encerra
	li   $v0, 10
	syscall
	
