.text

main:

#input a string
li $v0, 4
la $a0, msg1
syscall

li $v0, 8
la $a0, string
li $a1, 90
syscall

#print the string
li $v0, 4
la $a0, msg2
syscall

li $v0, 4
la $a0, string
syscall


#print the string in reverse order
li $v0, 4
la $a0, msg3
syscall

jal strlen    #find string length
add $s0, $zero, $v0  #$s0 = str_length

li $v0, 1
move $a0, $s0
syscall       #printing string length


li $v0, 4
la $a0, msg4
syscall

la $t3, string
rev_loop:
lb $t5, ($t3)
beqz $t5, next
sb $t5, reverse($s0)
addi $t3, $t3, 1
addi $s0, $s0, -1
j rev_loop


next:
#print begins
li $v0, 4
la $a0, reverse
syscall


exit:
li $v0, 10
syscall



strlen:
la $t0, string
li $t1, 0 #intialize counter

strlen_loop:
lb $t2, ($t0)
beqz $t2, exit_strlen
addi $t1, $t1, 1
addi $t0, $t0, 1
j strlen_loop

exit_strlen:
addi $t1, $t1, -1
add $v0, $zero, $t1
jr $ra


.data
string: .space 90
reverse: .space 90
msg1: .asciiz "Enter a string: "
msg2: .asciiz "\nPrinted string: "
msg3: .asciiz "\nString length: "
msg4: .asciiz "\nReverse ordered printed string: "
null: .asciiz "\0"
