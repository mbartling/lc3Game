.ORIG x3900
; char UserInput(void);
; Inputs: None
; Outputs: 0 if user inputs 'a'
; Outputs: 1 if user inputs 'w'
; Outputs: 2 if user inputs 'd'
; Outputs: 3 if user inputs 's'
; Else wait for valid input

UserInput 
  ;Push R7, R6
  STR R7, R6, #0
  STR R1, R6, #-1
  ADD R6, R6, #-2

GET_CHAR
  GETC
  NOT R0, R0 
  ADD R0, R0, #1 ;c = -c
;----------------------
;Switch(char) ;Switch case
;----------------------
;check_W
  LD R1, w_key
  ADD R1, R1, R0
  BRz GOT_w

;check_A
  LD R1, a_key
  ADD R1, R1, R0
  BRz GOT_a

;check_S
  LD R1, s_key
  ADD R1, R1, R0
  BRz GOT_s

;check_D
  LD R1, d_key
  ADD R1, R1, R0
  BRz GOT_d

  ;Else Loop
  BRnzp GET_CHAR
;---------------------------------------
GOT_w
  AND R0, R0, #0 ;1 For north
  ADD R0, R0, #1
  BRnzp Done

GOT_a ;0 for west
  AND R0, R0, #0
  ADD R0, R0, #0
  BRnzp Done

GOT_s ;3 for south
  AND R0, R0, #0
  ADD R0, R0, #3
  BRnzp Done

GOT_d ;2 for east
  AND R0, R0, #0
  ADD R0, R0, #2
  BRnzp Done

Done 
;Pop R1, R7
ADD R6, R6, #2
LDR R1, R6, #1
LDR R7, R6, #0

RET

a_key .FILL x61
s_key .FILL x73
d_key .FILL x64
w_key .FILL x77
.END
