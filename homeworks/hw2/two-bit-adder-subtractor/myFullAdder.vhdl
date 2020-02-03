library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;

package FullAdder is
	component myFullAdder is
		port (X, Y, Cin: in std_logic; S, C : out std_logic);
	end component myFullAdder;
end package FullAdder;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
entity myFullAdder is
	port (X, Y, Cin: in std_logic; S, C : out std_logic);
end entity myFullAdder;

architecture Struct of myFullAdder is
signal xorab : std_logic;
signal xorab_dotc : std_logic;
signal andab : std_logic;
begin
	X1 : XOR_2 port map(A => X, B => Y, Y => xorab);
	A1 : AND_2 port map(A => X, B => Y, Y => andab);
	X2 : XOR_2 port map(A => Cin, B => xorab, Y => S);
	A2 : AND_2 port map(A => xorab, B => Cin, Y => xorab_dotc);
	O : OR_2 port map(A => xorab_dotc, B => andab, Y => C);
end Struct;
