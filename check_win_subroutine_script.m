disp(['check win script: ' dec2hex(PC,4)]);
check_win = dec2hex(PC,4);

PUSH_AF();
PUSH_BC();
PUSH_DE();
PUSH_HL();

LD_D('01');
LD_HL(grid_address);
LD_B('00');
LD_E('E');
loop1 = dec2hex(PC,4);
    LD_A_pHLp();
    CP_A_B();
    JR_Z('00');if1 = PC;
        LD_D('00');
        JR('00');break1 = PC;
    endif1 = PC; rom(if1) = endif1 - if1;
    INC_HL();
    INC_B();
    DEC_E();
JP_NZ(loop1);
rom(break1) = PC - break1;

LD_A('01');
CP_A_D();
JR_NZ('00');if1 = PC;
    %CALL(turn_off_screen);
    CALL(wait_for_vblank);
    LD_HL('0000');congrats_placeholder = PC-1;
    LD_DE('9940');
    CALL(write_text);
    LD_HL('0000');restart_placeholder = PC-1;
    LD_DE('9960');
    CALL(write_text);
    CALL(turn_on_screen);
    LD_HL(game_state_address);
    INC_pHLp();
endif1 = PC; rom(if1) = endif1 - if1;

POP_HL();
POP_DE();
POP_BC();
POP_AF();

RET();