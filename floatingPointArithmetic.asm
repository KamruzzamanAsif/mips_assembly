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

li $v0, 6
syscall
mov.s $f2, $f0
# input second number
li $v0, 4
la $a0, msg6
syscall

li $v0, 6
syscall
mov.s $f3, $f0
# add the numbers
li $v0, 4
la $a0, msg1
syscall

add.s $f12, $f2, $f3
li $v0, 2
syscall
# subtract the numbers
li $v0, 4
la $a0, msg2
syscall

sub.s $f12, $f2, $f3
li $v0, 2
syscall
# Multiply the numbers
li $v0, 4
la $a0, msg3
syscall

mul.s $f12, $f2, $f3
li $v0, 2
syscall
# divide the numbers
li $v0, 4
la $a0, msg4
syscall

div.s $f12, $f2, $f2
li $v0, 2
syscall


# end the program
li $v0, 10
syscall




