.data
str1: .asciiz "Please enter a number:\n"
.align 2
vals: .word 25 1 4 10 381 42 100 60 0 12 25
.text
.globl main

main:
# Start program
addi $s1, $zero, 0 # s1 is ouput value
inputs:
# Request some user input:
li $v0, 4
la $a0, str1
syscall
# Read some user input:
li $v0, 5
syscall

sll  $s0, $v0, 5

# Request some user input:
li $v0, 4
la $a0, str1
syscall
# Read some user input:
li $v0, 5
syscall


sll $v0, $v0, 2
# Usually you would let the assembler to the heavy lifting by using: la $s1, vals
lui $s1, 0x1001
addiu $s1, $s1, 24
addu $s1, $s1, $v0
lw $s1, 0($s1)
addu $s1, $s0, $s1

# Print output
li $v0, 1
addi $a0, $s1, 0
syscall
# Exit program
li $v0, 10
syscall

