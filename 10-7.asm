	.data
	
	.text

main:
	la $s0, 7 # int w
	li $s1, 0 # int x
	li $s2, 0 # int y
	li $s3, 0 # int z
	
	li $a0, 8 
	li $a1, 7
	li $a2, 23
	li $a3, 98
	li $t0, -1 #5th argument
	addi $sp,$sp,-8 # increase the stack
	sw $t0, 0($sp) #push 5th onto the stack
	sw $s0, 4($sp) #push 6th onto the stack
	jal funct1
	addi $s1, $v0, 0 #copy first return value into $s0
	addi $s2, $v1, 0 #copy 2nd return value into $s1
	lw $s3, 0($sp)
	addi $sp, $sp, 4 #pop 3rd return value from the stack
	j exit

	
		
funct1:
	sw $ra, 8($sp)
	add $v0, $a0, $a1
	add $v0, $v0, $a2
	lw $t0, 0($sp) #pops the 5th argument
	addi $sp, $sp, 4 #lower the stack pointer
	lw $t0, 4($sp) #pops the 6th argument
	addi $sp, $sp, 8 #lower the stack pointer
	sub $v1, $a3, $t0 #d-e
	lw $s0, 0($sp)
	addi $sp, $sp, 8 #lower the stack pointer
	jal funct2
	add $t1, $t1, $s0
	addi $sp, $sp, -8
	sw $t1, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	
funct2:
	
	sll $t1, $v0, 5 #x*32
	jr $ra
	
	
exit:
	li	$v0, 10			#syscall system code to exit
	syscall
		
