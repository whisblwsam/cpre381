.data
.text
.globl main
main:

# Start region of interest
# The following program demonstrates temporal data locality by repeatedly
# accessing the default address stored in $gp. Note that no instruction is
# executed twice so there is no temporal locality in instruction fetch.
# Labels count the dynamically executed instructions.

I1:
lui   $t0, 0xFAE1
I2:
sw    $t0, 0($gp)
I3:
lw    $t1, 0($gp)
I4:
sw    $t1, 0($gp)
I5:
lw    $t2, 0($gp)
I6:
sw    $t2, 0($gp)
I7:
lw    $t3, 0($gp)
I8:
sw    $t3, 0($gp)
I9:
lw    $t4, 0($gp)
I10:
sw    $t4, 0($gp)
L11:
lw    $t5, 0($gp)
I12:
sw    $t5, 0($gp)
L13:
lw    $t6, 0($gp)
I14:
sw    $t6, 0($gp)
L15:
lw    $t7, 0($gp)
I16:
sw    $t7, 0($gp)
L17:
lw    $t8, 0($gp)
I18:
sw    $t8, 0($gp)
L19:
lw    $t9, 0($gp)
I20:
sw    $t9, 0($gp)

# Exit region of interest

exit:
addi $v0, $zero, 10
syscall
