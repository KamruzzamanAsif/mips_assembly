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

# check for sign
dividend_sign:
	bgez $s0, divisor_sign
	li $s3, 2147483648       # (2147483648)10 = (10000000000000000000000000000000)2
	neg $s0, $s0

divisor_sign:
	bgez $s1, division
	li $s4, 2147483648       # (2147483648)10 = (10000000000000000000000000000000)2
	neg $s1, $s1

# doing division
division:
	li $s5, 0   # $s5 -> remainder = 0
		    # $s0 -> quotient = dividend

li $s6, 0
div_loop:
	srl $t0, $s0, 31
	sll $t1, $s0, 1
	or $t0, $t0, $t1
	andi $t0, $t0, 1
	sll $s5, $s5, 1
	sll $s0, $s0, 1
	or $s5, $s5, $t0

check_difference:
	subu $t0, $s5, $s1
	bltz $t0, next_iteration
	ori $s0, $s0, 1
	move $s5, $t0

next_iteration:
	addi $s6, $s6, 1
	bne $s6, 32, div_loop

# print remainder and quotient
quotient_sign:
	xor $t2, $s3, $s4
	bgez $t2, remainder_sign
	neg $s0, $s0
	
remainder_sign:
	bgez $s3, print_answer
	neg $s5, $s5
	
print_answer:
	li $v0, 4
	la $a0, p3
	syscall
	
	li $v0, 4 
	la $a0, p4
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4 
	la $a0, p5
	syscall
	
	li $v0, 1
	move $a0, $s5
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
