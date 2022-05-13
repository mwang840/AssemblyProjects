.global_start
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
  OUTERLOOP: mov r1, #0
        cmp r1, #8
        ADD r1, #1
  
        #initializes inner loop
  INNERLOOP: mov r2, #0
        cmp r2, #8
        mov r1, r1
        mov r2, r2
        bl getColor
        ADD r2, #1

        bl closefb
_start_exit:
    mov r7,#1
	svc #0
