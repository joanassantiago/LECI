#Mapa de Registos
#val:	$t0
#n:	$t1
#min:	$t2
#max	$t3

	.data
	.eqv	print_string,4
	.eqv	read_int,5
	.eqv	print_int10,1
	.eqv	print_char,11
str1:	.asciiz	"Digite ate 20 inteiros (zero para terminar): "
str2:	.asciiz "Maximo/minimo sao: "
	.text
	.globl main
	
main:
	li	$t1,0
	li	$t2,0x7FFFFFFF
	li	$t3,0x80000000
	la	$a0,str1
	li	$v0,4
	syscall

do:	
	li	$v0,5
	syscall
	move	$t0,$v0				#val = read_int, porque o "move" faz com que $t0 contenha o $v0
if1:	
	beq	$t0,0,endif1
if2:
	ble	$t0,$t3,endif2
	move	$t3,$t0
endif2:
	bge	$t0,$t2,endif1
	move	$t2,$t0
endif1:
	addiu	$t2,$t2,1
	bge	$t1,20,enddo
	beq	$t1,0,enddo
	
	j	do
enddo:
	la	$a0,str2
	li	$v0,4
	syscall
	
	move	$a0,$t3
	li	$v0,1
	syscall
	
	li	$a0,':'
	li	$v0,11
	syscall
	
	move	$a0,$t2
	li	$v0,1
	syscall
	
	j	$ra