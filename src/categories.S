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

// case a: aaaxy
// case b: xaaay
// case c: xyaaa
// alternatively 18 xor checks - maybe better?
three_of_a_kind_points:
    dice .req arg0
    diebit .req tmp0
    kind .req tmp1
    current_die .req tmp2
    sum .req ret0
    mov diebit, 0b111

    and kind, diebit, dice, LSR 12
    mov sum, kind

    and current_die, diebit, dice, LSR 9
    cmp kind, current_die
    add tmp3, sum, kind
    csel sum, tmp3, eq // TODO FIXME
    csel kind, kind, 0, eq // TODO FIXME

    ret
    .unreq dice
    .unreq diebit
    .unreq kind
    .unreq sum


// bbbbx
// xbbbb

// ccccc
yahtzee:
    kind .req tmp2
    dice .req tmp3
    mov dice, arg0

    mov tmp0, 0b111
    and kind, tmp0, arg0, LSR 12
    mov ret0, kind

    mov tmp0, 0b111
    and tmp1, tmp0, arg0, LSR 9
    cmp kind, tmp1
    b.ne yahtzee_error

    mov tmp0, 0b111
    and tmp1, tmp0, arg0, LSR 6
    cmp kind, tmp1
    b.ne yahtzee_error

    mov tmp0, 0b111
    and tmp1, tmp0, arg0, LSR 3
    cmp kind, tmp1
    b.ne yahtzee_error

    mov tmp0, 0b111
    and tmp1, tmp0, arg0, LSR 0
    cmp kind, tmp1
    b.ne yahtzee_error

    ret

    yahtzee_error:
    mov ret0, 0
    ret

    .unreq kind
    .unreq dice