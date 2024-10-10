.data 
	str : .space 40
	ask : .asciiz "Enter binary representation : "
	out : .asciiz "Binary representation :" 
.text	
	li $v0,4
	la $a0,ask
	syscall
	
	li $v0,8
	la $a0,str
	li $a1,37
	syscall
	
	li $t0,0
	li $t1,0
	while :
		lb $t2,str($t0)
		beq $t2,10,end
		sub $t2,$t2,'0'
		sll $t1,$t1,1
		addu $t1,$t1,$t2
		addi $t0,$t0,1
		j while
	end :
		li $v0,4
		la $a0,out
		syscall

		
		li $v0,1
		move $a0,$t1
		syscall
		
		li $v0,10
		syscall
	
	
