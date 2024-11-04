#Mapa de registo
#p:	  $to
#pultimo: $t1
#*p:	  $t2
#soma:	  $t3

	.data
	.eqv	SIZE,4
	.eqv 	print_int10,1
array:	.word	7692, 23, 5, 234
	.text
	.globl main
	
main:						#   int main(void){
	li	$t3,0				#	int soma = 0:
	li 	$t4,SIZE			#	$t4 = SIZE
	addi	$t4,$t4,-1			#	$t4 = SIZE-1 (3)
	mul	$t4,$t4,4			#	$t4 = (SIZE-1)*4
	la	$t0,array			#	p = array;
	addu	$t1,$t0,$t4			#	pultimo = array + (SIZE-1) * 4
while:
	bgt	$t0,$t1,endw			#	if(p > pultimo) then endw;
	lw	$t2,0($t0)			
	add	$t3,$t3,$t2			#		soma = soma + (*p);
	addiu	$t0,$t0,SIZE			#		p++;
	j	while
endw:	
	li	$v0,print_int10
	move	$a0,$t3
	syscall
	jr	$ra
	
	