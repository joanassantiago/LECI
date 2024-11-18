#Mapa de resgistos
#len: 	$t1

	.data
	.eqv	print_int10,1
str1:	.asciiz	"Arquitetura de Computadores I"
	.text
	.globl	main
	
	
main:						#   int main(void){
	addiu	$sp,$sp,-4			#	prólogo	
	sw	$ra,0($sp)			#
	la	$a0,str1
	jal	strlen
	move	$a0,$v0
	li	$v0,1
	syscall
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	li	$v0,0				#   	return 0;
	jr	$ra				#   }
strlen:						#   int strlen(char *s){
	li 	$t1,0				#	len = 0;
while:						#	while (1){
	lb	$t0,0($a0)			#	   char tmp = *s;
	addiu	$a0,$a0,1			#	   s++;	metemos um 1 porque é um char, se fosse um inteiro seria 4 	   
	beq	$t0,'0',endw			#	   if(tmp == '\0') break;
	addi	$t1,$t1,1			#	   len++;
	j	while				#	}
endw:
	move	$v0,$t1				# 	
	jr	$ra