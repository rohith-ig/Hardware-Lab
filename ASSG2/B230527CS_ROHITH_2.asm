.data
	out1 : .asciiz "Enter Number : "
	out2 : .asciiz "The factorial of " 
	out3 : .asciiz " is : "
	out4 : .asciiz "Enter a positive value!\n"
	out5 : .asciiz "\n"
	num :  .word 0
	
.text 
	.globl main
	main :
		li $v0,4
		la $a0,out1
		syscall
		
		li $v0,5
		syscall

		move $s0,$v0
		sw $s0,num
		
		beq $s0,$zero,zero
		blt $s0,$zero,end2
		
		li $s1,1
		
		while :
			ble $s0,0,exit
			mul $s1,$s1,$s0
			subi $s0,$s0,1
			j while
		exit :
			li $v0,4
			la $a0,out2
			syscall
			
			li $v0,1
			lw $a0,num
			syscall
			
			li $v0,4
			la $a0,out3
			syscall
			
			li $v0,1
			move $a0,$s1
			syscall
			
			li $v0,4
			la $a0,out5
			syscall
			
			li $v0,10
			syscall
		end2 :
			li $v0,4
			la $a0,out4
			syscall
		
			j main
			
		zero :
			li $v0,4
			la $a0,out2
			syscall
			
			li $v0,1
			lw $a0,num
			syscall
			
			li $v0,4
			la $a0,out3
			syscall
			
			li $v0,1
			li $a0,1
			syscall
			
			li $v0,4
			la $a0,out5
			syscall
			
			li $v0,10
			syscall
		
		
		