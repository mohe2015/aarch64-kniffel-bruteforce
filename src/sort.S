

this_is_totally_sorting:
    sub sp, sp, 16
    str lr, [sp, 8]
    str xzr, [sp, 0] // initialize with 0

    // doing this in registers is maybe faster?

    // count occurrences of each number

    mov tmp2, 0b111
    and tmp0, tmp2, arg0        // tmp0 = 0b111 & arg0
    ldrb wtmp1, [sp, tmp0]
    add tmp1, tmp1, 1
    strb wtmp1, [sp, tmp0]

    and tmp0, tmp2, arg0, LSR 3 // tmp0 = 0b111 & (arg0 >> 3)
    ldrb wtmp1, [sp, tmp0]
    add tmp1, tmp1, 1
    strb wtmp1, [sp, tmp0]

    and tmp0, tmp2, arg0, LSR 6
    ldrb wtmp1, [sp, tmp0]
    add tmp1, tmp1, 1
    strb wtmp1, [sp, tmp0]

    and tmp0, tmp2, arg0, LSR 9
    ldrb wtmp1, [sp, tmp0]
    add tmp1, tmp1, 1
    strb wtmp1, [sp, tmp0]

    and tmp0, tmp2, arg0, LSR 12
    ldrb wtmp1, [sp, tmp0]
    add tmp1, tmp1, 1
    strb wtmp1, [sp, tmp0]

    // just repeat the numbers by their occurrence in ascending order

    mov ret0, 0

    // 1
    ldrb wtmp1, [sp, 1]
    cmp tmp1, 0
    b.eq done_1

    start_1:
    
    mov tmp2, 0b001
    add ret0, tmp2, ret0, LSL 3
    subs wtmp1, wtmp1, 1

    b.ne start_1

    done_1:

    // 2
    ldrb wtmp1, [sp, 2]
    cmp tmp1, 0
    b.eq done_2

    start_2:
    
    mov tmp2, 0b010
    add ret0, tmp2, ret0, LSL 3
    subs wtmp1, wtmp1, 1

    b.ne start_2

    done_2:

    // 3
    ldrb wtmp1, [sp, 3]
    cmp tmp1, 0
    b.eq done_3

    start_3:
    
    mov tmp2, 0b011
    add ret0, tmp2, ret0, LSL 3
    subs wtmp1, wtmp1, 1

    b.ne start_3

    done_3:

    // 4
    ldrb wtmp1, [sp, 4]
    cmp tmp1, 0
    b.eq done_4

    start_4:
    
    mov tmp2, 0b100
    add ret0, tmp2, ret0, LSL 3
    subs wtmp1, wtmp1, 1

    b.ne start_4

    done_4:

    // 5

    ldrb wtmp1, [sp, 5]
    cmp tmp1, 0
    b.eq done_5

    start_5:
    
    mov tmp2, 0b101
    add ret0, tmp2, ret0, LSL 3
    subs wtmp1, wtmp1, 1

    b.ne start_5

    done_5:

    // 6

    ldrb wtmp1, [sp, 6]
    cmp tmp1, 0
    b.eq done_6

    start_6:
    
    mov tmp2, 0b110
    add ret0, tmp2, ret0, LSL 3
    subs wtmp1, wtmp1, 1

    b.ne start_6

    done_6:

    ldr lr, [sp, 8]
    add sp, sp, 16
    ret
    