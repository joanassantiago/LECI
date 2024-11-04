#Mapa de Registos
#i:	    $t0
#v:	    $t1
#&(val[0]): $t2

	.data
	.eqv	print_string,4
	.eqv	print_int10,1
	.eqv	print_char,11
	.eqv	SIZE,8
val:	.word	8,4,15,-1987,327,-9,27,16
str1:	.asciiz	"Result is: "
str2:	.asciiz ","
	.text
	.globl main
	
main:
	la	$t2,val
	li	$t0,0
do:	
	sll	$t3,$t0,2			#Cada elemento do array val é um inteiro, e em MIPS, um inteiro ocupa 4 bytes. O deslocamento de 2 bits multiplica $t0 por 4 (equivalente a multiplicar por o tamanho de cada elemento).
	addu	$t3,$t3,$t2
	lw	$t1,0($t3)			#v = val[i]
	
	li	$t4,SIZE
	srl	$t4,$t4,1			#Divide SIZE por 2
	addu	$t4,$t4,$t0
	sll	$t4,$t4,2
	addu	$t4,$t4,$t2
	lw	$t5,0($t4)
	sw	$t5,0($t3)			#val[i] = val[i+SIZE/2]
	
	sw	$t1,0($t4)			#val[i+SIZE/2] = v
	
	li 	$t6,SIZE
	srl	$t6,$t6,1
	addiu	$t0,$t0,1
	bge	$t0,$t6,enddo
	j	do
enddo:
	li	$v0,4
	la	$a0,str1
	syscall
	li 	$t0,0
do1:
	sll	$t1,$t0,2
	addiu	$t0,$t0,1			#i++
	addu	$t3,$t1,$t2			#&val[i++]
	lw	$a0,0($t3)
	li	$v0,1
	syscall
	
	li	$v0,11
	la	$a0,str2
	syscall
	
	bge	$t0,SIZE,enddo2
	j	do1
enddo2:
	jr	$ra			
	
	
	
