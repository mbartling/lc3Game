.ORIG x3700
;void Draw(void)
; Draws the game map
; Inputs: None
; Outputs: None
DRAW 
     ;Push to stack
     STR R7, R6, #0
     STR R1, R6, #-1
     STR R2, R6, #-2
     ADD R6, R6, #-3

     ;Load The Map address
     LEA R0, MAP   
     LDR R2, R0, #0 ;ptr = &map[0] ; Make R2 a pointer to the start of map
     
     ;Draw
;     PUTS 
     
;----------------------------------------------------------
     ;Lets make the draw routine a little smarter
     ;by adding spaces between each character
     LD R1, MAP_SIZE ; i = Map size
;----------------------------------------------------------
; while(i != 0){
;   i = i - 1;
;   c = *ptr;
;
;   ptr++;
;
;   putc(c)
;   if(c != '\n') putc(space);
;   
; }
;----------------------------------------------------------

LOOP ADD R1, R1, #-1
     BRz Done
    
     ;putc(c)
     LDR R0, R2, #0
     OUT

     ADD R2, R2, #1 ; ptr++
     
     ;If(c != n) print(space)
     NOT R0, R0
     ADD R0, R0, #1
     ADD R0, R0, #10 ;10 = '\n'
     BRz LOOP
     
     LD R0, EMPTY_SPACE ; Insert an empty space
     OUT
     OUT
     BRnzp LOOP



Done AND R0, R0, #0
     ADD R0, R0, xA
     OUT
     OUT

     ;Pop From Stack
     ADD R6, R6, #3
     LDR R2, R6, #-2
     LDR R1, R6, #-1
     LDR R7, R6, #0
     RET

;End of Draw()

MAP .FILL x3600
MAP_SIZE .FILL #90
EMPTY_SPACE .FILL x20
;NEW_LINE .FILL xA
.END
