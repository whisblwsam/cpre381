.data
.text
.globl main
main:

# Start region of interest
# The following program fetches instructions at adjacent memory locations
# (i.e., PC+4) for all 20 instructions. Therefore, there is a large amount of
# spatial locality. While having the program make no data memory accesses
# would be one way to ensure there is no spatial locality in data, this program
# demonstrates that even with data memory accesses it is possible to have no
# spatial locality. Here it accesses data in the stack, in the static memory
# and even in the text section. There is not temporal locality here.
# The labels count the number of MIPS ISA instructions

I1:
lui   $t0, 0x321D              # putting an arbitrary value into $t0
I2:
ori   $t0, $t0, 0x0FFC           

I3:
addi  $sp, $sp, -4             # allocate space on the stack
I4:
sw    $t0, 0($sp)              # write value to the address pointed to by sp


I5:
xori  $t1, $t0, 0xDEAD
I6:
addu  $t1, $t0, $t1
I7:
sll   $t1, $t1, 31
I8:
sra   $t0, $t1, 31
I9:
sw    $t0, 0($gp)              # write the value to the address pointed to by gp
                               # (in the middle of the data segment)
I10:
sw    $t0, -32768($gp)         # write the same value to the beginning of data 
                               # segment which is not particularly spatially 
                               # adjacent to $gp

I11:
addu  $t1, $t1, $t1            
I12:
nor   $t1, $t1, $t1
I13:
lui   $t0, 0x1002              # load upper address for middle of data segment not
                               # reachable directly using the gp + offset
I14:
ori   $t0, $t0, 0xA2D2         # pick an arbitrary address in the data segment
I15:
sw    $t1, -2($t0)             # write value to the arbitrary data segment address

I16:
slt   $t1, $t1, $t0
I17:
sll   $t1, $t1, 5
I18:
addi  $t1, $t1, -1
I19:
lui   $t0, 0x1004              # load upper address for data segment limit
I20:
sw    $t1, -4($t0)             # write value to the last address in QtSpim's
                               # default data segment

# Exit region of interest

exit:
addi $v0, $zero, 10
syscall
