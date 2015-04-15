.ORIG x3000
; Dedicate R6 == Stack pointer
LEA R6, SP
LDR R6, R6, #0

;Main(){
  LEA R5, RNG
  LDR R5, R5, #0 ;Load pointer to Rand()

;----------------------------------------------
; First Call to Rand()
;----------------------------------------------
  STR R7, R6, #0 ;Push R7 (Not necessary here but good practice)
  ADD R6, R6, #-1

  JSRR R5        ;num = Rand();
  ADD R1, R0, #0 ;A = num
  
  ADD R6, R6, #1
  LDR R7, R6, #0 ;Pop R7 (Must pop any value we chose to push)
  
;----------------------------------------------
; Second Call to Rand()
;----------------------------------------------
  STR R7, R6, #0 ;Push R7 (Not necessary here but good practice)
  ADD R6, R6, #-1

  JSRR R5        ;num = Rand();
  ADD R2, R0, #0 ;A = num

  ADD R6, R6, #1
  LDR R7, R6, #0 ;Pop R7 (Must pop any value we chose to push)
  
;----------------------------------------------
; Third Call to Rand()
;----------------------------------------------
  STR R7, R6, #0 ;Push R7 (Not necessary here but good practice)
  ADD R6, R6, #-1

  JSRR R5        ;num = Rand();
  ADD R3, R0, #0 ;A = num

  ADD R6, R6, #1
  LDR R7, R6, #0 ;Pop R7 (Must pop any value we chose to push)

;----------------------------------------------
; Fourth Call to Rand()
;----------------------------------------------
  STR R7, R6, #0 ;Push R7 (Not necessary here but good practice)
  ADD R6, R6, #-1

  JSRR R5        ;num = Rand();
  ADD R4, R0, #0 ;A = num

  ADD R6, R6, #1
  LDR R7, R6, #0 ;Pop R7 (Must pop any value we chose to push)

;----------------------------------------------
  HALT
;}//End of Main

RNG .FILL x3400 ;Address of Rand() routine
SP  .FILL xFDFF ; Stack pointer to the end of user space MEM
.END
