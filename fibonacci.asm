.data
msg1: .asciiz "Enter how many fibonacci numbers you want to print: "
space: .asciiz " "

.text
main:
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $s0, $v0

#print 0 1 
li $a0, 0
li $v0, 1
syscall

la $a0, space
li $v0, 4
syscall

li $a0, 1
li $v0, 1
syscall

la $a0, space
li $v0, 4
syscall

#now loop code begins
li $t0, 0
li $t1, 1
addi $s0, $s0, -2

loop:
	subi $s0, $s0, 1
	bltz $s0, exit
	
	add $t2, $t0, $t1
	move $a0, $t2
	li $v0, 1
	syscall
	
	la $a0, space
	li $v0, 4
	syscall
	
	move $t0, $t1
	move $t1, $t2
	
	j loop

exit:
	li $v0, 10
	syscall








