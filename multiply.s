.text
.global _start
_start:
	MOV r0, #1
	MOV r1, r0
LOOP: 
      CMP r0, #0
      B LOOP
      ADD r1, r1, r0
      ADD R0, R0, #1		

EXIT: MOV r0,#0
      MOV r8,#93
      SVC #0

