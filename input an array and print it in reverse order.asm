.text

main:
la $a0, msg1
li $v0, 4
syscall

#input the array
la $s0, array
li $t1, 0
input_loop:
li $v0, 5
syscall

sw $v0, ($s0)
addi $t1, $t1, 1
addi $s0, $s0, 4
ble $t1, 4, input_loop

#print the array
la $t0, array
li $t1, 0
print_loop:
lw $s0, ($t0)
move $a0, $s0
li $v0, 1
syscall
addi $t1, $t1, 1
addi $t0, $t0, 4
ble $t1, 4, print_loop

#new line
la $a0, msg3
li $v0, 4
syscall

#print the array in reverse order
subi $t0, $t0, 4 
li $t1, 0
print_reverse_loop:
lw $s0, ($t0)
move $a0, $s0
li $v0, 1
syscall
addi $t1, $t1, 1
subi $t0, $t0, 4
ble $t1, 4, print_reverse_loop


exit:
li $v0, 10
syscall


.data
array: .space 40
msg1: .asciiz "Hi there.\n Enter an arrray of 5 integer:\n"
msg2: .asciiz "Output arrray of 5 integer:\n"
msg3: .asciiz "\n"


