#Mapa de Registos
#i:	  $t0
#lista:	  $t1
#lista+i: $t2

	.data
	.eqv	SIZE,5
	.eqv	print_string,4
	.eqv	read_int,5
	.align	2
lista:	.space	20
str:	.asciiz	"\nIntroduza um numero: "
	.text
	.globl	main
	
main:							#   void main(void){
	li	$t0,0					#	i = 0;
while:
	bge	$t0,5,endw				#	if( i >= 5) then endw;
	la	$a0,str
	li	$v0,4
	syscall
	li	$v0,5
	syscall
	la	$t1,lista				#		$t1 = lista ou (&lista[0])
	sll	$t2,$t0,2				# 		(vai multiplicar por 4)
	addu	$t2,$t2,$t1				#		$t2 = &lista[i]
	sw	$v0,0($t2)				#		lista[i] = read_int();
	addi	$t0,$t0,1				#	i++
	j	while	
endw:
	jr	$ra
		