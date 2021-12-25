.text

main:

# (i)reading number of rows
la $a0, p1
li $v0, 4
syscall

li $v0, 5
syscall
move $s0, $v0

# (ii)reading number of columns
la $a0, p2
li $v0, 4
syscall

li $v0, 5
syscall
move $s1, $v0

# (iii)input 2D array of R*C characters
la $a0, p3
li $v0, 4
syscall

move $a0, $s0
li $v0, 1
syscall

la $a0, p4
li $v0, 4
syscall

move $a0, $s1
li $v0, 1
syscall

la $a0, p5
li $v0, 4
syscall

# input begins
la $s2, array

add $s3, $s1, $s1
addi $s3, $s3, -1  
mult $s3, $s0
mflo $s3

li $s4, 0       
input:
	li $v0, 12
	syscall 
	move $t8, $v0 
	sb $t8, ($s2)
	addi $s2, $s2, 1
	addi $s4, $s4, 1
	li $v0, 12
	syscall 
	move $t8, $v0 
	addi $s4, $s4, 1
	beq $t8, ' ', input
	beq $t8, '\r', new_line
new_line:
	la $a0, p13
	li $v0, 4
	syscall
	blt $s4, $s3, input
	              
# (iv) Printing the enterd array
la $a0, p6
li $v0, 4
syscall

move $a0, $s0
li $v0, 1
syscall

la $a0, p4
li $v0, 4
syscall

move $a0, $s1
li $v0, 1
syscall

la $a0, p7
li $v0, 4
syscall

# print begins
la $s2, array

mult $s0, $s1
mflo $s3

li $s4, 0
li $s5, 0
print:
	lb $t8, ($s2)
	li $v0, 11
	move $a0, $t8
	syscall
	addi $s2, $s2, 1
	addi $s4, $s4, 1
	bgt $s4, $s3, exit_print
	addi $s5, $s5, 1
	beq $s5, $s1, print_new_line
	li $a0, ' '
	li $v0, 11
	syscall
	j print
print_new_line:
	la $a0, p13
	li $v0, 4
	syscall
	li $s5, 0
	blt $s4, $s3, print	
exit_print:

# (v) taking two row numbers
la $a0, p8
li $v0, 4
syscall

li $v0, 5
syscall
move $s6, $v0

la $a0, p9
li $v0, 4
syscall

li $v0, 5
syscall
move $s7, $v0

# (vi) Exachangeing the two entered row and print the array again
la $s2, array

multu $s6, $s1
mflo $s4
add $s4, $s2, $s4

multu $s7, $s1
mflo $s5
add $s5, $s2, $s5

# exchange begins
li $t9, 0
exchange:
	lb $t1, ($s4)
	lb $t2, ($s5)
	sb $t1, ($s5)
	sb $t2, ($s4)
	addi $s4, $s4, 1
	addi $s5, $s5, 1
	addi $t9, $t9, 1
	blt $t9, $s1, exchange

# printing after exchange
la $a0, p10
li $v0, 4
syscall

move $a0, $s6
li $v0, 1
syscall

la $a0, p11
li $v0, 4
syscall

move $a0, $s7
li $v0, 1
syscall

la $a0, p12
li $v0, 4
syscall

#again print begins
la $s2, array

mult $s0, $s1
mflo $s3

li $s4, 0
li $s5, 0
print_v2:
	lb $t8, ($s2)
	li $v0, 11
	move $a0, $t8
	syscall
	addi $s2, $s2, 1
	addi $s4, $s4, 1
	bgt $s4, $s3, exit_program
	addi $s5, $s5, 1
	beq $s5, $s1, print_new_line_v2
	li $a0, ' '
	li $v0, 11
	syscall
	j print_v2
print_new_line_v2:
	la $a0, p13
	li $v0, 4
	syscall
	li $s5, 0
	blt $s4, $s3, print_v2	

exit_program:	
li $v0, 10
syscall



.data

array: .space 800
p1: .asciiz "Enter number of rows in the array: "
p2: .asciiz "\nEnter number of columns in the array: "
p3: .asciiz "\nEnter an array of "
p4: .asciiz "x"
p5: .asciiz " characters:\n"
p6: .asciiz "\nThe entered "
p7: .asciiz " array is:\n"
p8: .asciiz "\nEnter a row number: "
p9: .asciiz "\nEnter another row number: "
p10: .asciiz "\nThe array after exchanging Row "
p11: .asciiz " and Row "
p12: .asciiz " is:\n"
p13: .asciiz "\n"


