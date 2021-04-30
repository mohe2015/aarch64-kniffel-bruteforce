#include <asm/unistd.h>

.data
success_txt: .ascii "\033[0;32mTest successful!\n"
success_len = . - success_txt

error_txt: .ascii "\033[0;31mAssert failed!\n"
error_len = . - error_txt

.text

test_twos_points:
    sub sp, sp, 16
    str lr, [sp, 0]
    dice .req x0
    return_value .req x1
    mov dice, 0b000000000000000
    bl twos_points
    cmp return_value, 0
    b.eq correct_1

    mov arg0, 1
    adr arg1, error_txt
    mov arg2, error_len
    mov syscall, __NR_write
    svc 0
    b end_1

    correct_1:

    mov arg0, 1
    adr arg1, success_txt
    mov arg2, success_len
    mov syscall, __NR_write
    svc 0
    b end_1

    end_1:
    ldr lr, [sp], 0
    add sp, sp, 16
    ret
    .unreq return_value
    .unreq dice