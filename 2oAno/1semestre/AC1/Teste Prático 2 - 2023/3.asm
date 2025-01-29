double prcells(int size, t_cell *tc)
{
    double tmp, result = 1.0;
    int i;

    for (i = 0; i < size; i++) {
        tmp = (double)tc[i].ns / 3.597;  
        result += tmp;
        tc[i].xpt = tmp;
        tc[i].sum = (int)result - 1;
    }
    return result;
}

# Copie a estrutura para o topo da área de resposta  
# e substitua xx pelo valor adequado
# typedef struct 
# {                  Alignment  Size   Offset
#    char smp[17];       1	 17	0
#    double xpt;         8	 8	17 -> 24
#    int ns;             4	 4	32 
#    char id;            1	 1	36
#    int sum;            4  	 4	37 -> 40
# } t_cell;              8	 44 -> 48

#size:	$t1
#tc:	$t2
#tmp:	$f4
#result:$f2
#i:	$t3

	.data
one:	.double	1.0
num: 	.double	3.597
	.text
	.globl	prcells
	
prcells:
	move	$t1,$a0
	move	$t2,$a1
	la	$t0,one
	l.d	$f2,0($t0)		#result = 1.0
	la	$t0,num
	l.d	$f8,0($t0)
	li	$t3,0
for:
	bge	$t3,$t1,endfor
	
	mul	$t0,$t3,48
	addu	$t4,$t2,$t0		#tc[i]
	lw	$t0,32($t4)		# tc[i].ns
	mtc1	$t0,$f6
	cvt.d.w	$f6,$f6			#(double)tc[i].ns
	div.d	$f4,$f6,$f8		# tmp = (double)tc[i].ns / 3.597
	
	add.d	$f2,$f2,$f4		# result += tmp
	s.d	$f4,24($t4)		# tc[i].xpt = tmp
	
	cvt.w.d	$f6,$f2
	mfc1	$t0,$f6			#(int)result 
	add.d	$t0,$t0,-1
	sw	$t0,40($t4)		# tc[i].sum = (int)result - 1
	
	addi	$t3,$t3,1
	j	for
endfor:	
	mov.d	$f0,$f2
	jr 	$ra