.ORIG x3720

; UpdateElement(char element, x, y)
; Will replace map location (x, y) with ascii element
; Inputs: R0 = element
; First element on stack  = y (highest address)
; Second element on stack = x 
; 
; ouputs: None
; 
; Assume R6 is stack pointer


UpdateElement

  ; Save registers  
  STR R0, R6, #0  ; Save R0
  STR R1, R6, #-1  ; Save R1
  STR R2, R6, #-2  ; Save R2
  STR R3, R6, #-3  ; Save R3
  LDR R0, R6, #1   ; Get y coordinate
  LDR R1, R6, #2  ; Get x coordinate
  
  ; Compute final store address as: y * 9 + x
  AND R2, R2, #0
  ADD R2, R2, #9

  ; Multiply y (R0) by 9 and store in R3
  AND R3, R3, #0

MULT	ADD R3, R3, R0
	ADD R2, R2, #-1
	BRp MULT	

  ; Add offset (x)
  ADD R3, R3, R1

  ; Add MAP location offset
  LEA R0, MAP
  LDR R0, R0, #0

  ADD R3, R3, R0

  ; Restore R0
  LDR R0, R6, #0

  ; Modify map
  STR R0, R3, #0

  ; Restore registers
  LDR R0, R6, #0
  LDR R1, R6, #-1
  LDR R2, R6, #-2
  LDR R3, R6, #-3

  ; Move stack
  ADD R6, R6, #2  

  RET

MAP .FILL x3600

.END
