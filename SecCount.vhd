Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity SecCount is
   Port( KEY : in std_logic_vector(2 downto 0);
	 --Y : out unsigned(5 downto 0) 
	 hex0, hex1, hex2, hex3: OUT unsigned(6 downto 0));
End Entity SecCount;


Architecture Behaviour of SecCount is
	Signal D, Y : unsigned(5 downto 0) := to_unsigned(58, 6);
	Signal MuxOut, Ch0, Ch1 : unsigned(5 downto 0);
	Signal ChanSel : std_logic;
	Signal clock, clear, enable : std_logic;
Begin
clock <= KEY(0);
clear <= KEY(1);
enable <= KEY(2);

PROCESS (clock)
BEGIN
	IF (clock'EVENT AND clock = '1') THEN
		IF (clear ='1') THEN
			Y <= (others => '0');
		ELSIF (enable ='1') THEN
			Y <= D ; 
		END IF;
	END IF;
END PROCESS;


MUX:		MuxOut <= Ch0 when ChanSel = '0' else Ch1;
		D <= MuxOut;
		Ch1 <= (others => '0');

Incrementer:	Entity work.Inc6 port map ( X => Q, Y => Ch0 );
LimitTest:	Entity work.Over59 port map ( X => Q, o59 => ChanSel );
step: Entity work.DispFrac port map (SW => Y, HEX0=> hex0, HEX1=> hex1, HEX2=> hex2, HEX3=>hex3);

End Architecture Behaviour;