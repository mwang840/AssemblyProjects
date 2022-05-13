.data
	FILENAME: .asciz "/dev/fb1"
	FD: .word 0
	FB: .word 0
	
.global openfb
.global closefb
.global getColor
.global setPixel
.text

#Opens Frame buffer 1
_start:
	mov r0,#1
	bl openfb
	cmp r0,#0
	blt _start_exit
#Gets the color red and store it in r6
	mov r8,r0
	mov r0, #31
	mov r1, #0
	mov r2, #0
	bl getColor
	mov r6, r0