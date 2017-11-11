LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY Fcount IS 

PORT (SW : IN unsigned(3 downto 0);
		KEY: IN STD_LOGIC_VECTOR (0 downto 0);
		HEX0, HEX1, HEX2, HEX3: OUT unsigned(6 downto 0));
END Fcount;

ARCHITECTURE Behaviour OF Fcount IS

SIGNAL Temp: UNSIGNED (3 DOWNTO 0) := "0000"; --variable used to consider the increment of 4 MSBs
SIGNAL D:  UNSIGNED (3 DOWNTO 0);
SIGNAL clock : STD_LOGIC;
SIGNAL Y : UNSIGNED (5 DOWNTO 0);
BEGIN

clock <= KEY(0);
D <= SW;  

PROCESS (clock)

BEGIN
	
	IF (clock'EVENT AND clock = '1') THEN --or IF (rising_edge(clock)) THEN 
		
		Temp <= Temp + D;
		
	END IF;
END PROCESS;
Y <= Temp & "00";	--2LSBs of Y will remain 00

step1: entity work.DispFrac PORT MAP(Y, HEX0, HEX1, HEX2, HEX3);

END Behaviour;
