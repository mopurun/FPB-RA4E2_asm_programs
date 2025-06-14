
// 
.section .text
.syntax unified
.cpu cortex-m33
//.thumb



.equ GPIOD_BASE, 0x40080040  // p284
.equ GPIOD_ODR, 0x0        // p286



.global _start
.type _start, %function

//start 0x08000000
    .word   0x20000630 //p71
    .word   _start
    .word   _start
    .word   _start

.org 0x200
_start:


loop:

    bl wait

    ldr r0, =GPIOD_BASE
    ldr r1, =0x00C00060   
    str r1, [r0, #GPIOD_ODR]

    bl wait

    ldr r0, =GPIOD_BASE
    ldr r1, =0x00C00080    
    str r1, [r0, #GPIOD_ODR]


    b loop

wait:
    mov r3, #0
wait1:
    mov r2, #0 
wait2:

    add r2, r2, #1
    cmp r2, #1000
    bne wait2
    add r3, r3, #1    
    cmp r3, #100
    bne wait1

    bx lr



