LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;

ENTITY DispFrac IS

PORT (
		SW : IN unsigned(5 downto 0);
		HEX0, HEX1, HEX2, HEX3: OUT unsigned(6 downto 0));
		
END DispFrac;

ARCHITECTURE Behaviour OF DispFrac IS

	SIGNAL repro1, repro2, repro3: unsigned(5 downto 0);  --variables for reprocessing
	SIGNAL dec1, dec2, dec3, dec4: unsigned(3 downto 0);  --decimals to be displayed HEX3 => dec1, HEX2 => dec2, HEX1 => dec3, HEX4 => dec4
	
BEGIN


step1: entity work.TimesTen  PORT MAP(X => SW,     TenX(9 downto 6) => dec1,  TenX(5 downto 0) => repro1);
step2: entity work.TimesTen  PORT MAP(X => repro1, TenX(9 downto 6) => dec2,  TenX(5 downto 0) => repro2);
step3: entity work.TimesTen  PORT MAP(X => repro2, TenX(9 downto 6) => dec3,  TenX(5 downto 0) => repro3);
step4: entity work.TimesTen  PORT MAP(X => repro3, TenX(9 downto 6) => dec4); 


Disp1: entity work.SegDecoder PORT MAP(D => std_logic_vector(dec1), unsigned(Y) => HEX3);
Disp2: entity work.SegDecoder PORT MAP(D => std_logic_vector(dec2), unsigned(Y) => HEX2);
Disp3: entity work.SegDecoder PORT MAP(D => std_logic_vector(dec3), unsigned(Y) => HEX1);
Disp4: entity work.SegDecoder PORT MAP(D => std_logic_vector(dec4), unsigned(Y) => HEX0);

END Behaviour;