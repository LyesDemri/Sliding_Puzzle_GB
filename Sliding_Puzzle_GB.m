clear;clc;close all;

path1 = '/MATLAB Drive/Matlab_GB_ROM_Creator';
path2 = 'E:/GBDev/GBROMMaker';
if isfolder(path1)
    addpath(path1);
    path = path1;
elseif isfolder(path2)
    addpath(path2);
    path = path2;
else
    error('You need Matlab_GB_ROM_Creator somewhere to compile this');
end

global rom;
global PC;

rom = zeros(1,2^15);
    
%variable declarations
grid_address = 'C000';
input_buffer_address = 'C010';
spot_x_address = 'C011';
spot_y_address = 'C012';
spot_index_address = 'C013';
random_number_address = 'C014';
game_state_address = 'C015';
display_grid_flag_address = 'C016';

import_register_names;

PC = hex2dec('1000');
vblank_subroutine_script;
turn_off_screen_subroutine_script;
turn_on_screen_subroutine_script;
copy_sprite_subroutine_script;
copy_map_subroutine_script;
clear_screen_script;
draw_grid_subroutine_script;
handle_right_subroutine_script;
handle_left_subroutine_script;
handle_up_subroutine_script;
handle_down_subroutine_script;
LSFR_next_subroutine_script;
generate_random_number_subroutine_script;
make_random_move_subroutine_script;
write_text_subroutine_script;
check_win_subroutine_script;
main_loop_subroutine_script;
shuffle_puzzle_subroutine_script;
congrats_loop_subroutine_script;
title_screen_subroutine_script;
init_game_subroutine_script;

tmp = PC;
PC = hex2dec('40');
CALL(draw_grid);
RETI();
PC = tmp;

alphabet_address = load_alphabet([path '/Alphabet']);
numbers_address = load_numbers([path '/Alphabet']);

disp(['text data starts at: ', dec2hex(PC,4)])

press_a_text_address = write_text_data('PRESS A TO START', press_a_placeholder);
congratulations_text_address = write_text_data('CONGRATULATIONS', congrats_placeholder);
restart_text_address = write_text_data('PRESS A TO RESTART', restart_placeholder);
press_start_text_address = write_text_data('PRESS START TO BEGIN', press_start_placeholder);

title_screen{1} = '   SLIDING PUZZLE';
title_screen{2} = 'MADE BY LYES DEMRI';
title_screen{3} = ['FOR GB COMPO ' double('2025')+7];
title_screen{4} = 'EVERYTHING MADE FROM';
title_screen{5} = 'SCRATCH USING MATLAB';
title_screen{6} = 'NOT LICENCED BY';
title_screen{7} = 'NINTENDO';

for i=1:length(title_screen)
  write_text_data(title_screen{i}, title_screen_placeholders(i));
end


PC = hex2dec('0100');
JP('0150');

PC = hex2dec('0150');

setup_gameboy;

CALL(init_game);

game_loop;

write_header('sliding puzzle');
compute_global_checksum();

fid = fopen('Sliding_Puzzle_GB.gb','w');
fwrite(fid,uint8(rom));
fclose(fid);

disp('done');
