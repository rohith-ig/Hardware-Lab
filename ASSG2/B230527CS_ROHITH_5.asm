.data
	ask1 : .asciiz "Enter number 1 : "
	ask2 : .asciiz "Enter number 2 :"
	p : .asciiz "Sum is prime"
	np : .asciiz "Sum is not prime"
	
.text
	.globl main
	main :
		li $v0,4
		la $a0,ask1
		syscall
	
		li $v0,5
		syscall
		
		move $t0,$v0
		
		li $v0,4
		la $a0,ask2
		syscall
	
		li $v0,5
		syscall
		
		move $t1,$v0
		
		add $t2,$t0,$t1
		
		li $t0,2
		
		loop :
			bge $t0,$t2,prime
			div $t2,$t0
			mfhi $t3
			beq $t3,$zero,notprime
			addi $t0,$t0,1
			j loop
		prime :
			li $v0,4
			la $a0,p
			syscall
			
			li $v0,10
			syscall
		notprime :
			li $v0,4
			la $a0,np
			syscall
			
			li $v0,10
			syscall

				
			
