#Mapa de registos
#str:	$a0
#p1:	$s0
#p2:	$s1

	.data
	.text
	.globl	main
	
main:
	
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
	
	
	