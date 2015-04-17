.ORIG x3000
; Dedicate R6 == Stack pointer
LEA R6, SP
LDR R6, R6, #0

;Main(){
  LEA R5, DRAW
  LDR R5, R5, #0 ;Load pointer to Draw()
  LEA R4, UPDATE_ELEMENT
  LDR R4, R4, #0 ;Load pointer to UpdateElement()
  LEA R3, MOVE
  LDR R3, R3, #0 ;Load pointer to Move()

;----------------------------------------------
; First Call to Draw()
;----------------------------------------------

  ;JSRR R5        ;draw()

;----------------------------------------------
; Update map
;----------------------------------------------
  AND R0, R0, #0    ;Clear R0

  ADD R0, R0, #5    ;Push number 5 to stack
  STR R0, R6, #0

  STR R0, R6, #-1   ;Push number 5 to stack

  ADD R6, R6, #-2   ;sp = sp -2 ; move stack pointer to new base
  LD R0, PLAYER_SYMBOL
  JSRR R4

;----------------------------------------------
; Second Call to Draw()
;----------------------------------------------
  JSRR R5        ;draw()
  AND R0, R0, #0
  ADD R0, R0, #5
  STR R0, R6, #0    ;Push number 5 to stack
  STR R0, R6, #-1   ;Push number 5 to stack

  ADD R6, R6, #-2   ;sp = sp -2 ; move stack pointer to new base
  ADD R0, R0, #-3   ;Move East
  JSRR R3

  JSRR R5        ;draw()

  HALT
;}//End of Main

DRAW .FILL x3700 ;Address of Draw() routine
UPDATE_ELEMENT .FILL x3730 ;Address of UpdateElement() routine
MOVE .FILL x3800 ;Address of Move() routine
SP  .FILL xFDFF ; Stack pointer to the end of user space MEM
PLAYER_SYMBOL .FILL x70 ; 'P' for player
.END
