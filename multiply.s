.text
.global_start
_start:
	MOV r0, #1
	MOV r1, r0



EXIT: MOV r0,#0
	MOV r8,#93
	SVC #0

