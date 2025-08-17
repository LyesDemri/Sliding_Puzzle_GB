disp(['Game loop is at: ' dec2hex(PC,4)]);
    
loop = dec2hex(PC,4);
    LD_HL(game_state_address);
    LD_A_pHLp();
    CP('00');
    JP_NZ('0000');if1_1 = PC;
        CALL(title_screen_loop);
    JP('0000'); else1_1 = PC; complete_JP(if1_1, PC);
    CP('01');
    JP_NZ('0000'); if1_2 = PC;
        CALL(shuffle_puzzle);
    JP('0000'); else1_2 = PC; complete_JP(if1_2,PC);
    CP('02');
    JP_NZ('0000'); if1_3 = PC;
        CALL(main_loop);     
    JP('0000'); else1_3 = PC; complete_JP(if1_3,PC);
    CP('03');
    JP_NZ('0000'); if1_4 = PC;
        CALL(congrats_loop);
    endif1 = PC; 
    complete_JP(else1_1,endif1);
    complete_JP(else1_2,endif1);
    complete_JP(else1_3,endif1);
    complete_JP(if1_4,endif1);
JP(loop);

