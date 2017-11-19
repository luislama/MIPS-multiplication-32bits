# Taller 03
# Nombre: Luis Lama Aguirre
# Fecha (yyyy/mm/dd): 2017/11/16

        .data
									#declaracion de variables
multiplicando: .word 17321
multiplicador: .word 3455
									#strings a imprimir
saludo: .asciiz "Bienvenido!!"
instr0: .asciiz "\nMultiplicar "
instr1: .asciiz " por "
instr2: .asciiz " da como resultado: "

		.text
		.globl main
main:
        lw $t0, multiplicador
        lw $t1, multiplicando
        li $t2, 0
        
        
multiplicar:
		beq  $t0, $zero, end
		andi $t3, $t0, 1
		
		beq $t3, $zero, op2
op1:
        add $t2, $t2, $t1
op2:
        sll $t1, $t1, 1
		srl $t0, $t0, 1
        b multiplicar
		

									#A partir de aqui solo estan los prints
end:
		#"Bienvenido!!"
        li $v0, 4
		la $a0, saludo
		syscall

	    #"\nMultiplicar "
        li $v0, 4
		la $a0, instr0
		syscall
		#"multiplicando(int)"
        li $v0, 1
		lw $t1, multiplicando
		move $a0, $t1
		syscall				
		#" por "
        li $v0, 4
		la $a0, instr1
		syscall
		#"multiplicador(int)"
        li $v0, 1
		lw $t3, multiplicador
		move $a0, $t3
		syscall
		#" da como resultado: "
        li $v0, 4
		la $a0, instr2
		syscall
		
        #"producto(int)"
        li $v0, 1
		move $a0, $t2
		syscall
		
									#sale del programa
		li $v0, 10
        syscall