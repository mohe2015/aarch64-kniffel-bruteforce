#include <asm/unistd.h>
#include "../src/utils.S"

.data
success_txt: .ascii "\033[0;32mTest successful!\n\033[0m"
success_len = . - success_txt

error_txt: .ascii "\033[0;31mAssert failed!\n\033[0m"
error_len = . - error_txt

.text

assert:
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
    ret