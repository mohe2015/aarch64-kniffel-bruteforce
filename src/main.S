// https://sourceware.org/binutils/docs-2.36/as/index.html
// https://developer.arm.com/documentation/ihi0055/latest/
// https://developer.arm.com/architectures/learn-the-architecture/aarch64-instruction-set-architecture/instruction-sets-in-the-arm-architecture
// https://developer.arm.com/documentation/100076/0100/a64-instruction-set-reference
// https://modexp.wordpress.com/2018/10/30/arm64-assembly/
// https://developer.arm.com/documentation/102374/0101/Program-flow---conditional-select-instructions
// First this will only be a program to play kniffel, not to predict anything
#include <asm/unistd.h>
#include "utils.S"
#include "five_dice.S"
#include "boxes.S"

.struct 0
dimension_t.x: .skip 4
dimension_t.y: .skip 4
dimension_t_size:

.global main

.data
hello_txt: .ascii "Hello, World!\n"
hello_len = . - hello_txt

.text

syscall .req x8

main:
    mov arg0, 1
    adr arg1, hello_txt
    mov arg2, hello_len
    mov syscall, __NR_write
    svc 0

    return_value .req x0
    mov return_value, 10
    .unreq return_value
    ret
