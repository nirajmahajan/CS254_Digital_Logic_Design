library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;

package TwoBit_Multiplier is
	component Multiplier is
		port (A0, A1, B0, B1: in std_logic; D0, D1, D2, D3 : out std_logic);
	end component Multiplier;
end package TwoBit_Multiplier;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
entity Multiplier is
	port (A0, A1, B0, B1: in std_logic; D0, D1, D2, D3 : out std_logic);
end entity Multiplier;

architecture Struct of Multiplier is
signal a1b0 : std_logic;
signal a0b1 : std_logic;
signal b0b1 : std_logic;
signal connect1 : std_logic;
begin
	Ad1 : AND_2 port map(A => A1, B => B0, Y => a1b0);
	Ad2 : AND_2 port map(A => A0, B => A1, Y => D0);
	Ad3 : AND_2 port map(A => A0, B => B1, Y => a0b1);
	Ad4 : AND_2 port map(A => B0, B => B1, Y => b0b1);
	HA1 : HALF_ADDER port map(A => a1b0, B => a0b1, S => D1, C => connect1);
	HA2 : HALF_ADDER port map(A => connect1, B => b0b1, S => D2, C => D3);
end Struct;
