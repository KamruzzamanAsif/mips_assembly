.data
    buffer: .space 100
    str1:  .asciiz "Enter string: "
    str2:  .asciiz "Capitalized: "

.text

main:
    la $a0, str1    # Load and print string asking for string
    li $v0, 4
    syscall

    li $v0, 8       # take in input
    la $a0, buffer  # load byte space into address
    li $a1, 100      # allot the byte space for string
    syscall
    move $s0, $a0   # save string to s0


    li $t0, 0

    #Loop to capitalize
    loop:
    lb $t1, buffer($t0)    #Load byte from 't0'th position in buffer into $t1
    beq $t1, 0, exit       #If ends, exit
    blt $t1, 'a', not_lower  #If less than a, exit
    bgt $t1, 'z', not_lower #If greater than z, exit
    sub $t1, $t1, 32  #If lowercase, then subtract 32
    sb $t1, buffer($t0)  #Store it back to 't0'th position in buffer

    #if not lower, then increment $t0 and continue
    not_lower: 
    addi $t0, $t0, 1
    j loop

    exit:
    la $a0, str2    # load and print "capitalized" string
    li $v0, 4
    syscall

    la $a0, buffer   # primary address = s0 address (load pointer)
    li $v0, 4       # print string
    syscall
    li $v0, 10      # end program
    syscall
    
    
    
