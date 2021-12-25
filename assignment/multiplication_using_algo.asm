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
li $s2, 0  # hi -> $s2 = 0
	   # lo -> $s0 

li $s3, 1         
mul_loop:
	andi $t0, $s0, 1
	beqz $t0, shift_hi_lo
	
	beq $s3, 32, add_2s_compliment
	
	addu $s2, $s2, $s1
	j shift_hi_lo
	
add_2s_compliment:
		neg $s1, $s1
		addu $s2, $s2, $s1

shift_hi_lo:
	  # right shifting lo by 1 bit
	  srl $s0, $s0, 1      
	  
	  # shifting the LSB of hi to lo's MSB
	  andi $t1, $s2, 1  
	  sll $t8, $t1, 31
	  srl $t1, $t1, 1
	  or $t1, $t1, $t8
	  or $s0, $s0, $t1
	  
	  # arithmatic right shifting hi (for sign bit)
	  sra $s2, $s2, 1    

next_iteration:
	  addi $s3, $s3, 1
	  blt $s3, 33, mul_loop
	
	
# Printing results and Overflow check
la $a0, p3
li $v0, 4
syscall

li $v0, 1
move $a0, $s0
syscall

case1:
bltz $s0, check_hi  
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


