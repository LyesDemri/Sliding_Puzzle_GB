disp(['init game starts at: ' dec2hex(PC,4)]);
init_game = dec2hex(PC,4);

PUSH_AF();
PUSH_BC();
PUSH_DE();
PUSH_HL();

LD_HL(spot_x_address);LD_pHLp('01');
INC_HL();LD_pHLp('01');
LD_HL(spot_index_address);LD_pHLp('00');
LD_HL(display_grid_flag_address);
LD_pHLp('00');
LD_HL(input_buffer_address);
LD_pHLp('FF');

LD_HL(random_number_address);
LD_pHLp('34');% initial seed for LSFR

write_to_address('00',game_state_address);

CALL(turn_off_screen);
%display title screen
LD_HL('0000');title_screen_placeholders(1) = PC-1;
LD_DE('9820');
CALL(write_text);

LD_HL('0000');title_screen_placeholders(2) = PC-1;
LD_DE('9860');
CALL(write_text);

LD_HL('0000');title_screen_placeholders(3) = PC-1;
LD_DE('9880');
CALL(write_text);

LD_HL('0000');title_screen_placeholders(4) = PC-1;
LD_DE('98C0');
CALL(write_text);

LD_HL('0000');title_screen_placeholders(5) = PC-1;
LD_DE('98E0');
CALL(write_text);

LD_HL('0000');title_screen_placeholders(6) = PC-1;
LD_DE('9920');
CALL(write_text);

LD_HL('0000');title_screen_placeholders(7) = PC-1;
LD_DE('9940');
CALL(write_text);

LD_HL('0000');press_start_placeholder = PC-1;
LD_DE('9980');
CALL(write_text);

CALL(turn_on_screen);



POP_HL();
POP_DE();
POP_BC();
POP_AF();

RET();



