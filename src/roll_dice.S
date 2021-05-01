#include <asm/unistd.h>


random_dice:
    sub sp, sp, 32
    str lr, [sp, 16]

    // twelve bytes needed for 6*16 bits

    // 2^32/6=715827882.667
    // 715827882*6=4294967292
    // totally unlikely 9*10^-10 that we need to call this twice
    // (4294967292/2^32)^6=0.999999994412
    // so probably just fully restart on failure

    // 16 bits could be enough
    // (65532/2^16)^6=0.99963384493

    retry:

    // https://man7.org/linux/man-pages/man2/getrandom.2.html
    mov arg0, sp
    mov arg1, 12
    mov arg2, 0
    mov syscall, __NR_getrandom
    svc 0

    // extract first digit random data
    ldr tmp0, [sp, 0]
    mov tmp2, 0xffff
    and tmp0, tmp2, tmp0, LSR 0

    // check if it's out of range
    mov tmp3, 65532
    cmp tmp0, tmp3
    b.ge retry

    // stolen division by 6 for unsigned 16 bit integer
    mov     wtmp1, #43691
    mul     wtmp0, wtmp0, wtmp1
    lsr     wtmp0, wtmp0, #18

    // put into result
    mov ret0, tmp0

    ldr lr, [sp, 16]
    add sp, sp, 32

    ret