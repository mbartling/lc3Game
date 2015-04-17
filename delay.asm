.ORIG x3860
;void delay(count);
; Delay
; Input: Number to count down from
; Output: None

DELAY
ADD R0, R0, #-1
BRzp DELAY
RET
.END
