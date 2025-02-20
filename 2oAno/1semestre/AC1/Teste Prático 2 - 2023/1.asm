int checkp(int);

int treat(int *array, int low, int high)
{
    int i, npr;
    int *p = array;

    for (i = low + 1, npr = 0; i < high; i++) 
    {
        if (checkp(i) == 1) {
            *array = i;
            array++;
            npr++;
        }
    }
    *(p + npr) = npr;
    return npr;
}

# array: $s1
# low  : $s2
# high : $s3
# i    : $s4 
# npr  : $s5
# p    : $s6

            .data
            .text
            .globl treat
            
treat:
            addiu $sp, $sp, -28
            sw $ra, 0($sp)
            sw $s1, 4($sp)
            sw $s2, 8($sp)
            sw $s3, 12($sp)
            sw $s4, 16($sp)
            sw $s5, 20($sp)
            sw $s6, 24($sp)

            move $s1, $a0 #array
            move $s2, $a1 #low
            move $s3, $a2 #high

            move $s6, $s1    #int *p = array

            addi $s4, $s2, 1    # i = low + 1
            li $s5, 0           # npr = 0

for:
            bge $s4, $s3, endfor    # i < high

            move $a0, $s4
            jal checkp              # checkp(i)
if:        
	    bne $v0, 1, endif       # checkp(i) == 1

            sw $s4, 0($s1)          # *array = i
            addiu $s1, $s1, 4       # array ++
            addi $s5, $s5, 1        # npr ++
endif:     
            addi $s4, $s4 , 1    # i++
            j for
endfor:
            sll $t1, $s5, 2		# como tem de ser passado para array mete-se 4
            addu $t0, $s6, $t1
            sw $s5, 0($t0)

            move $v0, $s5
            
            lw $ra, 0($sp)
            lw $s1, 4($sp)
            lw $s2, 8($sp)
            lw $s3, 12($sp)
            lw $s4, 16($sp)
            lw $s5, 20($sp)
            lw $s6, 24($sp)
            addiu $sp, $sp, 28 

            jr $ra