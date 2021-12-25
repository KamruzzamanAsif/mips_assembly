.data
    buffer: .space 100
    str1:  .asciiz "Enter a number: "
    str2:  .asciiz "Binary representation: "

.text

main:
    la $a0, str1    
    li $v0, 4
    syscall

    li $v0, 5       # take in input
    syscall
    move $s0, $v0   # $s0 = number

    la $s1, buffer # $s1 = buffer adress
    li $t0, 2
loop:
	beqz $s0, print
	
	div $s0, $t0
	mfhi $t1
	mflo $s0
	
	add $t1, $t1, 48   # to convert an integer to a char just add 48 with it
    	sb $t1, ($s1)
    	add $s1, $s1, 1
    	
    	j loop

print:
#now print
    la $a0, str2   
    li $v0, 4
    syscall
# the output is in reverse order 
# so we have to reverse the array to get the actual binary representation

#first find the length of the array(string)
li $t2, 0
la $s1, buffer
while:
	lb $t3, ($s1)
	beqz $t3, exit_while
	addi $t2, $t2, 1
	addi $s1, $s1, 1
	j while
exit_while:
#now our string length is $t2

print_loop:
	bltz $t2, exit
	lb $t4, buffer($t2)
	subi $t2, $t2, 1
	
	li $v0, 11
	move $a0, $t4
	syscall
	
	j print_loop

exit:
	li $v0, 10
	syscall
	




    
    
    
