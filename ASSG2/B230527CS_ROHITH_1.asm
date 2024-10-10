.data
	out1 : .asciiz "Enter Number : "
	out2 : .asciiz "Entered number is even"
	out3 : .asciiz "Entered number is odd"
	
.text 
	.globl main
	main :
		li $v0,4
		la $a0,out1
		syscall
		
		li $v0,5
		syscall
		
		move $s0,$v0
		li $s1,2
		div $s0,$s1
		
		mfhi $s1
		
		beq $s1,$zero,even
		
		li $v0,4
		la $a0,out3
		syscall
		
		li $v0,10
		syscall
		
	even :
		li $v0,4
		la $a0,out2
		syscall
		
		li $v0,10
		syscall
		
		