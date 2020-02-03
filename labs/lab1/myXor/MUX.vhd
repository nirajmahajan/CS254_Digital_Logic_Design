library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;

package Multiplexer is
	component MUX is
		port (l, r, c: in std_logic; myout : out std_logic);
	end component MUX;
end package Multiplexer;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
entity MUX is
	port (l, r, c: in std_logic; myout : out std_logic);
end entity MUX;

architecture Struct of MUX is
signal s1 : std_logic;
signal notc : std_logic;
signal s2 : std_logic;
begin
	A1 : AND_2 port map(A => r, B => c, Y => s1);
	A2 : AND_2 port map(A => l, B => notc, Y => s2);
	I : INVERTER port map(A => c, Y => notc);
	O : OR_2 port map(A => s1, B => s2, Y => myout);
end Struct;
