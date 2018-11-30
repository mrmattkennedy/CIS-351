########################################################################
# We spoke in class about how freqently we need to save to the stack;
# I only saved at the beginning and the end. The callee is required to
# save the $s registers, as well as $ra. The callee also makes sure the
# stack pointer is preserved at the same spot it was at before. Because 
# we modify the $t registers, we don't have to save these on the stack,
# as the caller would save these, and there is no need to save the value.
# the only thing we need to save is the $s registers, and whatever value
# $ra is.
#
# Another way to do this that would be more involved with the stack is 
# to directly modify the $a registers instead of using the $t registers.
# This would require saving the values in wackySum before jal to the
# combineFour label.
########################################################################
main:
	addi $s0, $s0, 3
	addi $s1, $s1, 7
	addi $s2, $s2, 2
	
	addi $sp, $sp, -16
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $s2, 4($sp)
	sw $ra, 0($sp)
	jal wackySum
	
wackySum:
	bgt $s0, $s1, done #a > b
	jal combineFour
	add $s0, $s0, $s2
	add $v0, $v0, $v1
	j wackySum

combineFour:
	#i, (i+1)/2, (i+2)/2, (i+3)
	sub $v1, $v1, $v1
	add $t0, $s0, $0
	
	add $t1, $s0, 1
	div $t1, $t1, 2	
	add $t2, $s0, 2
	div $t2, $t2, 2	
	add $t3, $s0, 3	
	
	add $v1, $v1, $t0
	add $v1, $v1, $t1
	add $v1, $v1, $t2
	add $v1, $v1, $t3
	
	andi $t4, $v1, 1
	beq $t4, 1, odd
	jr $ra
	
odd:
	div $v1, $v1, 2
	jr $ra
	
done:
	lw $s0, 12($sp)
	lw $s1, 8($sp)
	lw $s2, 4($sp)
	lw $ra, 0($sp)
	addi $sp $sp, 16
	jr $ra
	

	
