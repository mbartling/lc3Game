.ORIG x3600
;void Draw(void)
; Draws the game map
; Inputs: None
; Outputs: None
DRAW 
     LEA R0, MAP
     PUTS
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
  ;STR R6, R6, #0  ;Push Stack Pointer
  STR R7, R6, #0   ;Push Return Address


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
