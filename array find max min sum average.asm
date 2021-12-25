.data
array: .word 12, 5, 3, 10, -1, 14, -3, 8
msg1: .asciiz "Max value: "
msg2: .asciiz "\nMin value: "
msg3: .asciiz "\nSum value: "
msg4: .asciiz "\nAverage value: "

.text
main:

#find max vlaue
la $s0, array
li $t0, 0
li $t1, -1000
max_loop:
	addi $t0, $t0, 1
	bgt $t0, 8, max_print
	lw $t2, ($s0)
	addi $s0, $s0, 4
	bgt $t2, $t1, max_update
	j max_loop
	
max_update:
	move $t1, $t2
	j max_loop
max_print:
	li $v0, 4
	la $a0, msg1
	syscall
	move $a0, $t1
	li $v0, 1
	syscall

#find min value
la $s0, array
li $t0, 0
li $t1, 1000

min_loop:
	addi $t0, $t0, 1
	bgt $t0, 8, min_print
	lw $t2, ($s0)
	addi $s0, $s0, 4
	blt $t2, $t1, min_update
	j min_loop
min_update:
	move $t1, $t2
	j min_loop
min_print:
	li $v0, 4
	la $a0, msg2
	syscall
	move $a0, $t1
	li $v0, 1
	syscall

#find total sum of array
la $s0, array
li $t0, 0
li $s1, 0
sum_loop:
	addi $t0, $t0, 1
	bgt $t0, 8, sum_print
	lw $t1, ($s0)
	add $s1, $s1, $t1
	addi $s0, $s0, 4
	j sum_loop
sum_print:
	li $v0, 4
	la $a0, msg3
	syscall
	move $a0, $s1
	li $v0, 1
	syscall
	
# average value
average_value_print:
	li $v0, 4
	la $a0, msg4
	syscall
	
	div $t2, $s1, 8
	move $a0, $t2
	li $v0, 1
	syscall 
	

exit:
	li $v0, 10
	syscall