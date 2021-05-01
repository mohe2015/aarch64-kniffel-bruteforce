.data

gui_game_txt:
.ascii "|-------------------------|\n"
.ascii "|      Upper section      |\n"
.ascii "|-------------------------|\n"
.ascii "| Category        | Score |\n"
.ascii "|-------------------------|\n"
.ascii "| Aces            | %u    |\n"
.ascii "| Twos            | %u    |\n"
.ascii "| Threes          | %u    |\n"
.ascii "| Fours           | %u    |\n"
.ascii "| Fives           | %u    |\n"
.ascii "| Sixes           | %u    |\n"
.ascii "|-------------------------|\n"
.ascii "|      Lower section      |\n"
.ascii "|-------------------------|\n"
.ascii "| Category        | Score |\n"
.ascii "|-------------------------|\n"
.ascii "| Three of A Kind | %u    |\n"
.ascii "| Four of A Kind  | %u    |\n"
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

    mov tmp0, arg0
    adr arg0, gui_game_txt // first arg?
    ldr arg1, [tmp0, game_state.aces] // first arg
    mov arg2, 2 // first arg
    mov arg3, 3 // first arg
    mov arg4, 4 // first arg
    mov arg5, 5 // first arg
    mov arg6, 6 // first arg
    mov arg7, 7 // first arg
    //str tmp0, [sp, #16]
    //str tmp0, [sp, #8]
    mov tmp1, 16
    str tmp1, [sp, 0]
    bl printf

    ldp tmp1, tmp2, [sp, 0]
    ldr lr, [sp, 16]
    add sp, sp, 32

    ret