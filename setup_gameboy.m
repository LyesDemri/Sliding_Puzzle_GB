disp(['setup game boy starts at: ' dec2hex(PC,4)]);

CALL(turn_off_screen);

CALL(clear_screen);

%write character tiles in 
LD_BC(numbers_address);LD_DE('8010');%insert at 8300 so it respects ASCII
%10 tiles for number sprites
LD_L('0A');
loop1 = dec2hex(PC,4);
    CALL(copy_sprite);
    DEC_L();
JP_NZ(loop1);

LD_BC(alphabet_address);LD_DE('80B0');%insert at 8410 so it respects ASCII
LD_L('1A'); %26 tiles left for alphabet letters
loop1 = dec2hex(PC,4);
    CALL(copy_sprite);
    DEC_L();
JP_NZ(loop1);

%initialize grid in RAM
LD_A('00');
LD_DE(grid_address);
loop1 = dec2hex(PC,4);
  LD_pDEp_A();
  INC_DE();
  INC_A();
JP_NZ(loop1);

%write grid
CALL(draw_grid);
CALL(turn_on_screen);

%prepare interrupts to draw screen
LD_HL(interrupt_enable)
SET_0_pHLp();

EI();