#----------------------------
# Problem 3
# Salma Gamal Kamel 20221073
#----------------------------
.data
arr1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
len1: .word 10
sum1: .word 0
avg1: .float 0.0
str1: .asciiz "Average is:"
endLine: .asciiz "\n"

arr2: .word 7, 2, 5, 11, 4, 6, 1, 1, 8, 3
len2: .word 10
sum2: .word 0
avg2: .float 0.0
str2: .asciiz "Average is:"

.text 
main:
 # Sum and average for arr1
  la $t0, arr1  # Base address
  li $t1, 0     # i = 0
  lw $t2, len1  # $t2 = length
  li $t3, 0     # sum = 0
  
 sumloop:
      lw  $t4,($t0) # $t4 = arr1[i]
      add $t3, $t3,$t4 # sum = sum + arr1[i]
      
      add $t1,$t1,1  # i = i +1
      add $t0,$t0,4  # updating the array address
      blt $t1,$t2, sumloop # if i<len1, then loop again.
    sw $t3,sum1 
    
 # Calculate the average for arr1
 lw $t0, sum1         # Load sum
 lw $t1, len1         # Load length
 div $t0, $t1         # Integer division
 mflo $t2             # Quotient (integer part)
 mfhi $t3             # Remainder (integer part)

 # Convert quotient to float
 mtc1 $t2, $f0        # Move quotient to $f0
 cvt.s.w $f0, $f0     # Convert $f0 to float

 # Convert remainder to float
 mtc1 $t3, $f1        # Move remainder to $f1
 cvt.s.w $f1, $f1     # Convert $f1 to float

 # Convert divisor (length) to float
 mtc1 $t1, $f2        # Move length to $f2
 cvt.s.w $f2, $f2     # Convert $f2 to float

 # Calculate fractional part of the remainder
 div.s $f3, $f1, $f2  # $f3 = remainder / length

 # Combine integer and fractional parts
 add.s $f4, $f0, $f3  # $f4 = quotient + (remainder / length)

 # Store the floating-point average
 swc1 $f4, avg1

 # Print the floating-point average
 li $v0, 4
 la $a0, str1
 syscall

 li $v0, 2
 mov.s $f12, $f4
 syscall

 # Print newline
 li $v0, 4
 la $a0, endLine
 syscall

 # Repeat the process for arr2

 # Sum and average for arr2
  la $t0, arr2  # Base address
  li $t1, 0     # i = 0
  lw $t2, len2  # $t2 = length
  li $t3, 0     # sum = 0
  
 sumloop2:
      lw  $t4,($t0) # $t4 = arr2[i]
      add $t3, $t3,$t4 # sum = sum + arr2[i]
      
      add $t1,$t1,1  # i = i +1
      add $t0,$t0,4  # updating the array address
      blt $t1,$t2, sumloop2 # if i<len2, then loop again.
    sw $t3,sum2 
    
 # Calculate the average for arr2
 lw $t0, sum2         # Load sum
 lw $t1, len2         # Load length
 div $t0, $t1         # Integer division
 mflo $t2             # Quotient (integer part)
 mfhi $t3             # Remainder (integer part)

 # Convert quotient to float
 mtc1 $t2, $f0        # Move quotient to $f0
 cvt.s.w $f0, $f0     # Convert $f0 to float

 # Convert remainder to float
 mtc1 $t3, $f1        # Move remainder to $f1
 cvt.s.w $f1, $f1     # Convert $f1 to float

 # Convert divisor (length) to float
 mtc1 $t1, $f2        # Move length to $f2
 cvt.s.w $f2, $f2     # Convert $f2 to float

 # Calculate fractional part of the remainder
 div.s $f3, $f1, $f2  # $f3 = remainder / length

 # Combine integer and fractional parts
 add.s $f4, $f0, $f3  # $f4 = quotient + (remainder / length)

 # Store the floating-point average
 swc1 $f4, avg2

 # Print the floating-point average
 li $v0, 4
 la $a0, str2
 syscall

 li $v0, 2
 mov.s $f12, $f4
 syscall

 # Print newline
 li $v0, 4
 la $a0, endLine
 syscall

 # Exit program
 li $v0, 10
 syscall
