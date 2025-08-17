disp(['write text subroutine: ' dec2hex(PC,4)])
write_text = dec2hex(PC,4);

PUSH_AF();
PUSH_BC();

%arguments: 
%HL: pointer to first byte in text (length of text)
%DE: address where to write text

LD_C_pHLp();
loop1 = dec2hex(PC,4);
    INC_HL();
    LD_A_pHLp();
    LD_pDEp_A();
    INC_DE();
    DEC_C();
JP_NZ(loop1);

POP_BC();
POP_AF();

RET();