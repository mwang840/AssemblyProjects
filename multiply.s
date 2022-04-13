.text
.global_start
_start:
	MOV r0, #1
	MOV r1, r0
LOOP: ADD r0,r0, r1
      CMP r0, #0
      B LOOP


EXIT: MOV r0,#0
	MOV r8,#93
	SVC #0

