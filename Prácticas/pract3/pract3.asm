.extern _stack
.global start
.EQU N, 8
.data
A:        .word 7,3,25,4,75,2,1,1
.bss
B:         .space N*4
.text

start:
    ldr SP, =_stack
    mov fp, #0        @inicializo fp
    ldr r6, =A        @Dir A
    ldr r7, =B        @Dir B
    mov r8, #0        @i = 0

for:    cmp r8, #N
    bge fin
    mov r0, r6
    mov r1, #N
    bl MAX

    ldr r9, [r6, r0, lsl#2]  @A[ind]
    str r9, [r7, r8, lsl#2]  @B[j] = A[ind]
    mov r9, #0
    str r9, [r6, r0, lsl#2] @A[ind] = 0;
    add r8, r8, #1          @i++
    b for

fin:
    mov r0, r6 @A
    mov r1, #N @N
    mov r2, r7 @B
    bl copia_inv
    b .

MAX:
    push {r4,r5, fp}
    add fp, sp, #8
    mov r2, #0    @j = 0
    mov r3, #0    @ind = 0
    mov r4, #0    @max = 0

for_MAX:
	cmp r2, r1
    bge fin_for
    ldr r5, [r0, r2, lsl#2]

if:
	cmp r5, r4
    ble fin_if
    mov r4, r5
    mov r3, r2

fin_if:
    add r2, r2, #1
    b for_MAX

fin_for:
    mov r0, r3 @se mueve el indice a r0
    pop {r4,r5, fp}
    mov pc, lr

copia_inv:
    push {r4-r6, fp}
    add fp, sp, #12
    mov r3, #0  @j=0
    mov r4, #0 	@aux=0
    sub r4, r1, #1
    mov r5, #0

for_copia_inv:
	cmp r3, r1
    bge fin_for_copia_inv
    sub r5, r4, r3
    ldr r6, [r2, r5, lsl#2]
    str r6, [r0, r3, lsl#2]
    add r3, r3, #1
    b for_copia_inv

fin_for_copia_inv:
    pop {r4-r6, fp}
    mov pc, lr
    .end
