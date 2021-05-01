.data

gui_game_txt:
.ascii "|-------------------------|\n"
.ascii "|      Upper section      |\n"
.ascii "|-------------------------|\n"
.ascii "| Category        | Score |\n"
.ascii "|-------------------------|\n"
.ascii "| Aces            |       |\n"
.ascii "| Twos            |       |\n"
.ascii "| Threes          |       |\n"
.ascii "| Fours           |       |\n"
.ascii "| Fives           |       |\n"
.ascii "| Sixes           |       |\n"
.ascii "|-------------------------|\n"
.ascii "|      Lower section      |\n"
.ascii "|-------------------------|\n"
.ascii "| Category        | Score |\n"
.ascii "|-------------------------|\n"
.ascii "| Three of A Kind |       |\n"
.ascii "| Four of A Kind  |       |\n"
.ascii "| Full House      |       |\n"
.ascii "| Small Straight  |       |\n"
.ascii "| Large Straight  |       |\n"
.ascii "| Yahtzee         |       |\n"
.ascii "| Chance          |       |\n"
.ascii "|-------------------------|\n"
.ascii "| Total           |       |\n"
.ascii "|-------------------------|\n"
gui_game_len = . - gui_game_txt

.text

show_gui_game:
    sub sp, sp, 32
    str lr, [sp, 16]
    stp xzr, xzr, [sp, 0]

    adr arg0, gui_game_txt // first arg?
    mov arg1, xzr // number of args?
    bl printf

    ldp tmp0, tmp1, [sp, 0]
    ldr lr, [sp, 16]
    add sp, sp, 32

    ret