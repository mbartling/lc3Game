# lc3Game

## List of Files

**Examples**

- draw_example1.asm : Shows how to use move, draw, and UpdateElement Subroutines
- draw_example2.asm : Shows how to use the delay, and UserInput subroutines
- rng_example1.asm  : example use of the random number generator (prng)

**Subroutine Files**

- Draw.asm : Draws the game map
- delay.asm : Busy Waits for n Number of cycles
- rng.asm : Simple LFSR Based random number generator
- Move.asm : Moves a character from x0,y0 to x1,y1
- UpdateElement : Changes Updates a position in the game map with a new character
- UserInput : returns encoding for w,a,s,d else waits for correct input

## Characters

- . == empty space
- p == Player
- # == Wall
- @ == hole
- $ == Treasure
- M == Monster
