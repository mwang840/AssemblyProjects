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
	cmp r3, #0
	blt _start_exit

	#gets the color purple and store it in r6
	mov r8, r0
	mov r0, #27
	mov r1, #20
	mov r2, #27

LEFTLOOP: ADD r3, #1
	#set each pixel in one row only the y val is changing for the first part of the M
	mov r2, r6
	mov r0, #0
	mov r1, r3
	bl setPixel
	bgt LEFTLOOP
	
	#set pixel 1,2 to be purple



RIGHTLOOP: ADD r3, #1
	#set each pixel in one row only the y val is changing for the second part of the M
	mov r2, r6
	mov r0, #7
	mov r1, r3
	bl setPixel
	bgt RIGHTLOOP
	
	bl closefb

_start_exit:
    mov r7,#1
	svc #0
