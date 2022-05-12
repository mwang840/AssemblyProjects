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
        #open frame buffer 1
        mov r0,#1
        mov r1, #0
        mov r2, #0
        bl openfb
        cmp r0,#0
        blt _start_exit

        #initializes outer loop
  OUTERLOOP: ADD r1, #1
        cmp r1, #8
  
        #initializes inner loop
  INNERLOOP: mov r2, #0
        cmp r2, #8
        bl setPixel
        ADD r2, #1

        bl closefb
_start_exit:
    mov r7,#1
	svc #0

