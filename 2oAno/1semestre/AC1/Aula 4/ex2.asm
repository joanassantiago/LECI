#Mapa de registos
#num:	$t0
#p: 	$t1
#*p:	$t2

	.data
	.eqv 	SIZE,20
	.eqv 	read_string,8
	.eqv	print_int10,1
str:	.space	21
	.text
	.globl 	main
	
main:							#   void main(void){
	la	$a0,str					
	li	$a1,SIZE
	li	$t0,0					#	int num = 0;
	li	$v0,read_string
	syscall						#	read_string(str,SIZE);
	la	$t1,str					#	p = str;
while:							#	while(*p != '\0')
	lb	$t2,0($t1)
	beq	$t2,'\0',endw				#	{((se t2 for igual a '\0' acaba o while))
	blt	$t2,48,endif				#	   if(*p < '0') then endif;
	bgt	$t2,57,endif				#	   if(*p > '9') then endif;
	addi	$t0,$t0,1				#		num++;
endif:
	addiu	$t1,$t1,1				#	   p++;
	j	while					#	}
endw:
	li	$v0,print_int10
	move	$a0,$t0
	syscall						#	print_int10(num);
	jr 	$ra					#   }
	
	
