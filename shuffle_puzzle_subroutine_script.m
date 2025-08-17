disp(['shuffle puzzle subroutine: ' dec2hex(PC,4)]);
shuffle_puzzle = dec2hex(PC,4);

PUSH_AF();
PUSH_BC();
PUSH_DE();
PUSH_HL();

%shuffling state
CALL(make_random_move);
LD_HL(joypad_input);
RES_5_pHLp();% select buttons
SET_4_pHLp();% don't select D_pad
LD_A_pHLp();
BIT_0_A();
JR_NZ('00'); if2 = PC;
    LD_HL(input_buffer_address);
    BIT_0_pHLp();
    JR_Z('00'); if3 = PC;
      LD_HL(game_state_address);
      INC_pHLp();
      CALL(turn_off_screen);
      CALL(clear_screen);
      CALL(turn_on_screen);
    endif3 = PC; rom(if3) = endif3 - if3;
endif2 = PC; rom(if2) = endif2 - if2;

LD_HL(input_buffer_address);
LD_pHLp_A();

POP_HL();
POP_DE();
POP_BC();
POP_AF();

RET();
