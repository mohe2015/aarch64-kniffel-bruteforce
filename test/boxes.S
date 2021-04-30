
.data
error_txt: .ascii "Assert failed!\n"
error_len = . - error_txt

test_twos_points:
    sub sp, 8
    str lr, [sp, 0]
    dice .req x0
    return_value .req x1
    mov dice, 0b000000000000000
    bl twos_points
    CMP return_value, 0
    b.eq correct_1

    mov arg0, 1
    adr arg1, hello_txt
    mov arg2, hello_len
    mov syscall, __NR_write
    svc 0

    correct_1:
    ldr lr, [sp], 0
    add sp, 8
    ret