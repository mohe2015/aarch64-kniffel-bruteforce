// https://sourceware.org/binutils/docs-2.36/as/index.html
// https://developer.arm.com/documentation/ihi0055/latest/
// https://modexp.wordpress.com/2018/10/30/arm64-assembly/
// First this will only be a program to play kniffel, not to predict anything
#include <asm/unistd.h>

.struct 0
dimension_t.x: .skip 4
dimension_t.y: .skip 4
dimension_t_size:

.global main

.data
hello_txt: .ascii "Hello, World!\n"
hello_len = . - hello_txt

.text

arg0 .req x0
arg1 .req x1
arg2 .req x2
syscall .req x8

main:
    mov arg0, STDOUT_FILENO
    adr arg1, hello_txt
    mov arg2, hello_len
    mov syscall, __NR_write
    svc 0

    return_value .req x0
    mov return_value, 10
    .unreq return_value
    ret
