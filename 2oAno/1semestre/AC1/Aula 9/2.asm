# Mapa de registos
# ft : $f12
# retorno : $f0
	
	.data
	.eqv	read_double,7
	.eqv	print_double,3
fk1:	.double	5.0
fk2:	.double	9.0
fk3:	.double	32.0
	.text
	.globl	main
	
main:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	li	$v0,7
	syscall
	mov.d	$f12,$f0
	jal	f2c
	mov.d 	$f12,$f0
	li	$v0,3
	syscall
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
	
f2c:
	la	$t0,fk3
	l.d	$f0,0($t0)
	la	$t0,fk2
	l.d	$f2,0($t0)
	la	$t0,fk1
	l.d	$f4,0($t0)
	
	sub.d	$f0,$f12,$f0
	mul.d	$f0,$f0,$f4
	div.d	$f0,$f0,$f2
	
	jr	$ra
