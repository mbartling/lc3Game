.ORIG x3000
; Dedicate R6 == Stack pointer
LEA R6, SP
LDR R6, R6, #0

AND R1, R1, #0
AND R2, R2, #0
ADD R1, R1, #2
ADD R2, R2, #3

;Main(){
GAME_LOOP

  LEA R5, DRAW
  LDR R5, R5, #0 ;Load pointer to Draw()
  LEA R3, MOVE
  LDR R3, R3, #0 ;Load pointer to Move()

;----------------------------------------------
; First Call to UserInput()
;----------------------------------------------

  LD R4, UserInput
  
  JSRR R4

;----------------------------------------------
; Second Call to Draw()
;----------------------------------------------
  ;JSRR R5        ;draw()

  STR R1, R6, #0    ;Push number 5 to stack
  STR R2, R6, #-1   ;Push number 5 to stack

  ADD R6, R6, #-2   ;sp = sp -2 ; move stack pointer to new base
  JSRR R3
  ADD R6, R6, #2
  LDR R1, R6, #0
  LDR R2, R6, #-1

  JSRR R5        ;draw()

BRnzp GAME_LOOP
  HALT
;}//End of Main

UserInput .FILL x3870
DRAW .FILL x3700 ;Address of Draw() routine
UPDATE_ELEMENT .FILL x3730 ;Address of UpdateElement() routine
MOVE .FILL x3800 ;Address of Move() routine
SP  .FILL xFDFF ; Stack pointer to the end of user space MEM
PLAYER_SYMBOL .FILL x70 ; 'P' for player
.END
