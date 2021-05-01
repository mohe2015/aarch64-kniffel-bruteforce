#include <asm/unistd.h>
// the dice need to be sorted ascending
// every die is stored as 3 bits

.struct 0
five_dice: .skip 2
five_dice_size:

.text
print_dice:
    //sub sp, sp, 16
    //str lr, [sp, 0]

    mov tmp0, 0b111
    and tmp1, tmp0, arg0, LSR 12
    add tmp1, tmp1, 48
    strb wtmp1, [sp, #8]

    mov tmp0, 0b111
    and tmp1, tmp0, arg0, LSR 9
    add tmp1, tmp1, 48
    strb wtmp1, [sp, #9]

    mov tmp0, 0b111
    and tmp1, tmp0, arg0, LSR 6
    add tmp1, tmp1, 48
    strb wtmp1, [sp, #10]

    mov tmp0, 0b111
    and tmp1, tmp0, arg0, LSR 3
    add tmp1, tmp1, 48
    strb wtmp1, [sp, #11]

    mov tmp0, 0b111
    and tmp1, tmp0, arg0, LSR 0
    add tmp1, tmp1, 48
    strb wtmp1, [sp, #12]

    mov arg0, 1
    add arg1, sp, 8
    mov arg2, 5
    mov syscall, __NR_write
    svc 0

    //ldr lr, [sp, 0]
    //add sp, sp, 16
    ret

read_dice:
    // print_dice in reverse
    // read chosen numbers
    mov arg0, 0
    add arg1, sp, game_state_size
    mov arg2, 8
    mov syscall, __NR_read
    svc 0

    mov ret0, 0
    
    ldr tmp0, [sp, game_state_size]
    mov tmp1, 0b11111111
    and tmp2, tmp1, tmp0, LSR 0
    cmp tmp2, '\n'
    b.eq read_dice_end
    sub tmp2, tmp2, 48
    add ret0, tmp2, ret0, LSL 3

    ldr tmp0, [sp, game_state_size]
    mov tmp1, 0b11111111
    and tmp2, tmp1, tmp0, LSR 8
    cmp tmp2, '\n'
    b.eq read_dice_end
    sub tmp2, tmp2, 48
    add ret0, tmp2, ret0, LSL 3

    ldr tmp0, [sp, game_state_size]
    mov tmp1, 0b11111111
    and tmp2, tmp1, tmp0, LSR 16
    cmp tmp2, '\n'
    b.eq read_dice_end
    sub tmp2, tmp2, 48
    add ret0, tmp2, ret0, LSL 3

    ldr tmp0, [sp, game_state_size]
    mov tmp1, 0b11111111
    and tmp2, tmp1, tmp0, LSR 24
    cmp tmp2, '\n'
    b.eq read_dice_end
    sub tmp2, tmp2, 48
    add ret0, tmp2, ret0, LSL 3

    ldr tmp0, [sp, game_state_size]
    mov tmp1, 0b11111111
    and tmp2, tmp1, tmp0, LSR 32
    cmp tmp2, '\n'
    b.eq read_dice_end
    sub tmp2, tmp2, 48
    add ret0, tmp2, ret0, LSL 3

    read_dice_end:

    ret