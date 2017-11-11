LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY FullAdder IS
PORT (
		A,B,C : IN STD_LOGIC;
		Sum: OUT STD_LOGIC;
		Carry: OUT STD_LOGIC);
		
END FullAdder;

ARCHITECTURE behaviour of FullAdder IS

Begin

Sum <= A XOR B XOR C;
Carry <= (A AND B) OR (A AND C) OR (B AND C);

END behaviour;
