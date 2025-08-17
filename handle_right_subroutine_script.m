disp(['handle right subroutine: ' dec2hex(PC,4)]);
handle_right = dec2hex(PC,4);

PUSH_AF();
PUSH_BC();
PUSH_DE();
PUSH_HL();

%handle right
LD_HL(spot_x_address);
LD_A_pHLp();
CP('04');
JR_Z('00'); if1 = PC;
    LD_HL(grid_address);
    LD_A_pLITp(spot_index_address);
    LD_C_A();
    LD_B('00');
    ADD_HL_BC();
    INC_HL();
    LD_C_pHLp();
    LD_pHLp('00');
    DEC_HL();
    LD_pHLp_C();
    LD_HL(spot_index_address);
    INC_pHLp();
    LD_HL(spot_x_address);
    INC_pHLp();
endif1 = PC; rom(if1) = endif1 - if1;

POP_HL();
POP_DE();
POP_BC();
POP_AF();


RET();