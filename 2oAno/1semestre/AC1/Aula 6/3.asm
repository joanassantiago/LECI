#Mapa de registos
#i:	       $t0
#j:	       $t1
#array[i][j]:  $t3

	.data
	.eqv	SIZE,3
	.eqv	print_string,4
	.eqv	print_char,11
	.eqv	print_int10,1
str1:	.asciiz	"Array"
str2:	.asciiz	"de"
str3:	.asciiz	"ponteiros"
str4:	.asciiz	"\nString #"
str5:	.asciiz ": "
array:	.word	str1,str2,str3
	.text
	.globl 	main

main:
	li	$t0,0
for:
	bge	$t0,SIZE,endf
	la 	$a0,str4
	li	$v0,4
	syscall
	move	$a0,$t0
	li	$v0,1
	syscall
	la	$a0,str5
	li	$v0,4
	syscall
	li	$t1,0
while:
	la	$t3,array
	sll	$t2,$t0,2
	addu	$t3,$t3,$t2
	lw	$t3,0($t3)
	addu	$t3,$t3,$t1
	lb	$t3,0($t3)
	beq	$t3,'\0',endw
	move	$a0,$t3
	li	$v0,11
	syscall
	li	$a0,'-'
	li	$v0,11
	syscall
	addiu	$t1,$t1,1
	j	while
endw:
	addiu	$t0,$t0,1
	j	for
endf:
	jr	$ra
	
