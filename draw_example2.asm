.ORIG x3000
; Dedicate R6 == Stack pointer
LEA R6, SP
LDR R6, R6, #0

;Main(){
  LEA R5, UserInput
  LDR R5, R5, #0 ;Load pointer to UserInput()

;----------------------------------------------
; First Call to UserInput()
;----------------------------------------------

  JSRR R5        ;UserInput()
  AND R1, R1, #0
  ADD R1, R0, #0

;----------------------------------------------
; First Call to Delay()
;----------------------------------------------
  LD R0, DELAY_AMOUNT
  LD R4, DELAY
  JSRR R4 ; Delay()
;----------------------------------------------
; Second Call to UserInput()
;----------------------------------------------

  JSRR R5        ;UserInput()
  AND R2, R2, #0
  ADD R2, R0, #0

  HALT
;}//End of Main

UserInput .FILL x3870
DELAY_AMOUNT .FILL #1000
DELAY .FILL x3860
SP  .FILL xFDFF ; Stack pointer to the end of user space MEM
PLAYER_SYMBOL .FILL x70 ; 'P' for player
.END
