.data 
 
character: .byte ' ' 
dst:	   .asciiz "CprE381 is lots of fun!" 
 
.text 
 
la $a0, dst 
la $t0, character 
lb $a1, 0($t0) 
 
addi $t0, $0, 0 # int i = 0; 
lb $s0, 0($a0) # dst[0] 
addi $v0, $0, -1 # default return to -1 for error (character doesn't exist in string) 
 
#base case 

bne $s0, $a1, lp_cond 
    add $v0, $a0, $0 # if first instance matches then use this then continue checking 
    j lp_cond 
 
lp: # while( dst[i] != 0 ) 
    addi $t0, $t0, 1 # i++ 
    add $t2, $t0, $a0 # address of dst[i] 
    lb $s0, 0($t2) # dst[i] 
    bne $s0, $a1, lp_cond # if( dst[i] = character ){ 
    add $v0, $0, $t2 # last_occurence = *dst[i]; 
 
lp_cond: 
    bne $s0, $0, lp 