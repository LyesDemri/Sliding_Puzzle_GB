disp(['Main loop routine starts at: ' dec2hex(PC,4)]);
main_loop = dec2hex(PC,4);

PUSH_AF();
PUSH_BC();
PUSH_DE();
PUSH_HL();

LD_HL(joypad_input);
SET_5_pHLp();
RES_4_pHLp();
LD_A_pHLp();

BIT_0_A();
JR_NZ('00');if2 = PC;
    LD_HL(input_buffer_address);
    BIT_0_pHLp();
    JR_Z('00');if3 = PC;
        CALL(handle_right);
    end3 = PC;rom(if3)=end3-if3;
JR('00'); else2_1 = PC; rom(if2) = else2_1 - if2;
BIT_1_A();
JR_NZ('00'); if2 = PC;
    LD_HL(input_buffer_address);
    BIT_1_pHLp();
    JR_Z('00');if3 = PC;
        CALL(handle_left);
    end3 = PC;rom(if3)=end3-if3;
JR('00'); else2_2 = PC; rom(if2) = else2_2 - if2;
BIT_2_A();
JR_NZ('00'); if2 = PC;
    LD_HL(input_buffer_address);
    BIT_2_pHLp();
    JR_Z('00');if3 = PC;
        CALL(handle_up);
    end3 = PC;rom(if3)=end3-if3;
JR('00'); else2_3 = PC; rom(if2) = else2_3 - if2;
BIT_3_A();
JR_NZ('00'); if2 = PC;
    LD_HL(input_buffer_address);
    BIT_3_pHLp();
    JR_Z('00');if3 = PC;
        CALL(handle_down);
    end3 = PC;rom(if3)=end3-if3;
endif2 = PC; rom(if2) = endif2 - if2;
rom(else2_1) = endif2-else2_1;
rom(else2_2) = endif2-else2_2;
rom(else2_3) = endif2-else2_3;

LD_HL(input_buffer_address);
LD_pHLp_A();

CALL(check_win);

POP_HL();
POP_DE();
POP_BC();
POP_AF();

RET();