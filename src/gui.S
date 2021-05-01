.data

gui_game_txt:
.ascii "|----------------------------|\n"
.ascii "|      Upper section         |\n"
.ascii "|----------------------------|\n"
.ascii "| Category        | Score    |\n"
.ascii "|----------------------------|\n"
.ascii "| Aces            | %08x |\n"
.ascii "| Twos            | %08x |\n"
.ascii "| Threes          | %08x |\n"
.ascii "| Fours           | %08x |\n"
.ascii "| Fives           | %08x |\n"
.ascii "| Sixes           | %08x |\n"
.ascii "|----------------------------|\n"
.ascii "|      Lower section         |\n"
.ascii "|----------------------------|\n"
.ascii "| Category        | Score    |\n"
.ascii "|----------------------------|\n"
.ascii "| Three of A Kind | %08x |\n"
.ascii "| Four of A Kind  | %08x |\n"
.ascii "| Full House      |          |\n"
.ascii "| Small Straight  |          |\n"
.ascii "| Large Straight  |          |\n"
.ascii "| Yahtzee         |          |\n"
.ascii "| Chance          |          |\n"
.ascii "|----------------------------|\n"
.ascii "| Total           |          |\n"
.ascii "|----------------------------|\n"
gui_game_len = . - gui_game_txt

.text

show_gui_game:
    sub sp, sp, 32
    str lr, [sp, 16]
    stp xzr, xzr, [sp, 0]

    mov tmp0, arg0

    adr arg0, gui_game_txt
    ldr arg1, [tmp0, game_state.aces]
    ldr arg2, [tmp0, game_state.twos]
    ldr arg3, [tmp0, game_state.threes]
    ldr arg4, [tmp0, game_state.fours]
    ldr arg5, [tmp0, game_state.fives]
    ldr arg6, [tmp0, game_state.sixes]
    ldr arg7, [tmp0, game_state.three_of_a_kind]
    //str tmp0, [sp, #16]
    //str tmp0, [sp, #8]
    mov tmp1, 16
    str tmp1, [sp, 0]
    bl printf

    ldp tmp1, tmp2, [sp, 0]
    ldr lr, [sp, 16]
    add sp, sp, 32

    ret