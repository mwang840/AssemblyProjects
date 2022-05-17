.global _start
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
	mov r0,#1
	bl openfb
	cmp r0,#0
	blt _start_exit
#Gets the color red and store it in r6
	mov r0, #31
	mov r1, #0
	mov r2, #0
	bl getColor
	mov r6, r0
	mov r10, #8
	mov r11, #8

#Loops and puts color red to make the x on the screen (nested via subtracting)
OUTERLOOP: sub r10, r10, #1 
		   sub r11, r11, #1
		   mov r0, r10
		   mov r1, r11
		   mov r2, r6
		   bl setPixel
		   cmp r10, #0
		   bgt OUTERLOOP
		
		   mov r10, #8
		   mov r11, #0

_start_exit:
	#clean exit
    mov r7,#1
	svc #0