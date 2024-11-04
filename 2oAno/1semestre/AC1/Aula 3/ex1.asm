	.data
str1: 	.asciiz "Introduza um numero: "
str2:	.asciiz "Valor ignorado\n"
str3:	.asciiz "A soma dos positivos e': "
	.text
	.globl main
	
main:						#void main(void) {
	li 	$t0,0				# soma = 0;
	li 	$t2,0				# i = 0;
while:	
	bge 	$t2,5,endw			# whlie (i < 5) {
	la 	$a0,str1	
	li 	$v0,4
	syscall					# print_str(str1);
	li 	$v0,5
	syscall	
	move 	$t1,$v0				# value = read_int()	
if:	
	ble 	$t1,$0,else			# if(value > 0){
	add 	$t0,$t0,$t1			# soma += value
	j 	endif
else:						# }else{
	la	$a0,str2
	li	$v0,4
	syscall					# print_str(str2);
endif:						#	}
	addi 	$t2,$t2,1			# i++
	j 	while
	
endw:						# }else{
	la	$a0,str3
	li	$v0,4
	syscall	
	li 	$v0,1
	move	$a0,$t0				#cópia
	syscall					#print_int10(soma)	
	jr	$ra	
	