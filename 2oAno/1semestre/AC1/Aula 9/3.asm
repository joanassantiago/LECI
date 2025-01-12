#Mapa de registos:
#array:	$a0
#n:	$a1
#i:	$t0
#sum:	$f0
#return:$f0

	.data
zero:	.double	0.0
	.text
	
average:
	li	$t1,1
	sub	$a0,$a0,$t1
	move	$t0,$a1
	mtc1	$0,$f0				#contante 0.0 em $f0
	cvt.d.w	$f0,$f0
avrgfor:
	blt	$t0,0,avrgendfor
	addi	$t2,$t0,-