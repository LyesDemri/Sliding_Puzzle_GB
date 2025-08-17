function complete_JP(JP_address,target_address)

global rom;

target_address = dec2hex(target_address,4);
rom(JP_address-1) = hex2dec(target_address(3:4));
rom(JP_address) = hex2dec(target_address(1:2));