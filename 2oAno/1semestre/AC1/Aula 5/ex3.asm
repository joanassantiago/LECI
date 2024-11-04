#Mapa de registos
# ..
# houve_troca: $t4
# i: $t5
# lista: $t6
# lista + i: $t7 

	.data
	.eqv 	SIZE,10
	.eqv	TRUE,1
	.eqv	FALSE,0
	.eqv	print_string,4
	.eqv	print_int10,1
str1:	.asciiz	";"
str2:	.asciiz	"\nConteudo ordenado do array:\n"
lista:	.word	8,-4,3,5,124,-15,87,9,27,15
	.text
	.globl 	main
	
main:
do:		
	li	$t1,FALSE			#   houveToca = FALSE;
	li	$t0,0				#   i = 0;
for:						#   while (i < 9){
	bge	$t0,9,endif
	la	$t4,lista
	sll	$t5,$t0,2
	addu	$t5,$t4,$t5			#  	int *p = &(lista[i]);
	lw	$t2,0($t5)			#	aux = lista[i]; 
	lw	$t3,4($t5)			#	aux1 = lista[i+1];
if:
	ble	$t2,$t3,endif			#   	if (aux > aux1){
	sw	$t2,4($t5)			#	   lista[i+1] = aux;
	sw	$t3,0($t5)			#	   lista[i] = aux1;
	li	$t1,TRUE			#	   houveTroca = TRUE;
endif:						#	}
	addi	$t0,$t0,1				#	i++
	j 	for				#   }
endfor:	
	beq	$t1,TRUE,do			#}while(houveTroca == TRUE);
	la	$a0,str2
	li	$v0,4
	syscall
print:	
	bge	$t0,10,endp
	
	