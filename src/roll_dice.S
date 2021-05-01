#include <asm/unistd.h>

.altmacro

.macro random_die n
    // extract nth die random data
    ldr tmp0, [sp, 2*n]
    mov tmp2, 0xffff
    and tmp0, tmp2, tmp0, LSR 0

    // check if it's out of range
    mov tmp3, 65532
    cmp tmp0, tmp3
    b.ge roll_dice_retry

    // divide by 10922
    mov     wtmp1, #13
    movk    wtmp1, #49155, lsl #16
    lsr     wtmp0, wtmp0, #1
    umull   tmp0, wtmp0, wtmp1
    lsr     tmp4, tmp0, #44
    add tmp4, tmp4, 1

    add ret0, tmp4, ret0, LSL 3
.endm

.text

random_dice:
    sub sp, sp, 32
    str lr, [sp, 16]

    // 2^16/6=10922.6666667
    // 10922*6=65532
    // (65532/2^16)^6=0.99963384493
    // so probably just fully restart on failure

    roll_dice_retry:
    // this is likely super slow
    // https://man7.org/linux/man-pages/man2/getrandom.2.html
    mov arg0, sp
    mov arg1, 12
    mov arg2, 0
    mov syscall, __NR_getrandom
    svc 0

    mov ret0, 0
    // first dice
    random_die 0
    random_die 1
    random_die 2
    random_die 3
    random_die 4


    ldr lr, [sp, 16]
    add sp, sp, 32

    ret