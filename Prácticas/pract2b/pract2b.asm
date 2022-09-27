/*-----------------------------------------------------------------
**
**  Fichero:
**    pract2b.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Ordena de mayor a menor un vector de enteros positivos
**
**  Notas de diseño:
**
**---------------------------------------------------------------*/



.global start

.EQU 	N, 8
.EQU 	M, 2

.data
A: 		.word 7,3,25,4,75,2,1,1

.bss
B: 		.space N*4
max: 	.space 4
ind: 	.space 4
C: 		.space N*4
P: 		.space N*4

.text
start:
		mov r9, #0
		mov r12, #0
		ldr r0,=A
		ldr r1,= max
		ldr r2,= ind
		str r12,[r2]
		ldr r3,= B
		ldr r11,=C
		ldr r8,=P

		mov r5, #0	@j
for1:
		cmp r5, #N
		bge fin_for1
		mov r6, #0
		mov r4, #0 @i
		str r6, [r1]
for2:
		cmp r4,#N
		bge fin_for2
if:
		ldr r7,[r0,r4,lsl#2]
		cmp r7, r6
		ble else
		mov r6, r7
		str r6,[r1]
		mov r12, r4
		str r12, [r2]
else:
		add r4, r4,#1
		b for2
fin_for2:
		str r6,[r3,r5, lsl#2]
		mov r13, #N
		sub r13, r13, #1
		sub r13, r13, r5
		str r6, [r11, r13,lsl#2]
		mov r13, #0
		str r13,[r0, r12,lsl#2]
		add r5, r5, #1
		b for1
fin_for1:
mov r11,#0 @k
cmp r11, #N
bge fin_for3
ldr r12, [r3, r11, lsl#2]

while:
		cmp r12, #M
		blt fin_while
		sub r12,r12,#M
		b while

fin_while:
cmp r12, #0
bgt impar
str r8, [r3, r11, lsl#2]
b fin_for1
impar:
str r8, [r9]

fin_for3:
		b .
		.end
