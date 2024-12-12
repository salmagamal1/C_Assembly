.data 
array: .word 10, 31, 5, 7, 11, 3, 8, 40, 12, 4
size: .word 10
count: .word 0
.text 
.globl main 

main:
    la $t0, array  
    lw $t1, size
    li $t2, 0
    li $t3, 0 #counter
loop:
    beq $t2,$t1, done
    
    lw $t4, 0($t0)
    div $t4, $t4, 2
    mfhi $t5
    bne $t5,$zero, counter
    
    addi $t3, $t3,1 
    
counter:
    addi $t0, $t0, 4
    addi $t2,$t2,1
    j loop

done:
    li $v0, 1
    move $a0, $t3
    syscall
    
    li $v0, 10
    syscall
    
