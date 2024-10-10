.data
	ask : .asciiz "Enter string : "
	inp : .space 100
	nl : .asciiz "\n"
	ee : .asciiz "End"

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
			lb $t1,	inp($t0)
			beq $t1,10,end
			bge $t1,'A',small
			back : 
			addi $t0,$t0,1
			j loop
		
		small :
			ble $t1,'Z',capital
			blt $t1,'a',back
			bgt $t1,'z',back
			addi $t1,$t1,-32
			sb $t1,inp($t0)
			j back
			
		capital :
			addi $t1,$t1,32
			sb $t1,inp($t0)
			j back

		end :	
			li $v0,4
			la $a0,inp
			syscall 
			
			li $v0,10
			syscall
			
