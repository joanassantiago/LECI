#Mapa de registos
#i:	$t0

	.data
	.eqv	print_string,4
	.eqv	print_char,11
	.eqv	SIZE,3
str1:	.asciiz	"Array"
str2:	.asciiz	"de"
str3:	.asciiz	"ponteiros"
array:	.word	str1,str2,str3
	.text
	.globl main
	
main:						#   void main(void)
	li	$t0,0				#   	i = 0;
for:
	bge	$t0,SIZE,endf			#	if(i >= SIZE) then endf;
	la 	$t1,array			#		$t1 = &array[0];
	sll	$t2,$t0,2			#		offset = i*4;
	addu	$t2,$t2,$t1			#		int **p = &array[i]
	lw	$a0,0($t2)			#		int *parray = array[i]
	li	$v0,4				
	syscall
	li	$a0,'\n'			# 		$a0 = n;
	li	$v0,11
	syscall
	addi	$t0,$t0,1
	j	for
endf:
	jr	$ra