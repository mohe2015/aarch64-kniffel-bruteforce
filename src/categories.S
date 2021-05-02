#include "utils.S"

.altmacro

# check each of the places
.macro n_points
    mov ret0, 0
    eor tmp0, tmp0, tmp1
    ands tmp1, tmp0, 0b111000000000000
    cinc ret0, ret0, eq
    ands tmp1, tmp0, 0b000111000000000
    cinc ret0, ret0, eq
    ands tmp1, tmp0, 0b000000111000000
    cinc ret0, ret0, eq
    ands tmp1, tmp0, 0b000000000111000
    cinc ret0, ret0, eq
    ands tmp1, tmp0, 0b000000000000111
    cinc ret0, ret0, eq
    ret
.endm

.text

ones_points:
    mov tmp0, arg0
    mov tmp1, 0b001001001001001
    n_points

// e.g. 12223
twos_points:
    mov tmp0, arg0
    mov tmp1, 0b010010010010010
    n_points

threes_points:
    mov tmp0, arg0
    mov tmp1, 0b011011011011011
    n_points

fours_points:
    mov tmp0, arg0
    mov tmp1, 0b100100100100100
    n_points

fives_points:
    mov tmp0, arg0
    mov tmp1, 0b101101101101101
    n_points

sixes_points:
    mov tmp0, arg0
    mov tmp1, 0b110110110110110
    n_points