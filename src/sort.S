

this_is_totally_sorting:
    sub sp, sp, 16
    str lr, [sp, 8]
    str wzr, [sp, 0] // initialize with 0

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

    mov arg0, 0
    ldrb wtmp1, [sp, 1]
    cmp tmp1, 0
    b.eq done_1

    start_1:
    
    mov tmp2, 0b001
    add arg0, tmp2, arg0, LSL 3
    subs wtmp1, wtmp1, 1

    b.ne start_1

    done_1:

    ldr lr, [sp, 8]
    add sp, sp, 16
    ret
    