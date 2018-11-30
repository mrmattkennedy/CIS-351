.globl makes10 intMax, close10, dateFashion
.text
j dateFashion

####################
# makes10 Section
####################
makes10:
	#addi $a0, $a0, 3
	#addi $a1, $a1, 6
	sub $v0, $v0, $v0
	beq $a0, 10, makes10true
	beq $a1, 10, makes10true
	
	add $a2, $a0, $a1
	beq $a2, 10, makes10true
	jr  $ra

makes10true:
	addi $v0, $v0, 1
	jr  $ra


####################
# intMax Section
####################
intMax:
#t0 = comparison register
	sub $v0, $v0, $v0
	#addi $a0, $a0, 5
	#addi $a1, $a1, 6
	#addi $a2, $a2, 7
	
	slt $t0, $a0, $a1 #first comparison
	beq $t0, 1, firstLessThanSecond
	beq $t0, 0, firstGreaterThanSecond
	jr  $ra
	
firstLessThanSecond:
	add $v0, $v0, $a1
	slt $t0, $v0, $a2 #second comparison
	beq $t0, 1, currMaxLessThanLast
	jr  $ra
	
firstGreaterThanSecond:
	add $v0, $v0, $a0
	slt $t0, $v0, $a2 #second comparison
	beq $t0, 1, currMaxLessThanLast
	jr  $ra
	
currMaxLessThanLast:
	sub $v0, $v0, $v0
	add $v0, $v0, $a2
	jr  $ra

		
####################
# close10 Section
####################	
close10:
#t0 = 10 - a0
#t1 = 10 - a1
	sub $v0, $v0, $v0
	sub $t3, $t3, $t3
	addi $t3, $t3, 10
	#addi $a0, $a0, 11
	#addi $a1, $a1, 9
	
	sub $t0, $t3, $a0 
	sub $t1, $t3, $a1
	
	seq $v0, $t0, $t1 #both equal
	beq $v0, 1, close10equal
	
	sub $v0, $v0, $v0
	add $v0, $t0, $t1 #this will be 0 if they are equal in magnitude but not sign
	seq $v0, $v0, 0
	beq $v0, 1, close10equal
	
	sltu $v0, $t0, $t1 #a0 closer than a1
	beq $v0, 1, close10LessThan
	sub $v0, $v0, $v0
	add $v0, $v0, $a1
	jr $ra
	
close10equal:
	sub $v0, $v0, $v0
	jr $ra
	
close10LessThan:
	sub $v0, $v0, $v0
	add $v0, $v0, $a0
	jr $ra
	
	
####################
# DateFasion Section
####################
dateFashion:
#a0 or a1 > 7, yes
#a0 or a1 < 3, no
#maybe
	#addi $a0, $a0, 7
	#addi $a1, $a1, 3
	sub $v0, $v0, $v0
	sub $t0, $t0, $t0
	sub $t1, $t1, $t1
	addi $t0, $t0, 7 #fancy minimum
	addi $t1, $t1, 3 #bad maximum
	
	
	sgt $v0,$a0, $t0
	sgt $v1,$a1, $t0
	
	beq $v0, 1, guaranteedFancy
	beq $v1, 1, guaranteedFancy
	
	slt $v0,$a0, $t1
	slt $v1,$a1, $t1
	
	beq $v0, 1, guaranteedNo
	beq $v1, 1, guaranteedNo
	
	sub $v0, $v0, $v0
	addi $v0, $v0, 1
	jr $ra
	
guaranteedFancy:
	sub $v0, $v0, $v0
	addi $v0, $v0, 2
	jr $ra
	
guaranteedNo:
	sub $v0, $v0, $v0
	jr $ra
