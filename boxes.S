

aces_points:
    dice .req x0
    return_value .req x0
    // xor and count leading zeros
    mov x11, 0b001001001001001
    eor dice, dice, x11
    clz dice, dice
    // divide by three / maybe use 4 bits to optimize this? 171/2^9=0.333984375
    mov x9, 171
    mul dice, dice, x9
    lsr return_value, dice, 9