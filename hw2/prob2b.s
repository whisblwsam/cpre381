.data
.text
.globl main
main:

addiu $at, $zero, sign_ext_imm # load value for use with sllv
sllv $t0, $t1, $at  # shift left by signed value

subu $at, $zero, $at # invert immediate
addiu $at, $at, 32  # Compute length to shift right

srlv $at, $t1, $at # shift right
or $t0, $t0, $at # combine # Combine upper and lower sections

# Exit program
addi $v0, $zero, 10
syscall
