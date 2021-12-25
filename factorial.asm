.data
msg1: .asciiz "Enter the number: "
msg2: .asciiz "Factorial of the number: "

.text
main:
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $s0, $v0

li $s1, 1  #initialize product = 1

beqz $s0, exit  #if n==0 print 1 and exit

loop:
	beqz $s0, exit
	mult $s1, $s0
	mflo $s1
	subi $s0, $s0, 1
	j loop

exit:
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 10
	syscall





