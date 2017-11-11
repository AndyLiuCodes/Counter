LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;

ENTITY TimesTen  IS

PORT(
		X : IN unsigned (5 downto 0);
	   TenX : OUT unsigned (9 downto 0));
		
END TimesTen;

ARCHITECTURE Behaviour OF TimesTen IS

	SIGNAL Carry: unsigned(9 DOWNTO 0);
	
BEGIN
	TenX(0) <= '0'; --always 0, LSB
	TenX(1) <= X(0);
	TenX(2) <= X(1);
	
	step1: work.HalfAdder Port Map( A => X(0), B => X(2), Sum => TenX(3), Carry => Carry(3));
	step2: work.FullAdder Port Map( A => X(1), B => X(3), C => Carry(3), Sum => TenX(4), Carry => Carry(4));
	step3: work.FullAdder Port Map( A => X(2), B => X(4), C => Carry(4), Sum => TenX(5), Carry => Carry(5));
	step4: work.FullAdder Port Map( A => X(3), B => X(5), C => Carry(5), Sum => TenX(6), Carry => Carry(6));
	step5: work.HalfAdder Port Map( A => X(4), B => Carry(6), Sum => TenX(7), Carry => Carry(7));
	step6: work.HalfAdder Port Map( A => X(5), B => Carry(7), Sum => TenX(8), Carry => Carry(8));
	
	TenX(9) <= Carry(8); --MSB
	
END Behaviour; 

ARCHITECTURE operator OF TimesTen IS
signal a,b: unsigned (8 downto 0)  :=(others=>'0');
signal sum: unsigned (9 downto 0);

BEGIN

a(6 downto 1) <= X;
b(8 downto 3) <=X;
sum <= ('0' & a) + ('0' & b);
TenX <= sum(9 downto 0);

END operator;