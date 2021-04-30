#include <asm/unistd.h>
#include "helper.S"

.text

test_twos_points:
    sub sp, sp, 16
    str lr, [sp, 0]
    dice .req x0
    return_value .req x1
    mov dice, 0b000000000000000
    bl twos_points
    mov ret0, return_value
    bl assert


    ldr lr, [sp], 0
    add sp, sp, 16
    ret
    .unreq return_value
    .unreq dice