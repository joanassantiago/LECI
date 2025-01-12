	.data
	.eqv	read_int,5
	.eqv	print_float,2
foonst:	.float 	2.59375
fzero:	.float	0.0
	.text
	.globl	main

#val > $t0; res > $f0

main:
do:
	li	$v0,5
	syscall
	move	$t0,$v0				#	val = read_int();
	mtc1	$t0,$f2
	cvt.s.w	$f2,$f2				#	float ft = (float)val;
	la	$t1,foonst
	l.s	$f4,0($t1)			#	float ft1 = 2.593
	mul.s	$f0,$f2,$f4			#	res = ft*ft1;
	li	$v0,2
	mov.s	$f12,$f0
	syscall					#	print_float(res);
	la	$t1,fzero			#	FT1 = 0.0
	l.s	$f4,0($t1)
	c.eq.s	$f0,$f4
	bc1f	do
	li	$v0,0
	jr	$ra