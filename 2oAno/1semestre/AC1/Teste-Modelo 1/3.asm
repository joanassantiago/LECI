#Mapa de Registos
#n_even: $t0
#n_odd:	 $t1
#p1:	 $t2
#p2:	 $t3

	.data
	.eqv	N,35
	.eqv	read_int,5
	.eqv	print_int10,1
a:	.space 	140							# 35*4 = 140
c:	.space 	140
	.text
	.globl 	main
	
main:									#   void main(void){
	li	$t0,0							#	n_even = 0;
	li	$t1,0							#	n_odd = 0;
	la	$t2,a							#	p1 = a;
	li	$t4,N							#	$t4 = N;
	sll	$t4,$t4,2						#	$t4 * 4 (procurar porque fazemos isto)
	addu	$t4,$t4,$t2						#	$t4 = a + N;
for1:	
	bge	$t2,$t4,endf1						#	if( p1 >= (a + N)) then endf1;
	li	$v0,5							#	   else: $vo = read_int();
	syscall					
	sw	$t2,0($v0)						#	   *p1 = read_int();
	addiu	$t2,$t2,4						#	p1++;
	j	for1
endf1:
	la	$t2,a							#	p1 = a;
	la	$t3,c							#	p2 = b;
for2:
	bge	$t2,$t4,endf2						#	(p1 >= (a + N)) then endif2;
	lw	$t5,0($t2)						#	$t5 = *p1
	rem	$t6,$t5,2						#	$t6 = *p1/2
if:	
	beq	$t6,0,else						#	*p1/2 = 0 then else;
	sw	$t5,0($t3)						#	*p1 = *p2
	addiu	$t3,$t3,1						#	*p2++;
	addiu	$t1,$t1,1						#	n_odd++;
	j	endif
else:
	addiu	$t0,$t0,1						#	n_even++;
endif:
	addiu	$t2,$t2,4						#	p1++;
	j	for2
endf2:
	la	$t3,c
	sll 	$t5,$1,4
	addu	$t5,$t3,$t5
for3:
	bge	$t3,$t5,endf3
	lw	$a0,0($t3)
	li	$v0,1
	syscall
	addiu	$t3,$t3,4
	j	for3
endf3:
	jr	$ra
	

	