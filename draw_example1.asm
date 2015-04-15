.ORIG x3000
; Dedicate R6 == Stack pointer
LEA R6, SP
LDR R6, R6, #0

;Main(){
  LEA R5, DRAW
  LDR R5, R5, #0 ;Load pointer to Rand()

;----------------------------------------------
; First Call to Draw()
;----------------------------------------------

  JSRR R5        ;draw()
  
;----------------------------------------------
; Second Call to Draw()
;----------------------------------------------
  JSRR R5        ;draw()
  
  HALT
;}//End of Main

DRAW .FILL x3600 ;Address of Rand() routine
SP  .FILL xFDFF ; Stack pointer to the end of user space MEM
.END
