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

        #initializes outer loop
  LOOP: mov r1, #0
        cmp r1, #8
        ADD r1, #1
  
        #initializes inner loop
  LOOP: mov r2, #0
        cmp r2, #8
        b1 setPixel
        ADD r2, #1

        b1 closefb

