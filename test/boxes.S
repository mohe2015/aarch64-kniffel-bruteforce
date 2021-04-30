#include <asm/unistd.h>
#include "helper.S"

// assert(out == fun(in))
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

    assert_1 0, ones_points, 0b110010000011100
    assert_1 5, ones_points, 0b001001001001001

    assert_1 0, twos_points, 0b000000000000000
    assert_1 1, twos_points, 0b000000000000010
    assert_1 2, twos_points, 0b000000000010010
    assert_1 3, twos_points, 0b000000010010010
    assert_1 4, twos_points, 0b000010010010010
    assert_1 5, twos_points, 0b010010010010010
    assert_1 4, twos_points, 0b001010010010010

    ldr lr, [sp], 0
    add sp, sp, 16
    ret