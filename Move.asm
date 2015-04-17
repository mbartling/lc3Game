.ORIG x3800

; Inputs: R0 contains direction. 0, 1, 2, 3 mean W, N, E, S respectively
; stack contains current coordinates, x on top, then y
Move
	; Save registers
	ST R0, SAVE_R0
	ST R1, SAVE_R1
	ST R2, SAVE_R2
	ST R3, SAVE_R3
	ST R7, SAVE_R7

	LD R3, UpdateElement_ptr
	; get current x
	LDR R1, R6, #1
	; get current y
	LDR R2, R6, #2

	ADD R0, R0, #0
	BRz GO_WEST
	ADD R0, R0, #-1
	BRz GO_NORTH
	ADD R0, R0, #-1
	BRz GO_EAST
	ADD R0, R0, #-1
	BRz GO_SOUTH
	; Invalid input in R0
	; If we assume input will always be valid, we can clear the previous tile
	; earlier
	RET
GO_WEST
	; clear previous player tile
	LD R0, EMPTY_TILE
	JSRR R3
	ADD R1, R1, #-1
	STR R1, R6, #1
	STR R2, R6, #2
	BR GO_SHARED

GO_NORTH
	; clear previous player tile
	LD R0, EMPTY_TILE
	JSRR R3
	ADD R2, R2, #-1
	STR R2, R6, #2
	STR R1, R6, #1
	BR GO_SHARED

GO_EAST
	; clear previous player tile
	LD R0, EMPTY_TILE
	JSRR R3
	ADD R1, R1, #1
	STR R1, R6, #1
	STR R2, R6, #2
	BR GO_SHARED

GO_SOUTH
	; clear previous player tile
	LD R0, EMPTY_TILE
	JSRR R3
	ADD R2, R2, #1
	STR R2, R6, #2
	STR R1, R6, #1
	BR GO_SHARED

GO_SHARED
	; update player location
	LD R0, PLAYER_TILE
	JSRR R3
	; Restore registers
	LD R0, SAVE_R0
	LD R1, SAVE_R1
	LD R2, SAVE_R2
	LD R3, SAVE_R3
	LD R7, SAVE_R7
	; pop, pop
	;ADD R6, R6, #2
	RET

UpdateElement_ptr .FILL x3730
PLAYER_TILE .FILL x70 ;'p'
EMPTY_TILE .FILL x2E ;'.'
SAVE_R0 .FILL x0000
SAVE_R1 .FILL x0000
SAVE_R2 .FILL x0000
SAVE_R3 .FILL x0000
SAVE_R7 .FILL x0000

.END
