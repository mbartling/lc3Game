.ORIG x3600
; Constants
;XDIM 8
;YDIM 10
;FOGOFWAR  .FILL x2A ; A '*' char
;FLOORTILE .FILL x2E ; A '.' char
;WALL      .FILL x23 ; A '#' char

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
