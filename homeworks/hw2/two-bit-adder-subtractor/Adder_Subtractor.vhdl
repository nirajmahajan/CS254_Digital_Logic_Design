library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
use work.FullAdder.all;

package TwoBit_Adder_Subtractor is
	component Adder_Subtractor is
		port (A0, A1, B0, B1, Control: in std_logic; D0, D1, D2 : out std_logic);
	end component Adder_Subtractor;
end package TwoBit_Adder_Subtractor;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
use work.FullAdder.all;
entity Adder_Subtractor is
	port (A0, A1, B0, B1, Control: in std_logic; D0, D1, D2 : out std_logic);
end entity Adder_Subtractor;

architecture Struct of Adder_Subtractor is
signal nB0 : std_logic;
signal nB1 : std_logic;
signal connect1 : std_logic;
signal connect2 : std_logic;
begin
	NO0 : XOR_2 port map(A => Control, B => B0, Y => nB0);
	FA0 : myFullAdder port map(X => A0, Y => nB0, Cin => Control, S => D0, C => connect1);
	NO1 : XOR_2 port map(A => Control, B => B1, Y => nB1);
	FA1 : myFullAdder port map(X => A1, Y => nB1, Cin => connect1, S => D1, C => D2);
end Struct;
