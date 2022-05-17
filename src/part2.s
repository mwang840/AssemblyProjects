.global _start
.text
_start:
        #open frame buffer 1
        mov r0,#1
        bl openfb
        cmp r0,#0
        blt _start_exit

        #get the color blue and store it in r6
        mov r0,#0
        mov r1,#0
        mov r2,#31
        bl getColor
        mov r6,r0
        mov r9,#8

L1:     sub r9,r9,#1
        mov r10,#8

L2:     sub r10,r10,#1
        mov r0,r9
        mov r1,r10
        mov r2,r6
        bl setPixel
        cmp r10,#0
        bgt L2
        cmp r9,#0
        bgt L1

        #cleanup the data structures created by openfb and close the framebuffer device
        bl closefb

_start_exit:
        #clean exit
        mov r7,#1
        svc #0