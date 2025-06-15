.data
.text
.globl main
main:

# Start program
li   $t0, 0x0000FFFF
li   $t1, 0x80000000
li   $t2, 0x00000001

lui $t0, 0xFFFF
slt $t1, $t1, $t0
bne   $t1, $0, SOMEPLACE
addiu $t2, $t1, -1
j EXIT
SOMEPLACE:
add $t2, $t2, $t1

EXIT:
# Exit program
li $v0, 10
syscall