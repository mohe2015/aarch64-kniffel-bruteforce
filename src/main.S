// https://sourceware.org/binutils/docs-2.36/as/index.html
// https://developer.arm.com/documentation/ihi0055/latest/
// https://developer.arm.com/architectures/learn-the-architecture/aarch64-instruction-set-architecture/instruction-sets-in-the-arm-architecture
// https://developer.arm.com/documentation/100076/0100/a64-instruction-set-reference
// https://modexp.wordpress.com/2018/10/30/arm64-assembly/
// https://developer.arm.com/documentation/102374/0101/Program-flow---conditional-select-instructions
// https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/posts/using-the-stack-in-aarch64-implementing-push-and-pop
// https://gist.github.com/Prakasaka/219fe5695beeb4d6311583e79933a009
// https://armkeil.blob.core.windows.net/developer/Files/pdf/graphics-and-multimedia/ARMv8_InstructionSetOverview.pdf
// https://github.com/ARM-software/abi-aa/releases
// stack must be 16 byte aligned
// First this will only be a program to play kniffel, not to predict anything
#include <asm/unistd.h>
#include "utils.S"
#include "five_dice.S"
#include "boxes.S"
#include "../test/boxes.S"
#include "sort.S"
#include "roll_dice.S"
#include "gui.S"
#include "game_state.S"

.global main

.data
hello_txt: .ascii "\n"
hello_len = . - hello_txt

.text

main:
    // game_state dice lr
    sub sp, sp, game_state_size+16/*dice*/+16/*lr*/
    str lr, [sp, game_state_size+16]

    mov arg0, sp
    bl initialize_game_state

    /*mov arg0, 1
    adr arg1, hello_txt
    mov arg2, hello_len
    mov syscall, __NR_write
    svc 0*/

    bl test_twos_points

    /*mov arg0, 0b001010011100101
    bl this_is_totally_sorting
    bl print_dice

    mov arg0, 1
    adr arg1, hello_txt
    mov arg2, hello_len
    mov syscall, __NR_write
    svc 0

    mov arg0, 0b110101100011010
    bl this_is_totally_sorting
    bl print_dice

    mov arg0, 1
    adr arg1, hello_txt
    mov arg2, hello_len
    mov syscall, __NR_write
    svc 0*/

    mov arg0, sp
    bl show_gui_game

    bl random_dice
    bl this_is_totally_sorting
    bl print_dice

    mov arg0, 1
    adr arg1, hello_txt
    mov arg2, hello_len
    mov syscall, __NR_write
    svc 0



    // print_dice in reverse
    // read chosen numbers
    mov arg0, 0
    add arg1, sp, game_state_size
    mov arg2, 8
    mov syscall, __NR_read
    svc 0

    mov ret0, 0
    
    ldr tmp0, [sp, game_state_size]
    mov tmp1, 0b11111111
    and tmp2, tmp1, tmp0, LSR 0
    cmp tmp2, '\n'
    b.eq read_dice_end
    sub tmp2, tmp2, 48
    add ret0, tmp2, ret0, LSL 3

    ldr tmp0, [sp, game_state_size]
    mov tmp1, 0b11111111
    and tmp2, tmp1, tmp0, LSR 8
    cmp tmp2, '\n'
    b.eq read_dice_end
    sub tmp2, tmp2, 48
    add ret0, tmp2, ret0, LSL 3

    ldr tmp0, [sp, game_state_size]
    mov tmp1, 0b11111111
    and tmp2, tmp1, tmp0, LSR 16
    cmp tmp2, '\n'
    b.eq read_dice_end
    sub tmp2, tmp2, 48
    add ret0, tmp2, ret0, LSL 3

    ldr tmp0, [sp, game_state_size]
    mov tmp1, 0b11111111
    and tmp2, tmp1, tmp0, LSR 24
    cmp tmp2, '\n'
    b.eq read_dice_end
    sub tmp2, tmp2, 48
    add ret0, tmp2, ret0, LSL 3

    ldr tmp0, [sp, game_state_size]
    mov tmp1, 0b11111111
    and tmp2, tmp1, tmp0, LSR 32
    cmp tmp2, '\n'
    b.eq read_dice_end
    sub tmp2, tmp2, 48
    add ret0, tmp2, ret0, LSL 3

    read_dice_end:


    bl print_dice






    mov arg0, 1
    adr arg1, hello_txt
    mov arg2, hello_len
    mov syscall, __NR_write
    svc 0

    mov ret0, 10

    ldr lr, [sp, game_state_size+16]
    add sp, sp, game_state_size+16/*dice*/+16/*lr*/

    ret
