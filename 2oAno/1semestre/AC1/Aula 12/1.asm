# typedef struct
# {				Aligment 	SIZE	Offset
#  unsigned int id_number;	4		4	0
#  char first_name[18];		1		18	4
#  char last_name[15];		1		15	22
#  float grade;			4		4	37 -> 40
# } student; 			4		44

# Mapa de registos
# media:	

	.eqv	id_number,0
	.eqv	first_name,4
	.eqv	last_name,22
	.eqv	grade,40
	.eqv	MAX_STUDENTS,4
	.data
st_array:
	.space	176				# 176 = 4 * 44	
media:	.space	4				# float ocupa 4
str1:	.asciiz	"N. Mec: "
str2:	.asciiz	"Nome: "
str3:	.asciiz	"Apelido: "
str4:	.asciiz	"Nota: "
str5:	.asciiz	"\nMedia: "
nmax:	.float 	-20.0
fs:	.float 	0.0
#pmax > $t9
	.text
	.globl	main
	
#Mapa de registos:
#media:	f2
#pmax:	$t1

main:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	la	$a0,st_array
	li	$a1,MAX_STUDENTS
	jal 	read_data
	
	la	$a0,st_array
	li	$a1,MAX_STUDENTS
	la	$a2,media
	jal 	max
	move	$t9,$v0
	
	la	$a0,str5
	li	$v0,4
	syscall
	
	li	$v0,2
	la	$t0,media
	l.s	$f12,0($t0)				# vistos que é um float
	syscall
	
	move	$a0,$t9
	jal 	print_student
	syscall
	li	$v0,0
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	
	jr	$ra

#Mapa de registos:
#st:	$t1
#ns:	$t2
#i:	$t3

read_data:
	li	$t3,0
	move	$t1,$a0
	move	$t2,$a1
read_for:
	bge	$t3,$t2,endfor
	la	$a0,str1
	li	$v0,4
	syscall
	
	mul	$t0,$t3,44
	addu	$t0,$t0,$t1
	li	$v0,5
	syscall
	sw	$v0,0($t0)
	
	la	$a0,str2
	li	$v0,4
	syscall
	
	addiu	$a0,$t0,first_name
	li	$a1,17
	li	$v0,8
	syscall
	
	la	$a0,str3
	li	$v0,4
	syscall
	
	addiu	$a0,$t0,last_name
	li	$a1,14
	li	$v0,8
	syscall
	
	la	$a0,str4
	li	$v0,4
	syscall
	
	li	$v0,6
	syscall
	s.s	$f0,grade($t0)
	
	addi	$t0,$t0,1
read_endfor:
	j	read_for

max:
	