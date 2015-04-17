.ORIG x3000
    ;Initialize our stack pointer
    LEA R6, SP
    LDR R6, R6, #0
    
    ;Initialize Our X and Y Coordinates
    AND R2, R2, #0
    AND R3, R3, #0
    ADD R2, R2, #4
    ADD R3, R3, #7

GAME_LOOP
;Call R0  = UserInput()
    LD R5, UserInput
    JSRR R5
;--------------------------
; Call Move
    LD R5, Move
    STR R3, R6, #0  ; Push y
    STR R2, R6, #-1 ; Push x
    ADD R6, R6, #-2
    
    JSRR R5 ;Move(c, X, Y)

    ADD R6, R6, #2
    LDR R2, R6, #-1
    LDR R3, R6, #0
;--------------------------

    LD R5, Draw
    JSRR R5

    BRnzp GAME_LOOP
    HALT

UserInput .FILL x3900
Move .FILL x3800
Draw .FILL x3700
SP .FILL xFDFF
.END
