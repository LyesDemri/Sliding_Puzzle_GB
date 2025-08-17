disp(['LSFR next subroutine: ' dec2hex(PC,4)]);
LSFR_next = dec2hex(PC,4);

PUSH_AF();

%get bit 0 of LSFR into C
LD_A('01');
AND_A_B();
LD_C_A();

%get bit 2 of LSFR into A
LD_A('04');
AND_A_B();
SRA_A();
SRA_A();

%XOR A and C (AND bits 0 and 2 of LSFR)
XOR_A_C();
LD_C_A();   %store result into C

%get bit 3 of LSFR into A
LD_A('08');
AND_A_B();
SRA_A();
SRA_A();
SRA_A();

%XOR A and C (bit 3 of LSFR with previous temporary result)
XOR_A_C();
LD_C_A();   %store result

%get bit 4 of LSFR into A
LD_A('10');
AND_A_B();
SRA_A();
SRA_A();
SRA_A();
SRA_A();

%XOR A and C (bit 4 of LSFR with previous temporary result)
XOR_A_C();
LD_C_A();   %store result

%Right shift register B
SRA_B();

BIT_0_C();
JR_Z('00'); if1 = PC;
    %si c'est 1, mettre le bit 7 de B à 1, sinon à 0
    SET_7_B();
JR('00');else1 = PC; rom(if1) = else1 - if1;
    RES_7_B();
end1 = PC; rom(else1) = end1 - else1;
%Mettre tout ce code dans une fonction qui s'appelle "LSFR_Step" wella

POP_AF();

RET();