.ORIG x3400
;Simple 4-bit LFSR Based Pseudo-random number generator
;Checkout wikipedia for a visual:
; en.wikipedia.org/wiki/Linear_feedback_shift_register
;Note: I am implementing it backwards from wikipedia.
; i.e. the taps (inputs to xor) are the msbs and I shift left rather
; than right
;==================================
; R6 = Stack Pointer (software support)
; R7 = Return Address (hardware support)
; [IN] Nothing
; [OUT] R0 = some pseudo random number

;-----------------------
;prologue; Saves state of machine to stack
;-----------------------
;Stack 'grows' down towards lower addresses (pushing)
;Return Address (R7) saved by caller BEFORE jumping to subroutine,
;since hardware will overwrite the previous (and probably important)
; Value in R7 during a JSR or JSRR instructions
;@ STR R7, R6, #0
;@ ADD R6, R6, #-1
;------------------

;Push R1
  STR R1, R6, #0
  ADD R6, R6, #-1 ; ------------------
                  ; The Stack Frame
;Push R2          ;--------------------
  STR R2, R6, #0  ; NOTE: SP == stack pointer
  ADD R6, R6, #-1 ;
                  ;
;Push R3          ;        <- Lower Addresses
  STR R3, R6, #0  ; |____| <- "Top" of stack (SP after pushing registers)
  ADD R6, R6, #-1 ; | R4 |
                  ; | R3 |
;Push R4          ; | R2 |
  STR R4, R6, #0  ; | R1 |
  ADD R6, R6, #-1 ; | R7 | <- "Bottom" Of Stack
                  ;        <- High Addresses

;---INIT---------------
  LEA R0, SEED
  LDR R0, R0, #0
  
  AND R1, R0, #8  ;Mask msb (first tap) ; A
  AND R2, R0, #4  ;Mask second tap      ; B
  ADD R2, R2, R2  ;Align taps (B = B << 1)

;Shift and Mask low bits of random num
  ADD R0, R0, R0  ;rng = rng << 1
  AND R0, R0, xF  ;rng = rng & 0x000F

;-----------------------
;XOR Bits
;-----------------------
  NOT R3, R1      ;!A
  AND R3, R3, R2  ;!AB
  
  NOT R4, R2      ;!B
  AND R4, R4, R1  ;A!B

;Whoever thought it was a good idea to leave
;out XOR and OR is evil
;OR = !(!x!y)
;OR  R2, R3, R4  ;R2 = !AB + A!B
  
  NOT R3, R3  ;!x
  NOT R4, R4  ;!y
  AND R2, R3, R4 ;!(!x!y) = !(!x) + !(!y) = !!x + !!y = x + y 

  BRz RngEpilogue ;If 0 then 'make lsb 0'
  ADD R0, R0, #1  ;Else Add a 1

;-----------------------
;Epilogue
;-----------------------
RngEpilogue 
  LEA R1, SEED
  STR R0, R1, #0 ;Save our random number for next time

;Pop R4
  ADD R6, R6, #1  ; ------------------
  LDR R4, R6, #0  ; The Stack Frame
                  ;--------------------
;Pop R3           ; NOTE: SP == stack pointer
  ADD R6, R6, #1  ;
  LDR R3, R6, #0  ;
                  ;        <- Lower Addresses
;Pop R2           ; |____| 
  ADD R6, R6, #1  ; |____|
  LDR R2, R6, #0  ; |____|
                  ; |____|
;Pop R1           ; |____|
  ADD R6, R6, #1  ; |____| <- SP after popping registers
  LDR R1, R6, #0  ;        <- High Addresses

;Return Address Popped by caller (R7) otherwise
; RET will jump to wrong address
; FYI RET = JMP R7
;@ ADD R6, R6, #1
;@ LDR R7, R6, #0

  RET ;Return R0 = Random Number

;=====================
;Constants
;=====================
SEED .FILL x0003 ;Uses the bottom 4 bits for number
;Note: we will overwrite the seed value after we are done so that
;each call to R0 = rand() gives a different number 

.END
