.data
.text
.globl main
main:
    ori $v0, $zero, 5
    syscall
    add $a0, $v0, $zero

    # Start program 
    addi $t0, $0, 0  # F0 = 0
    addi $t1, $0, 1  # F1 = 1
    addi $t2, $0, 1  # i = 0
    j cond
loop:
    addu  $t4, $t0, $t1     # Fi = F(i-2) + F(i-1)
    addu  $t0, $t1, $0      # Update  F(i-2)
    addu  $t1, $t4, $0      # Update F(i-1)
    addi  $t2, $t2, 1       # i++
cond:
    slt   $t3, $t2, $a0     # i < N 
    bne   $t3, $zero, loop  

    # End example

    ori   $v0, $zero, 1
    addu  $a0, $t1, $zero
    syscall


    # Exit program
exit:  
    li $v0, 10
    syscall
