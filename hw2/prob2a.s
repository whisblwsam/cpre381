.data
.text
.globl main
main:
# Setup some data
lui $t2, 0xF0F0        # load address of N (0x10000000)
ori $t2, $t2, 0xE1E1   # load lower value of c -- &c[0]

# Start answer portion
nor $t1, $t2, $t2
# End answer portion --> look at $t1 and $t2 to verify correctness

# Exit program
addi $v0, $zero, 10
syscall
