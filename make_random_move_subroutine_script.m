disp(['make random move subroutine: ' dec2hex(PC,4)])
make_random_move = dec2hex(PC,4);

PUSH_AF();
PUSH_BC();

%generate random number between 0 and 3
CALL(generate_random_number);
LD_A('03');
AND_A_B();

CP('00');
JR_NZ('00'); if1_1 = PC;
    CALL(handle_right);
    JR('00'); else1_1 = PC; rom(if1_1) = else1_1 - if1_1;
CP('01');JR_NZ('00'); if1_2 = PC;
    CALL(handle_left);
    JR('00'); else1_2 = PC; rom(if1_2) = else1_2 - if1_2;
CP('02');JR_NZ('00'); if1_3 = PC;
    CALL(handle_up);
    JR('00'); else1_3 = PC; rom(if1_3) = else1_3 - if1_3;
CP('03');JR_NZ('00'); if1_4 = PC;
    CALL(handle_down);
    JR('00'); endif1 = PC; rom(if1_4) = endif1 - if1_4;
rom(else1_1) = endif1-else1_1;
rom(else1_2) = endif1-else1_2;
rom(else1_3) = endif1-else1_3;

POP_BC();
POP_AF();

RET();