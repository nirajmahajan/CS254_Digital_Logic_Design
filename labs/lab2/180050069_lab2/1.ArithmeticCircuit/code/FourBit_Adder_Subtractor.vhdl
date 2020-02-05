library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
use work.FullAdder.all;

package FourBit_Adder_Subtractor is
	component Adder_Subtractor is
		port (A0, A1, A2, A3, B0, B1, B2, B3, Control: in std_logic; D0, D1, D2, D3, D4 : out std_logic);
	end component Adder_Subtractor;
end package FourBit_Adder_Subtractor;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
use work.FullAdder.all;
entity Adder_Subtractor is
	port (A0, A1, A2, A3, B0, B1, B2, B3, Control: in std_logic; D0, D1, D2, D3, D4 : out std_logic);
end entity Adder_Subtractor;

architecture Struct of Adder_Subtractor is
signal nB0 : std_logic;
signal nB1 : std_logic;
signal nB2 : std_logic;
signal nB3 : std_logic;
signal connect1 : std_logic;
signal connect2 : std_logic;
signal connect3 : std_logic;
begin
	NO0 : XOR_2 port map(A => Control, B => B0, Y => nB0);
	FA0 : myFullAdder port map(X => A0, Y => nB0, Cin => Control, S => D0, C => connect1);
	NO1 : XOR_2 port map(A => Control, B => B1, Y => nB1);
	FA1 : myFullAdder port map(X => A1, Y => nB1, Cin => connect1, S => D1, C => connect2);
	NO2 : XOR_2 port map(A => Control, B => B2, Y => nB2);
	FA2 : myFullAdder port map(X => A2, Y => nB2, Cin => connect2, S => D2, C => connect3);
	NO3 : XOR_2 port map(A => Control, B => B3, Y => nB3);
	FA3 : myFullAdder port map(X => A3, Y => nB3, Cin => connect3, S => D3, C => D4);
end Struct;
