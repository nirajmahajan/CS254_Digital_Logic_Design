library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
use work.Four_bit_Adder.all;

entity Four_bit_Multiplier is
	port (A0, A1, A2, A3, B0, B1, B2, B3: in std_logic; D0, D1, D2, D3, D4, D5, D6, D7 : out std_logic);
end entity Four_bit_Multiplier;

architecture Struct of Four_bit_Multiplier is
signal a0b0, a0b1, a0b2, a0b3 : std_logic;
signal a1b0, a1b1, a1b2, a1b3 : std_logic;
signal a2b0, a2b1, a2b2, a2b3 : std_logic;
signal a3b0, a3b1, a3b2, a3b3 : std_logic;
signal i11, i12, i13, i14 : std_logic;
signal i21, i22, i23, i24 : std_logic;
begin
	Ad11 : AND_2 port map(A => A0, B => B0, Y => a0b0);
	Ad12 : AND_2 port map(A => A0, B => B1, Y => a0b1);
	Ad13 : AND_2 port map(A => A0, B => B2, Y => a0b2);
	Ad14 : AND_2 port map(A => A0, B => B3, Y => a0b3);
	Ad21 : AND_2 port map(A => A1, B => B0, Y => a1b0);
	Ad22 : AND_2 port map(A => A1, B => B1, Y => a1b1);
	Ad23 : AND_2 port map(A => A1, B => B2, Y => a1b2);
	Ad24 : AND_2 port map(A => A1, B => B3, Y => a1b3);
	Ad31 : AND_2 port map(A => A2, B => B0, Y => a2b0);
	Ad32 : AND_2 port map(A => A2, B => B1, Y => a2b1);
	Ad33 : AND_2 port map(A => A2, B => B2, Y => a2b2);
	Ad34 : AND_2 port map(A => A2, B => B3, Y => a2b3);
	Ad41 : AND_2 port map(A => A3, B => B0, Y => a3b0);
	Ad42 : AND_2 port map(A => A3, B => B1, Y => a3b1);
	Ad43 : AND_2 port map(A => A3, B => B2, Y => a3b2);
	Ad44 : AND_2 port map(A => A3, B => B3, Y => a3b3);
	
	D0 <= a0b0;
	FBA1 : Adder port map(a1b0, a2b0, a3b0, '0', a0b1, a1b1, a2b1, a3b1, D1, i11, i12, i13, i14);
	FBA2 : Adder port map(i11, i12, i13, i14, a0b2, a1b2, a2b2, a3b2, D2, i21, i22, i23, i24);
	FBA3 : Adder port map(i21, i22, i23, i24, a0b3, a1b3, a2b3, a3b3, D3, D4, D5, D6, D7);
end Struct;
