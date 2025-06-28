.data 
   num1: .asciiz "Enter first Number: "
   num2: .asciiz "Enter second Number: "
   prompt: .asciiz "Enter operation : "
   newline: .asciiz "\n"

.text
  while:
   # operator
   li $v0, 4
   la $a0, prompt
   syscall

   li $v0, 12
   syscall
   move $t2, $v0 
   
   li $v0, 4
   la $a0, newline
   syscall
   
   li $t3,113
   beq $t2,$t3,EXIT
   
   
   # num1
   li $v0, 4
   la $a0, num1
   syscall            

   li $v0, 5
   syscall 
   move $t0, $v0
   
   # num2
   li $v0, 4
   la $a0, num2
   syscall            

   li $v0, 5
   syscall 
   move $t1, $v0
 

   # check operator
   li $t3, 43       
   beq $t2, $t3, ADD

   li $t3, 45      
   beq $t2, $t3, SUB

   li $t3, 42       
   beq $t2, $t3, MUL

   li $t3, 47       
   beq $t2, $t3, DIV
   

   # invalid operator
   li $v0, 10
   syscall

ADD:
   add $s0, $t0, $t1
   j PRINT_RESULT

SUB:
   sub $s0, $t0, $t1
   j PRINT_RESULT

MUL:
   mul $s0, $t0, $t1
   j PRINT_RESULT

DIV:
   beq $t1, $zero, EXIT       
   div $t0, $t1
   mflo $s0
   j PRINT_RESULT

PRINT_RESULT:
   li $v0, 1
   move $a0, $s0
   syscall
   
   li $v0, 4
   la $a0, newline
   syscall
  
   j while

EXIT:
   li $v0, 10
   syscall
