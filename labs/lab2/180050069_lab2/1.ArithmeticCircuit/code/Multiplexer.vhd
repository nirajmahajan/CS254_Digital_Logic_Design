library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;

package Multiplexer is
	component ThreeMUX is
		port (as, nan, mul, ms1, ms0: in std_logic; myout : out std_logic);
	end component ThreeMUX;
end package Multiplexer;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
entity ThreeMUX is
	port (as, nan, mul, ms1, ms0: in std_logic; myout : out std_logic);
end entity ThreeMUX;

architecture Struct of ThreeMUX is
signal nots0, nots1 : std_logic;
signal markas, valas : std_logic;
signal marknan, valnan : std_logic;
signal markmul, valmul : std_logic;
signal tempmarkas0, tempmarkas1 : std_logic;
signal temp1 : std_logic;
begin
	I0 : INVERTER port map(ms0, nots0);
	I1 : INVERTER port map(ms1, nots1);
	A1 : AND_2 port map(nots0, nots1, tempmarkas0);
	A35 : AND_2 port map(nots1, ms0, tempmarkas1);
	O35 : OR_2 port map(tempmarkas0, tempmarkas1, markas);
	A2 : AND_2 port map(ms1, nots0, marknan);
	A3 : AND_2 port map(ms0, ms1, markmul);
	
	A4 : AND_2 port map(markas, as, valas);
	A5 : AND_2 port map(marknan, nan, valnan);
	A6 : AND_2 port map(markmul, mul, valmul);
	
	O1 : OR_2 port map(valas, valnan, temp1);
	O2 : OR_2 port map(temp1, valmul, myout);
end Struct;
