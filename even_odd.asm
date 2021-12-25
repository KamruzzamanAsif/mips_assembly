.data
msg1: .asciiz "Enter an integer: "
msg2: .asciiz "is a Even integer"
msg3: .asciiz "is a Odd integer"

.text
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $s0, $v0

li $t0, 2
div $s0, $t0
mfhi $t1

bnez $t1, odd

li $v0, 4
la $a0, msg2
syscall
j exit

odd:
	li $v0, 4
	la $a0, msg3
	syscall

exit:
	li $v0, 10
	syscall

