.data
    str1:  .asciiz "Enter a number: "
    str2:  .asciiz "Number of 1's in the number is: "

.text

main:
    la $a0, str1    
    li $v0, 4
    syscall

    li $v0, 5       # take in input
    syscall
    move $s0, $v0   # $s0 = number

    li $t0, 0 # counter
    li $t1, 10
    loop:
    	beqz $s0, exit
    	
    	div $s0, $t1
	mfhi $t2
	mflo $s0
	
	bne $t2, 1, loop
	addi $t0, $t0, 1
	j loop


exit:
	la $a0, str2    
    	li $v0, 4
    	syscall
    	
    	move $a0, $t0
    	li $v0, 1
    	syscall
    	
	li $v0, 10
	syscall
	




    
    
    
