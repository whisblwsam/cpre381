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

# Load base vals array address
# Usually you would let the assembler to the heavy lifting by using: la $s1, vals
# which the assembly would turn into something like the following give that it
# knows the memory mapping and can easily calculate the immediates.
lui $s1, 0x1001
addiu $s1, $s1, 24

# Load first user-inputted vals array element
sll  $v0, $v0, 2
addu $s0, $s1, $v0
lw $s0, 0($s0)

# Request some user input:
li $v0, 4
la $a0, str1
syscall
# Read some user input:
li $v0, 5
syscall

# Load second user-inputted vals array element
sll $v0, $v0, 2
addu $s2, $s1, $v0
lw $s2, 0($s2)

# Average the two loaded values by adding and div by 2 (i.e., shift right arithmetic)
# Compute the min via MIN(x,y)=(x+y-abs(x-y))/2
add $t0, $s0, $s2
sub $t1, $s0, $s2
abs $t1, $t1
sub $s2, $t0, $t1 

sra $s0, $s2, 1

# Request some user input:
li $v0, 4
la $a0, str1
syscall
# Read some user input:
li $v0, 5
syscall

# Store out the maxed value to vals at third user-inputted index
sll $v0, $v0, 2
addu $s1, $s1, $v0
sw $s0, 0($s1) # check in MARS that the appropriate memory location was updated correctly

# Print output as a double check
li $v0, 1
addi $a0, $s0, 0
syscall
# Exit program
li $v0, 10
syscall
