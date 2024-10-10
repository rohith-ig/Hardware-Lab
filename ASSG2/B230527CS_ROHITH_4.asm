.data
	ask : .asciiz "Enter string : "
	inp : .space 100
	nl : .asciiz "\n"
	yes : .asciiz "The given string is a palindrome\n"
	no : .asciiz "The given string is not a palindrome\n"

.text
	.globl main
	main :
		li $v0,4
		la $a0,ask
		syscall
	
		li $v0,8
		la $a0,inp
		li $a1,100
		syscall
		
		li $t0,0
		
		loop :
			lb $t1,inp($t0)
			beq $t1,10,check
			addi $t0,$t0,1
			j loop
		check :
			addi $t0,$t0,-1
			move $t1,$t0
			li $t0,0
                check_loop :
			bge $t0,$t1,p
			lb $t2,inp($t0)
			lb $t3,inp($t1)
			bne $t2,$t3,notp
			addi $t0,$t0,1
			addi $t1,$t1,-1		
			j check_loop
		notp :
			li $v0,4
			la $a0,no
			syscall
			
			li $v0,10
			syscall
			
		p :
			li $v0,4
			la $a0,yes
			syscall
			
			li $v0,10
			syscall
		
				
			
