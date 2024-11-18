#Mapa de registos:
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0 

	.data
	.eqv	print_string,4
	.eqv	read_int,5
	.eqv	MAX_STR_SIZE,33
main_str1:	.asciiz "\n"
main_str0:	.space 33
	.text
	.globl	main
	
main:
	addiu	$sp,$sp,-16
	sw	$ra,0($sp)
	sw	$s0,4($sp)
	sw	$s1,8($sp)		#val
	sw	$s2,12($sp)
	la	$s2,main_str0
main_do:
	li	$v0,5
	syscall
	move	$s1,$v0
	
	move	$a0,$s1
	li	$a1,2
	move	$a2,$s2
	jal 	itoa
	la	$a0,0($v0)
	li	$v0,print_string
	syscall
	
	la	$a0,main_str1
	li	$v0,print_string
	syscall
	
	move	$a0,$s1
	li	$a1,8
	move	$a2,$s2
	jal 	itoa
	la	$a0,0($v0)
	li	$v0,print_string
	syscall
	
	la	$a0,main_str1
	li	$v0,print_string
	syscall
	
	move	$a0,$s1
	li	$a1,16
	move	$a2,$s2
	jal 	itoa
	la	$a0,0($v0)
	li	$v0,print_string
	syscall
	
	bne	$s1,$s0,main_do
	
main_while:
	li	$v0,0
	lw	$ra,0($sp)
	lw	$s0,4($sp)	# &str[0]
	lw	$s1,8($sp)	# val
	lw	$s2,12($sp)
	addiu	$sp,$sp,16
	jr	$ra
############################################################
	.data
	.text
itoa:
	addiu	$sp,$sp,-20
	sw	$ra,0($sp)
	sw	$s0,4($sp)
	sw	$s1,8($sp)
	sw	$s2,12($sp)
	sw	$s3,16($sp)
	
	move	$s0,$a0
	move	$s1,$a1
	move	$s2,$a2
	move	$s3,$a2
	
itoa_do:
	remu	$t0,$s0,$s1
	divu	$s0,$s0,$s2
	move	$a0,$t0
	jal	toascii
	sb	$v0,0($s3)
	addiu	$s3,$s3,1
	bgtz	$s0,itoa_do
while:
	li	$t0,'\0'
	sb	$t0,0($s3)
	jal	strrev
	move	$v0,$s2
	lw	$s3,16($sp)
	lw	$s2,12($sp)
	lw	$s1,8($sp)
	lw	$s0,4($sp)
	lw	$ra,0($sp)
	addiu	$sp,$sp,20
	jr	$ra
	
############################################################	
	.data
	.text
toascii:	
	addi	$a0,$a0,'0'
toascii_if:
	ble	$a0,'9',toascii_endif
	addi	$a0,$a0,7
toascii_endif:
	move	$v0,$a0
	jr	$ra

############################################################	
	.data
	.text	
strrev:
	addiu	$sp,$sp,-16
	sw	$ra,0($sp)
	sw	$s0,4($sp)
	sw	$s1,8($sp)
	sw	$a0,12($sp)
	move	$s0,$a0
	move	$s1,$a0
while1:
	lb	$t0,0($s1)
	beq	$t0,'\0',endw1
	addiu	$s1,$s1,1
	j	while1
endw:	
	addiu	$s1,$s1,-1
while2:
	bgeu	$s0,$s1,endw2
	move	$a0,$s0
	move	$a1,$s1
	jal	exchange
	addiu	$s0,$s0,1
	addiu	$s1,$s1,-1
	j	endw2
endw2:
	move	$v0,$s0
	lw	$ra,0($sp)
	lw	$s0,4($sp)
	lw	$s1,8($sp)
	lw	$a0,12($sp)
	addiu	$sp,$sp,16
	jr	$ra
	
	.data
	.text
exchange:
	lb	$t0,0($a0)
	lb	$t1,0($a1)
	sb	$t1,0($a0)
	sb	$t0,0($a1)
	jr	$ra
	
	
	