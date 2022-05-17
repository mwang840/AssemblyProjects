.global _start
.text
.data
	FILENAME: .asciz "/dev/fb1"
	FD: .word 0
	FB: .word 0
.global openfb
.global closefb
.global getColor
.global setPixel
.text

_start:	
	#open frame buffer 1 
	mov r0,#1
	bl openfb
	cmp r0,#0
	blt _start_exit

	#gets the color purple and store it in r6
	mov r8, r0
	mov r0, #27
	mov r1, #20
	mov r2, #27
	bl getColor
	mov r3, #0
	mov r4, #0

	

LEFTLOOP: ADD r3,r3, #1
	#set each pixel in one row only the y val is changing for the first part of the M
	mov r0, #0
	mov r1, r3
	mov r2, r6
	bl setPixel
	bgt LEFTLOOP
	
	#set pixel 1,1 to be purple
	mov r2,r6
	mov r0,#1
	mov r1,#1
	bl setPixel
	#set pixel 2, 2 to be purple
	mov r2,r6
	mov r0,#2
	mov r1,#2
	bl setPixel
	#set pixel 3, 3 to be purple
	mov r2,r6
	mov r0,#3
	mov r1,#3
	bl setPixel
	#set pixel 4, 4 to be purple
	mov r2,r6
	mov r0,#4
	mov r1,#4
	bl setPixel


RIGHTLOOP: ADD r4,r4, #1
	#set each pixel in one row only the y val is changing for the second part of the M
	mov r0, #7
	mov r1, r4
	mov r2, r6
	bl setPixel
	bgt RIGHTLOOP
	
	bl closefb

_start_exit:
    mov r7,#1
	svc #0
