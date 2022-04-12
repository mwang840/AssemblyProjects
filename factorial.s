.text
.global _start
_start:
/* Variable Initialization */
	MOV r0, #4

	MOV r1, r0
LOOP: 	SUB r0,r0,#1
	CMP r0, #0
	BEQ EXIT
	MUL r2,r1,r0
	MOV r1,r2
	B LOOP
EXIT:	MOV r0,r1
	MOV r8, #93
	SVC #0
	

