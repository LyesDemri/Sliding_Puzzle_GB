disp(['draw grid subroutine: ' dec2hex(PC,4)]);
draw_grid = dec2hex(PC,4);

PUSH_AF();
PUSH_BC();
PUSH_DE();
PUSH_HL();

%write grid
LD_HL(display_grid_flag_address);
BIT_0_pHLp();
JR_Z('00'); if1 = PC;
  LD_HL(grid_address);
  LD_DE('98A8');%98A8 for center of screen
  LD_B('04');
  loop1 = dec2hex(PC,4);
    LD_C('04');
    loop2 = dec2hex(PC,4);
      LD_A_pHLp();
      LD_pDEp_A();
      INC_HL();
      INC_DE();
      DEC_C();
    JP_NZ(loop2);
    LD_A('1C');%DE += 1C
    ADD_A_E();
    LD_E_A();
    LD_A('00');
    ADC_A_D();
    LD_D_A();
    DEC_B();
  JP_NZ(loop1);
endif1 = PC; rom(if1) = endif1 - if1;

LD_HL(random_number_address);
INC_pHLp();

POP_HL();
POP_DE();
POP_BC();
POP_AF();

RET();