function address = write_text_data(text,placeholders)

global rom;
global PC;

address = dec2hex(PC,4);
for i=1:length(placeholders)
  fill_placeholder(placeholders(i), address);
end
rom(PC+1) = length(text); 
PC = PC + 1;
text_bytes = text - double('A') + 11;
text_bytes(text_bytes == -22) = 0;
rom(PC+1:PC+length(text_bytes)) = text_bytes;
PC = PC + length(text_bytes);