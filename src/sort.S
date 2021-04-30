

this_is_totally_sorting:
    sub sp, sp, 16
    str lr, [sp, 8]

    // count occurrences of each number

    and tmp0, arg0, 0b111
    ldrb tmp1, [sp, tmp0]
    add tmp1, tmp1, 1
    strb tmp1, [sp, tmp0]

    and tmp0, arg0, 0b111, LSR 3
    ldrb tmp1, [sp, tmp0]
    add tmp1, tmp1, 1
    strb tmp1, [sp, tmp0]

    and tmp0, arg0, 0b111, LSR 6
    ldrb tmp1, [sp, tmp0]
    add tmp1, tmp1, 1
    strb tmp1, [sp, tmp0]

    and tmp0, arg0, 0b111, LSR 9
    ldrb tmp1, [sp, tmp0]
    add tmp1, tmp1, 1
    strb tmp1, [sp, tmp0]

    and tmp0, arg0, 0b111, LSR 12
    ldrb tmp1, [sp, tmp0]
    add tmp1, tmp1, 1
    strb tmp1, [sp, tmp0]

    // just repeat the numbers by their occurrence in ascending order

    mov arg0, 0
    ldrb tmp1, [sp, 1]
    
    add arg0, 0b001, arg0, LSL 3



    ldr lr, [sp], 8
    add sp, sp, 16
    ret
    