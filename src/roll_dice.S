#include <asm/unistd.h>


random_dice:
    sub sp, sp, 32
    str lr, [sp, 16]

    // 2^16/6=10922.6666667
    // 10922*6=65532
    // (65532/2^16)^6=0.99963384493
    // so probably just fully restart on failure

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

    // divide by 10922

    // put into result
    mov ret0, tmp0

    ldr lr, [sp, 16]
    add sp, sp, 32

    ret