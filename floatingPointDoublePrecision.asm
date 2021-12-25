.data
msg1: .asciiz "\nSummation: "
msg2: .asciiz "\nSubtraction: "
msg3: .asciiz "\nMuliplication: "
msg4: .asciiz "\nDivision: "
msg5: .asciiz "\nEnter first number: "
msg6: .asciiz "\nEnter second number: "

.text
# input first number
li $v0, 4
la $a0, msg5
syscall

li $v0, 7
syscall
mov.d $f2, $f0
# input second number
li $v0, 4
la $a0, msg6
syscall

li $v0, 7
syscall
mov.d $f4, $f0
# add the numbers
li $v0, 4
la $a0, msg1
syscall

add.d $f12, $f2, $f4
li $v0, 3
syscall
# subtract the numbers
li $v0, 4
la $a0, msg2
syscall

sub.d $f12, $f2, $f4
li $v0, 3
syscall
# Multiply the numbers
li $v0, 4
la $a0, msg3
syscall

mul.d $f12, $f2, $f4
li $v0, 3
syscall
# divide the numbers
li $v0, 4
la $a0, msg4
syscall

div.d $f12, $f2, $f4
li $v0, 3
syscall


# end the program
li $v0, 10
syscall




