#Mapa de Registos
#p:	$t0
#*p:	$t1
#lista:	$t2

	.data
	.eqv	print_string,4
	.eqv	print_int10,1
	.eqv	SIZE,10
	.align	2
lista:	.word	8,-4,3,5,124,-15,87,9,27,15
str: 	.asciiz	"\nConteudo do array\n"
str1:	.asciiz ";"
	.text
	.globl 	main
	
main:
	la	$a0,str
	li	$v0,4
	syscall
	la	$t0,lista
	sll	$t2,$t2,2
	addu	$t2,$t2,$t0
while:
	bgeu	$t0,$t2,endw				# ou ver foto no telemovel (22/10/2024)
	lw	$t1,0($t0)			
	move	$a0,$t1
	li	$v0,1
	syscall
	la	$a0,str1
	li	$v0,4
	syscall
	addiu	$t0,$t0,1
	j	while
endw:
	jr	$ra