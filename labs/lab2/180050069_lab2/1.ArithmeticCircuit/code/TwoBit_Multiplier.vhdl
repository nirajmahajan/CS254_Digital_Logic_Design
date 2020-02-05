library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;

package TwoBit_Multiplier is
	component Multiplier is
		port (A0, A1, B0, B1: in std_logic; o0, o1, o2, o3, o4 : out std_logic);
	end component Multiplier;
end package TwoBit_Multiplier;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
entity Multiplier is
	port (A0, A1, B0, B1: in std_logic; o0, o1, o2, o3, o4 : out std_logic);
end entity Multiplier;

architecture Struct of Multiplier is
signal a1b0 : std_logic;
signal a0b1 : std_logic;
signal a1b1 : std_logic;
signal connect1 : std_logic;
begin
	Ad1 : AND_2 port map(A => A1, B => B0, Y => a1b0);
	Ad2 : AND_2 port map(A => A0, B => B0, Y => o0);
	Ad3 : AND_2 port map(A => A0, B => B1, Y => a0b1);
	Ad4 : AND_2 port map(A => A1, B => B1, Y => a1b1);
	HA1 : HALF_ADDER port map(A => a1b0, B => a0b1, S => o1, C => connect1);
	HA2 : HALF_ADDER port map(A => connect1, B => a1b1, S => o2, C => o3);
	o4 <= '0';
end Struct;
