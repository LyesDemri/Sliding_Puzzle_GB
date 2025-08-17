function fill_placeholder(placeholder,value)
    
global rom;

rom(placeholder) = hex2dec(value(3:4));
rom(placeholder+1) = hex2dec(value(1:2));