disp(['title screen loop: ' dec2hex(PC,4)]);
title_screen_loop = dec2hex(PC,4);

PUSH_AF();
PUSH_BC();
PUSH_DE();
PUSH_HL();

LD_HL(joypad_input);
RES_5_pHLp();% select buttons
SET_4_pHLp();% don't select D_pad
LD_A_pHLp();
BIT_3_A();  %check START button
JR_NZ('00'); if2 = PC;  %if button START is pressed:
    LD_HL(input_buffer_address);
    BIT_3_pHLp();       %and it wasn't pressed before:
    JR_Z('00'); if3 = PC;
        LD_HL(game_state_address);  %go to shuffling state
        LD_pHLp('01');
        CALL(turn_off_screen);  %clear screen
        CALL(clear_screen);     %and write "press A to Start"
        %todo: start displaying grid and shuffling
        LD_HL(display_grid_flag_address);
        INC_pHLp();
        LD_HL(game_state_address);
        LD_pHLp('01');
        LD_HL('0000'); press_a_placeholder(2) = PC - 1;
        LD_DE('9820');
        CALL(write_text);
        CALL(turn_on_screen);
    endif3 = PC; rom(if3) = endif3 - if3;
endif2 = PC; rom(if2) = endif2 - if2;

LD_HL(joypad_input);
LD_pHLp_A();

POP_HL();
POP_DE();
POP_BC();
POP_AF();

RET();