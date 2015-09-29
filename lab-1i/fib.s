	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	push {r4, r5,r6,r7,lr}
	
	mov r4 ,#0	@ R4 = 0
	mov r5 ,#1	@ R5 = 1
	

	subs r6, r0 ,#1	
	bgt  .Loop	

	pop {r4, r5, r6,r7,pc}		@EPILOG

	@ END CODE MODIFICATION
.Loop:
	add r7, r4, r5	
	mov r4, r5	
	mov r5, r7	
	
	subs r6 , r6 , #1	
	bgt  .Loop		
	
	mov r0, r7 		

	pop {r4, r5,r6,r7, pc}	@ EPILOG

	.size fibonacci, .-fibonacci
	.end