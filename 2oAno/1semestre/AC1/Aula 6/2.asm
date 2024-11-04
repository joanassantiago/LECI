#Mapa de registos
#p:	   $t0
#pultimo:  $t1

	.data
	.eqv 	SIZE,3
	.eqv	print_string,4
	.eqv	print_char,11
str1:	.asciiz	"Array"
str2:	.asciiz	"de"
str3:	.asciiz	"ponteiros"
array:	.word	str1,str2,str3
	.text
	.globl main
	
main:
	la	$t0,array
	li	$t3,SIZE
	sll	$t3,$t3,2
	addu	$t1,$t0,$t3
for:
	bge	$t0,$t1,endf
	lw	$a0,0($t0)
	li	$v0,4
	syscall
	li	$a0,'\n'
	li	$v0,11
	syscall
	addi	$t0,$t0,4
	j	for
endf:
	jr	$ra