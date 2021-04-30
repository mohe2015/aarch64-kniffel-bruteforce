#include <asm/unistd.h>
#include "helper.S"

.text

test_twos_points:
    sub sp, sp, 16
    str lr, [sp, 0]

    mov arg0, 0b000000000000000
    bl twos_points
    bl assert


    ldr lr, [sp], 0
    add sp, sp, 16
    ret