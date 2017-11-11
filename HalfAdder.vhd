LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY HalfAdder IS
PORT (
		A,B : IN STD_LOGIC;
		Sum: OUT STD_LOGIC;
		Carry: OUT STD_LOGIC);
		
END HalfAdder;

ARCHITECTURE behaviour of HalfAdder IS

Begin

Sum <= A XOR B ;
Carry <= (A AND B);
END behaviour;
