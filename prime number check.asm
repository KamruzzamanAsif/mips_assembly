.data
    str1:  .asciiz "Enter a number: "
    str2:  .asciiz "Prime number"
    str3: .asciiz "Not a prime number"

.text

main:
    la $a0, str1    
    li $v0, 4
    syscall

    li $v0, 5       # take in input
    syscall
    move $s0, $v0   # $s0 = number

    beq $s0, 1, prime
    
    #check prime
    li $t0, 2
    
    div $s0, $t0
    mflo $t1     # $t1 = (n/2)
    
    loop:
    	bgt $t0, $t1, prime
    	div $s0, $t0
    	mfhi $t2
    	beqz $t2, not_prime
    	addi $t0, $t0, 1
    	j loop

   not_prime:
   	la $a0, str3   
        li $v0, 4
    	syscall
    	j exit
   prime:
   	la $a0, str2   
        li $v0, 4
        syscall
   
exit:
	li $v0, 10
	syscall
	




    
    
    
