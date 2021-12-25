.data
array: .word 20, 10, 13, 4, 0, 5
str1:  .asciiz "Sorted array: "
str2: .asciiz " "

.text

main:

la $t3, array
add $t3, $t3, 24 # total 6*4 = 24
outer_loop:
	la $s0, array
	li $t0, 0
inner_loop:
	lw $t1, ($s0)
	lw $t2, 4($s0)
	blt $t1, $t2, continue
	addi $t0, $t0, 1
	sw $t2, ($s0)
	sw $t1, 4($s0)
continue:
	addi $s0, $s0, 4
	bne $s0, $t3, inner_loop
	bne $t0, 0, outer_loop
	
#print sorted array
la $a0, str1
li $v0, 4
syscall

la $t4, array
li $t6, 0
while:
	add $t6, $t6, 1
	bgt $t6, 6, exit 
	lw $t5, ($t4)
	add $t4, $t4, 4
	li $v0, 1
	move $a0, $t5
	syscall
	
	la $a0, str2
	li $v0, 4
	syscall
	
	j while
   
exit:
	li $v0, 10
	syscall
	




    
    
    
