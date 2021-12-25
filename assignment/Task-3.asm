.text

main:

# taking input
li $v0, 4
la $a0, p1
syscall
li $v0, 5
syscall
move $s0, $v0

li $v0, 4
la $a0, p2
syscall
li $v0, 5
syscall
move $s1, $v0

# doing division
div $s0, $s1
mfhi $s2
mflo $s3

# printing answer
li $v0, 4
la $a0, p3
syscall
	
li $v0, 4 
la $a0, p4
syscall
	
li $v0, 1
move $a0, $s3
syscall
	
li $v0, 4 
la $a0, p5
syscall
	
li $v0, 1
move $a0, $s2
syscall
	
exit:
	li $v0, 10 
	syscall


.data
p1: .asciiz "Enter the dividend: "
p2: .asciiz "\nEnter the divisor: "
p3: .asciiz "\nResult of division: "
p4: .asciiz " Quotient = "
p5: .asciiz " Remainder = "