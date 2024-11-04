#Mapa de Registos
#p:	$t0
#*p:	$t1

	.data
	.eqv	SIZE,20
	.eqv	print_string,4
	.eqv	read_string,8
str1: 	.asciiz "Introduza uma string: "
str: 	.space 	21
	.text
	.globl main
	
main:							#  int main(void){
	la	$a0,str1				
	li	$v0,print_string
	syscall						#	print_string(str1);
	la	$a0,str
	li	$a1,SIZE
	li	$v0,read_string
	syscall						#	read_string(str,SIZE)
	la	$t0,str					#	p = str;
while:
	lb	$t1,0($t0)				#	*p;
	beq	$t1,'\0',endw				#	if(*p = '\0') then endw;
	sub	$t1,$t1,0x61
	add	$t1,$t1,0x41
	addiu	$t1,$t1,1
	j	while
endw:
	li	$v0,print_string
	move	$a0,str
	syscall
	jr	$ra