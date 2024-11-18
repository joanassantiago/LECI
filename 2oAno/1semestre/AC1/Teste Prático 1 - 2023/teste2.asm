#Mapa de Registos
#cc:	$t0
#ms:	$t1

	.data
str:	.asciiz	"Teste-Pratico-1"
	.text
	.globl	main
	
main:
	la	$t1,str			# ms = &str
	lb	$t2,0($t1)		# *ms = str
while:
	beq	$t2,'\0',endw
	move	$t0,$t2
if:	
	bge	$t0,'0',else
	li	$t2,'*'
	j	endif
else:
if2:
	blt	$t0,'a',endif
	bgt	$t0,'z',endif
	addi	$t2,$t2,-0x20
endif:
	sb	$t2,0($t1)
	addi	$t1,$t1,1
	j	while
endw:
	jr	$ra
	