.data
string: .space 500
msg1: .asciiz "Enter a string: "
msg2: .asciiz "\nPalindrome"
msg3: .asciiz "\nNot Palindrome"

.text

li $v0, 4
la $a0, msg1
syscall

#input string
li $v0, 8
la $a0, string
li $a1, 500
syscall

#find string length
la $t0, string

length_loop:
	lb $t1, ($t0)
	addiu $t0, $t0, 1
	bnez $t1, length_loop

addi $t0, $t0, -3 # our string length is $t0 
		  # which indicates the last element of string

#check if palindrome
la $t2, string

check_loop:
	lb $t3, ($t2)
	lb $t4, ($t0)
	
 	bne $t3, $t4, not_palindrome
 	addiu $t2, $t2, 1
 	addi $t0, $t0, -1
 	ble $t2, $t0, check_loop

li $v0, 4
la $a0, msg2
syscall
j exit_program

not_palindrome:
	li $v0, 4
	la $a0, msg3
	syscall

exit_program:
li $v0, 10
syscall
  
   
    
     
      
       
        
         
          
           
            
              













