	.data
str1:	.asciiz "Introduza um número: "
str2:	.asciiz "\nO valor em binário e': "
	.text
	.globl main

main:		
	la 	$a0,str1	
	li 	$v0,4					#ver tabela simplificada
	syscall	
	move 	$t1,$v0	
	la 	$a0,str2
	li	$v0,4
	syscall
	li	$t0,0
for:
	bge	$t2,32,endw
	
	
endif:						#	}
	addi 	$t2,$t2,1			# i++
	j 	while
