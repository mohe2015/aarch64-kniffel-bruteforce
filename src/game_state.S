
// 0xffff = not set
// 0 = striked out / 0 points

.struct 0
game_state.aces:            .skip 2
game_state.twos:            .skip 2
game_state.threes:          .skip 2
game_state.fours:           .skip 2
game_state.fives:           .skip 2
game_state.sixes:           .skip 2
game_state.three_of_a_kind: .skip 2
game_state.four_of_a_kind:  .skip 2
game_state.full_house:      .skip 2
game_state.small_straight:  .skip 2
game_state.large_straight:  .skip 2
game_state.yahtzee:         .skip 2
game_state.chance:          .skip 2
.align 3
game_state_size:

.text

initialize_game_state:
    // adjust this for different game_state_size
    mov tmp0, -1
    stp tmp0, tmp0, [arg0]
    stp tmp0, tmp0, [arg0, 16]
    ret