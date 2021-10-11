#include "register.h"

	.global main
	.global _start
	.text
_start:
	ldr r0, =SP_REG
	mov sp, r0

	bl  main

    ldr r1, =EXIT_REG
    mov r0, #1
    strb r0, [r1]

    b .

