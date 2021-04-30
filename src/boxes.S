#include "utils.S"

.text

// e.g. 12223
twos_points:
    dice .req x0
    return_value .req x1
    mov tmp0, 0b010010010010010
    mov return_value, 0
    eor dice, dice, tmp0
    ands tmp0, dice, 0b111000000000000
    cinc return_value, return_value, eq
    ands tmp0, dice, 0b000111000000000
    cinc return_value, return_value, eq
    ands tmp0, dice, 0b000000111000000
    cinc return_value, return_value, eq
    ands tmp0, dice, 0b000000000111000
    cinc return_value, return_value, eq
    ands tmp0, dice, 0b000000000000111
    cinc return_value, return_value, eq
    ret
    .unreq return_value
    .unreq dice