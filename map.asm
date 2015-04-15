.ORIG x3600
;void Draw(void)
; Draws the game map
; Inputs: None
; Outputs: None
DRAW 
     STR R7, R6, #0
     LEA R0, MAP
     PUTS
     LDR R7, R6, #0
     RET

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


; Constants
XDIM .FILL x08
YDIM .FILL x0A
FOGOFWAR  .FILL x2A ; A '*' char
FLOORTILE .FILL x2E ; A '.' char
WALL      .FILL x23 ; A '#' char

;Think of map as a 10x8 block of characters (A string)
; Where each row is a array of characters followed by a new line
; This means we have (8 elements + 1 newline)*(number of columns) + 1 null char 
; worth of allocated space for the map (91 mem locations total)
MAP .BLKW 8, x2E    ; Set aside 8 location (xDim) and init them all to FLOORTILE
    .FILL x0A       ; \n
    .BLKW 8, x2E    ; Set aside 8 location (xDim) and init them all to FLOORTILE
    .FILL x0A       ; \n
    .BLKW 8, x2E    ; Set aside 8 location (xDim) and init them all to FLOORTILE
    .FILL x0A       ; \n
    .BLKW 8, x2E    ; Set aside 8 location (xDim) and init them all to FLOORTILE
    .FILL x0A       ; \n
    .BLKW 8, x2E    ; Set aside 8 location (xDim) and init them all to FLOORTILE
    .FILL x0A       ; \n
    .BLKW 8, x2E    ; Set aside 8 location (xDim) and init them all to FLOORTILE
    .FILL x0A       ; \n
    .BLKW 8, x2E    ; Set aside 8 location (xDim) and init them all to FLOORTILE
    .FILL x0A       ; \n
    .BLKW 8, x2E    ; Set aside 8 location (xDim) and init them all to FLOORTILE
    .FILL x0A       ; \n
    .BLKW 8, x2E    ; Set aside 8 location (xDim) and init them all to FLOORTILE
    .FILL x0A       ; \n
    .BLKW 8, x2E    ; Set aside 8 location (xDim) and init them all to FLOORTILE
    .FILL x0A       ; \n
    .FILL x00       ; Null Termination


  .END
