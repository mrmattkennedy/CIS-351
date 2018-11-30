.globl nCk
.text
#n choose k = (n-1 choose k) + (n-1 choose k-1)
#a0 = n, a1 = k
#	if (k == 0)
#		return 1;
#	else if (k == 1)
#		return n;
#	else if (n == k)
#	    	return 1;
#	else
#	    	return (choose (n-1, k) + choose(n - 1, k - 1));
# need to store a0, a1, ra
#addi $a0, $a0, 5
#addi $a1, $a1, 3

addi $t0, $t0, 0 #check if $a1 is 0
addi $t1, $t1, 1 #check if $a1 is 1.
nCk:
	addi $sp, $sp, -12
	sw $a0, 8($sp)
	sw $a1, 4($sp)
	sw $ra, 0($sp)
	
	beq $a1, $t0, zero
	beq $a1, $t1, one
	beq $a0, $a1, equal
	bgt $a1, $t1, else
	#addi $v0, $v0, -1
	jr $ra

equal:
	add $v0, $v0, 1
	jr $ra	
	
zero:
	add $v0, $v0, 1
	jr $ra
	
one:
	add $v0, $v0, $a0
	jr $ra
	
else:
	addi $a0, $a0, -1
	jal nCk
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $a1, 4($sp)
	lw $a0, 8($sp)
	
	addi $a0, $a0, -1
	addi $a1, $a1, -1
	jal nCk
	addi $sp, $sp, 12
	lw $ra, 0($sp)
	lw $a1, 4($sp)
	lw $a0, 8($sp)
	jr $ra
	
	
#store on stack frame in main func, then check base cases. If none of them, go to else, where decrement, JAL, decrement, JAL
#
	
	
	