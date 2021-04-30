#include <asm/unistd.h>
#include "helper.S"

.macro assert_1 out, fun, in
    mov arg0, \in
    bl \fun
    cmp ret0, \out
    bl assert
.endm

.text

test_twos_points:
    sub sp, sp, 16
    str lr, [sp, 0]

    assert_1 0, twos_points, 0b000000000000000

    mov arg0, 0b000000000000010
    bl twos_points
    cmp ret0, 1
    bl assert

    mov arg0, 0b000000000010010
    bl twos_points
    cmp ret0, 2
    bl assert

    mov arg0, 0b000000010010010
    bl twos_points
    cmp ret0, 3
    bl assert

    mov arg0, 0b000010010010010
    bl twos_points
    cmp ret0, 4
    bl assert

    mov arg0, 0b010010010010010
    bl twos_points
    cmp ret0, 5
    bl assert

    mov arg0, 0b001010010010010
    bl twos_points
    cmp ret0, 4
    bl assert

    ldr lr, [sp], 0
    add sp, sp, 16
    ret