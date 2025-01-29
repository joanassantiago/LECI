float proc(double *array, double thd, double val, int n)
{
    int i;
    double aux, sum;

    sum = 0.0;
    for (i = 0; i < n; i++) {
        aux = array[i] + val;
        if (aux > thd) {
            array[i] = thd;
            sum += thd;
        } else {
            array[i] = aux;
            sum += aux;
        }
    }
    return (float) (sum / (double) n);
}

#array:	$t1
#thd:	$f2
#val:	$f4
#n:	$t2
#i:	$t3
#aux:	$f6
#sum:	$f8

	.data
zero:	.double	0.0
	.text
	.globl	proc
	
proc:
	move	$t1,$a0
	mov.d	$f2,$f12
	mov.d	$f4,$f14
	move	$t2,$a1
	
	la	$t0,zero
	l.d	$f8,0($t0)
	li	$t3,0
for:
	bge	$t3,$t2,endfor
	sll	$t0,$t3,3			# double ocupa 8 bytes logo tem de ser 3
	addu	$t4,$t1,$t0
	l.d	$f0,0($t4)
	add.d	$f6,$f0,$f4
if:
	c.le.d	$f6,$f2
	bc1t	else
	s.d	$f2,0($t4)
	add.d	$f8,$f8,$f2
	j	endif
else:	
	s.d	$f6,0($t4)
	add.d	$f8,$f8,$f6
endif:
	addi	$t3,$t3,1
	j	for
endfor:
	mtc1	$t2,$f0
	cvt.d.w	$f0,$f0
	div.d	$f0,$f8,$f0
	cvt.s.d	$f0,$f0
	jr	$ra