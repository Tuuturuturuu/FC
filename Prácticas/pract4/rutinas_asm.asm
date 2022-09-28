/*	.global rgb2gray

	.equ COEF1, 3483
	.equ COEF2, 11718
	.equ COEF3, 1183

	.text

rgb2gray:
  		ldr r3, =COEF1
  		mul r0, r3, r0
  		ldr r3, =COEF2
  		mla r0, r3, r1, r0
  		ldr r3, =COEF3
  		mla r0, r3, r2, r0
  		mov r0, r0, lsr #14

  		mov pc, lr
*/

.global imagenEspecular
	.global RGB2GrayMatrix
  	.equ	N, 128
  	.equ 	M, 128
  	.equ    D, 64

  	.text

 RGB2GrayMatrix:
 		push {r4-r7, sp, lr}
 		add fp, sp, #20
 		mov r4, #0	@i = 0
 		mov r5, #0	@j = 0
 		mov r6, r0
 		mov r7, r1

primer_for:
		cmp r4, #N
		bge fin_for1

 segundo_for:
 		cmp r5, #N
		bge fin_for2

		ldrb r0, [r6]
		add r6, r6, #1
		ldrb r1, [r6]
		add r6, r6, #1
		ldrb r2, [r6]
		add r6, r6, #1

		bl rgb2gray
		strb r0, [r7]
		add r7, r7, #1
		add r5, r5, #1

		b segundo_for

fin_for2:
		add r4, r4, #1 @i++
		mov r5, #0 @j = 0

		b primer_for

fin_for1:
		pop {r4-r7, sp, lr}
		mov pc, lr

imagenEspecular:
		push {r4-r9, fp}
		add fp, sp, #28
		mov r2, #M
		mov r3, #N
		mov r4, #0 @i
for_i:
		cmp r4, #N
		bge fin_for_i
		mov r5, #0 @j
for_j:
		cmp r5, #D
		bge fin_for_j
		sub r6, r2, #1 @M-1
		sub r6, r6, r5 @(M-1)-j
		mul r7, r4, r3 @N*i
		add r7, r7, r6
		ldrb r8, [r0, r7] @imagen invertida
		mul r7, r4, r3 @N*i
		add r7, r7, r5 @(N*i)+j..?
		ldrb r1, [r0, r7]
		strb r8, [r0, r7]
		mul r7, r4, r3 @N*i
		add r7, r7, r6
		strb r1, [r0, r7]
		add r5, r5, #1
		b for_j

fin_for_j:
		add r4, r4, #1 @i++
		b for_i
fin_for_i:
		mov r5, #0
		pop {r4-r9, fp}
		mov pc, lr



