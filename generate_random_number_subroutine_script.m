disp(['generate random number subroutine: ' dec2hex(PC,4)]);
generate_random_number = dec2hex(PC,4);

LD_HL(random_number_address);
LD_B_pHLp();
CALL(LSFR_next);
LD_pHLp_B();    %store for next time

RET();