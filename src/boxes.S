#include "utils.S"

.text

// e.g. 12223
twos_points:
    mov tmp0, arg0
    mov tmp1, 0b010010010010010
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