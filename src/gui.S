
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
    