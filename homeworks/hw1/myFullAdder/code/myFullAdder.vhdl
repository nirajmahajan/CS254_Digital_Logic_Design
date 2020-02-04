library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;

package FullAdder is
	component myFullAdder is
		port (X, Y, Cin: in std_logic; Sout, Cout : out std_logic);
	end component myFullAdder;
end package FullAdder;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
entity myFullAdder is
	port (X, Y, Cin: in std_logic; Sout, Cout : out std_logic);
end entity myFullAdder;

architecture Struct of myFullAdder is
signal C1 : std_logic;
signal C2 : std_logic;
signal S1 : std_logic;
begin
	HA1 : Half_Adder port map(A => X, B => Y, C => C1, S => S1);
	HA2 : Half_Adder port map(A => S1, B => Cin, C => C2, S => Sout);
	O1 : OR_2 port map(A => C1, B => C2, Y => Cout);
end Struct;
