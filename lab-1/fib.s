	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	push {r3, r4, r5, lr};
        subs r4, r0, #0;
        ble .L3;
      
        cmp r4, #1;
        beq .L4;

        add r0, r4, #4294967295;
        bl fibonacci;

        mov r5, r0;
        sub r0, r4, #2;
        bl fibonacci;

        adds r0, r5, r0;
        pop {r3, r4, r5, pc};        

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
