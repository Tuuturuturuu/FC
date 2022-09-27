/*-----------------------------------------------------------------
**
**  Fichero:
**    pract2a.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Automática
**    Facultad de Informática. Universidad Complutense de Madrid
**
**  Propósito:
**    Busca el valor máximo de un vector de enteros positivos
**
**  Notas de diseño:
**
**---------------------------------------------------------------*/

.global start

.EQU 	N, 8

.data
A: 		.word 7,3,25,4,75,2,1,1
.bss
max: 	.space 4

.text
start:
		mov r0, #0
		ldr r1,=max		@ Leo la dir. de max
		str r0,[r1]		@ Escribo 0 en max
		ldr r2,= A
		mov r3, #0		@i=0
for:
		cmp r3,#N @comparo i con 8 (for i< 8)
		bge fin @si es 8 se acaba
		ldr r4,[r2,r3,lsl#2] @ meto A[i] en r4(r4 sera max)
		cmp r4, r1 @comparo A[i] con el max actual (0)
		add r3,r3,#1 @i++
		ble for @si A[i] es menor q el max actual sigue el for
		mov  r0, r4
	    str r4, [r1]@si A[i] es mayor igual q el max, se guarda A[i] como el max nuevo
		b for
fin:
		b .
.end
