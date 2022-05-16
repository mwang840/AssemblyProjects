.global _start
.text
_start:	
	#open frame buffer 1 
	mov r0,#1
	bl openfb
	cmp r0,#0
	blt _start_exit