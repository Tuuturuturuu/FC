/*-----------------------------------------------------------------
**
**  Fichero:
**    pract1a.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Compara 2 números y se queda con el mayor
**
**  Notas de diseño:
**
**---------------------------------------------------------------*/

.global start
.data
A: 		.word 20
B: 		.word 4

.bss
C: 	.space 4
R:  .space 4

.text
start:
		LDR R0, =A
		LDR R1, =B
		LDR R5, =C
		LDR R4, =R
		LDR R0, [R0] @A
		LDR R1, [R1] @B
		MOV R2, #0
while:
		CMP R0, R1
		BLT FIN
		SUB R0,R0,R1
		ADD R2,R2,#1
		b while

FIN:
STR R2,[R5]
STR R0,[R4]
B .
	.end

