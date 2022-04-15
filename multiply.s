.text
.global _start
_start:
	MOV r0, #5
	MOV r1, #3
LOOP: 
      CMP r0, r1
      ADD r0, r0, r0
      SUB R1, R1, #1
      BEQ EXIT			
      B LOOP
	
EXIT: MOV r0,#0
      MOV r8,#93
      SVC #0

