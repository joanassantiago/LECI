#	NAME		Align 		SIZE		Offset
#int id_number		4		4		0
#char first_name[18]	1		18		4
#char last_name[15]	1		15		22
#float grade		4		4		37 -> 40

	.eqv	id_number,0
	.eqv	first_name, 4
	.eqv	last_name, 22
	.eqv	grade, 40
	.data 
stg: 	.word	72343
	.asciiz	"Napoleao"  			# ocupa 9 endereços
	.space	9				# serve para preencher o espaço que falta		
	.asciiz	"Bonaparte"
	.space	5
	.float	5.1
str1: 	.asciiz	"\nN. Mec: "			# ocupa 10 endereços
str2: 	.asciiz	"\nNome: "
str3:	.asciiz	"\nNota: "
	.text
	.globl 	main
	
main:						# int main(void){
	li	$v0,4
	la	$a0,str1
	syscall					# 	print_str(str1)
	la	$t0,stg				#	student *spt = &stg
	lw	$a0,id_number($t0)
	li	$v0,36
	syscall					#	print_unit(stg.id_number)
	
	li	$v0,4
	la	$a0,str2
	syscall					#	print_str(str2)
	li	$v0,4
	addiu	$a0,$t0,last_name		#	char *cpt = &stg + first_name_offset
	syscall
	li	$v0,11
	li	$a0,','
	syscall					# 	print_char(',')
	li	$v0,4
	addiu	$a0,$t0,first_name
	syscall
	
	li	$v0,4
	la	$a0,str3
	syscall					#	print_str(str3)
	
	l.s	$f12,grade($t0)
	li	$v0,2
	syscall					#	print_float(stg.grade)
	
	jr	$ra