.data

gui_game_txt:
.ascii "|-------------------------|\n"
.ascii "|      Upper section      |\n"
.ascii "|-------------------------|\n"
.ascii "| Category        | Score |\n"
.ascii "|-------------------------|\n"
.ascii "| Aces            |  %04hx |\n"
.ascii "| Twos            |  %04hx |\n"
.ascii "| Threes          |  %04hx |\n"
.ascii "| Fours           |  %04hx |\n"
.ascii "| Fives           |  %04hx |\n"
.ascii "| Sixes           |  %04hx |\n"
.ascii "|-------------------------|\n"
.ascii "|      Lower section      |\n"
.ascii "|-------------------------|\n"
.ascii "| Category        | Score |\n"
.ascii "|-------------------------|\n"
.ascii "| Three of A Kind |  %04hx |\n"
.ascii "| Four of A Kind  |  %04hx |\n"
.ascii "| Full House      |  %04hx |\n"
.ascii "| Small Straight  |  %04hx |\n"
.ascii "| Large Straight  |  %04hx |\n"
.ascii "| Yahtzee         |  %04hx |\n"
.ascii "| Chance          |  %04hx |\n"
.ascii "|-------------------------|\n"
.ascii "| Total           |       |\n"
.ascii "|-------------------------|\n"
gui_game_len = . - gui_game_txt

.text

show_gui_game:
    sub sp, sp, 48+16
    str lr, [sp, 48]

    mov tmp0, arg0

    adr arg0, gui_game_txt
    ldrh warg1, [tmp0, game_state.aces]
    ldrh warg2, [tmp0, game_state.twos]
    ldrh warg3, [tmp0, game_state.threes]
    ldrh warg4, [tmp0, game_state.fours]
    ldrh warg5, [tmp0, game_state.fives]
    ldrh warg6, [tmp0, game_state.sixes]
    ldrh warg7, [tmp0, game_state.three_of_a_kind]

    ldrh wtmp1, [tmp0, game_state.four_of_a_kind]
    str tmp1, [sp, 0]

    ldrh wtmp1, [tmp0, game_state.full_house]
    str tmp1, [sp, #8]

    ldrh wtmp1, [tmp0, game_state.small_straight]
    str tmp1, [sp, #16]

    ldrh wtmp1, [tmp0, game_state.large_straight]
    str tmp1, [sp, #24]

    ldrh wtmp1, [tmp0, game_state.yahtzee]
    str tmp1, [sp, #32]

    ldrh wtmp1, [tmp0, game_state.chance]
    str tmp1, [sp, #40]

    bl printf

    ldr lr, [sp, 48]
    add sp, sp, 48+16

    ret