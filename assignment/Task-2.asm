.text

main:
# taking input
la $a0, p1
li $v0, 4
syscall

li $v0, 5         
syscall       
move $s0, $v0

la $a0, p2
li $v0, 4
syscall

li $v0, 5          
syscall       
move $s1, $v0

# doing multiplication 
mult $s0, $s1
mfhi $s2
mflo $s3

# printing answer
la $a0, p3
li $v0, 4
syscall

li $v0, 1
move $a0, $s3
syscall

# checking for overflow
case1:
bltz $s3, check_hi  
j case2
check_hi:
	beq $s2, 4294967295, exit          # (4294967295)10 == (11111111111111111111111111111111)2
	j overflow_occured

case2:
bnez $s2, overflow_occured
j exit     

overflow_occured:
	la $a0, p4
	li $v0, 4
	syscall	
exit:
	li $v0, 10 
	syscall

.data
p1: .asciiz "Enter the multiplier: "
p2: .asciiz "\nEnter the multiplicand: "
p3: .asciiz "\nResult of multiplication = "
p4: .asciiz "\nOverflow occured"