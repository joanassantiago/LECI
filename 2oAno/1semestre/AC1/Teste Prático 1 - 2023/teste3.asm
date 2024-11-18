#Mapa de registos
#i:	$t0
#max1:	$t1
#max2:	$t2
	
	.data
	.eqv	SIZE,5
array:	.word	5,27,3,11,56
	.text
	.globl 	main
	
main:
	li	$t6,1
	sll	$t1,$t6,31
	move	$t2,$t1
	li	$t0,0
for:
	bge	$t0,SIZE,endf
	la	$t3,array
	sll	$t4,$t0,2
	addu	$t4,$t3,$t4
	lw	$t5,0($t4)
if:
	ble	$t5,$t1,else
	move	$t2,$t1
	move	$t1,$t5
	j	endif
else:
if2:
	ble	$t5,$t2,endif
	bge	$t5,$t1,endif
	move	$t2,$t5
endif:	
	addi	$t0,$t0,1
	j	for
endf:
	jr	$ra