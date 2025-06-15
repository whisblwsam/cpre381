.data 
    a: .word 0, 1, 2, 3, 4, 100, 6, 7, 8, 9 
.text 

la $s0, a    # $s0 = a* 
addi $s1, $0, 0  # $s1 = max, this is an output initalize to zero 
addi $s2, $0, 0  # $s2 = i, temporary variable initalize to zero 
addi $s3, $0, 10 # $s3 = N, this should match the length of "a" in data section 

lw $s1, 0($s0) # int max = a[0] 

addi $s2, $0, 1 # i = 1; portion of for loop 
j lp_check # Begin for loop, always check condition first before executing body 

lp: 
    addi $s2, $s2, 1 # i++, we can skip the first value since we initalize "max" to the first value of the array 
    sll $t0, $s2, 2 # convert array offset to byte offset 
    add $t0, $s0, $t0 # compute address of a[i] 

    lw $t1, 0($t0) # get value of array at a[i] 

    sgt $t2, $t1, $s1    # a[i] > max 
    beq $t2, $0, lp_check # : max; 
    add $s1, $0, $t1     # ? a[i] 

lp_check: 
    blt $s2, $s3, lp # for (i=1; i < N; i++) 

# end of program 