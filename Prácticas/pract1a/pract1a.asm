/*-----------------------------------------------------------------
**
**  Fichero:
**    pract1b.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Divide 2 números mediante el algoritmo de restas parciales
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
V:  .space 40

.text
start:
		LDR R0, =A
		LDR R1, =B
		LDR R5, =C
		LDR R4, =V
		LDR R0, [R0] @A
		LDR R1, [R1] @B
		MOV R2, #0
while:
		CMP R0, R1
		BLT FIN_BUCLE
		SUB R0,R0,R1
		CMP R2, #10
		BGE SALTO
		STR R0, [R4, R2, LSL #2]
SALTO:
		ADD R2,R2,#1
		b while

FIN_BUCLE:
		STR R2,[R5]
		CMP R2, #10
		STR R1, [R4, R2, LSL #2]

FIN:

B .
	.end
