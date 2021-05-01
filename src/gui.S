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
.ascii "| Full House      | %08x |\n"
.ascii "| Small Straight  | %08x |\n"
.ascii "| Large Straight  | %08x |\n"
.ascii "| Yahtzee         | %08x |\n"
.ascii "| Chance          | %08x |\n"
.ascii "|----------------------------|\n"
.ascii "| Total           |          |\n"
.ascii "|----------------------------|\n"
gui_game_len = . - gui_game_txt

.text

show_gui_game:
    sub sp, sp, 48+16
    str lr, [sp, 48]

    mov tmp0, arg0

    adr arg0, gui_game_txt
    ldr arg1, [tmp0, game_state.aces]
    ldr arg2, [tmp0, game_state.twos]
    ldr arg3, [tmp0, game_state.threes]
    ldr arg4, [tmp0, game_state.fours]
    ldr arg5, [tmp0, game_state.fives]
    ldr arg6, [tmp0, game_state.sixes]
    ldr arg7, [tmp0, game_state.three_of_a_kind]

    ldr tmp1, [tmp0, game_state.four_of_a_kind]
    str tmp1, [sp, 0]

    ldr tmp1, [tmp0, game_state.full_house]
    str tmp1, [sp, #8]

    ldr tmp1, [tmp0, game_state.small_straight]
    str tmp1, [sp, #16]

    ldr tmp1, [tmp0, game_state.large_straight]
    str tmp1, [sp, #24]

    ldr tmp1, [tmp0, game_state.yahtzee]
    str tmp1, [sp, #32]

    ldr tmp1, [tmp0, game_state.chance]
    str tmp1, [sp, #40]

    bl printf

    ldr lr, [sp, 48]
    add sp, sp, 48+16

    ret