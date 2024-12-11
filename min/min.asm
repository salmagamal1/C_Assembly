.data
    #nums: .word 10, 31, 5, 7, 11, 3, 8, 40, 12, 4
    nums: .word 11, 2, 3, 7, 5, 10, 9, 22, 6, 1
    size: .word 10
    min_num: .word 0
    message: .asciiz "Min element is: "
    
.text
    main:
    la $t0, nums #base address of nums
    lw $t1, size
    lw $t2, 0($t0)
    sw $t2, min_num
    li $t3, 1 # t3 --> i
    
    loop:
    	bge $t3, $t1, end
    	sll $t4, $t3, 2 # mult by 4 (shift 4 bytes)
    	add $t5, $t0, $t4 # index of next element
    	
    	lw $t6, 0($t5) # load next number in t6
    	
    	blt $t6, $t2, new_min
    	
    	addi $t3, $t3, 1
    	j loop
    	
    new_min:
    	move $t2, $t6
    	sw $t2, min_num
    	j loop
    
    end:
    	li $v0, 4
    	la $a0, message
    	syscall
    	
    	li $v0, 1
    	lw $a0, min_num
    	syscall
    	
    	li   $v0, 10
    	syscall