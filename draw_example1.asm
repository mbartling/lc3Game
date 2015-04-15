.ORIG x3000
; Dedicate R6 == Stack pointer
LEA R6, SP
LDR R6, R6, #0

;Main(){
  LEA R5, DRAW
  LDR R5, R5, #0 ;Load pointer to Rand()
  LEA R4, UPDATE_ELEMENT
  LDR R4, R4, #0 ;Load pointer to UpdateElement()

;----------------------------------------------
; First Call to Draw()
;----------------------------------------------

  JSRR R5        ;draw()

;----------------------------------------------
; Update map
;----------------------------------------------
  AND R0, R0, #5
  STR R0, R6, #0
  STR R0, R6, #1
  ADD R6, R6, #2
  ADD R0, R0, #14
  ADD R0, R0, #14
  ADD R0, R0, #14
  JSRR R4

;----------------------------------------------
; Second Call to Draw()
;----------------------------------------------
  JSRR R5        ;draw()
  
  HALT
;}//End of Main

DRAW .FILL x3600 ;Address of Rand() routine
UPDATE_ELEMENT .FILL x3605 ;Address of UpdateElement() routine
SP  .FILL xFDFF ; Stack pointer to the end of user space MEM
.END
