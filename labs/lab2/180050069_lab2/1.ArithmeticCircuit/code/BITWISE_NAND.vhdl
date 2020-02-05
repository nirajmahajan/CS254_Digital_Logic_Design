library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;

package BITWISE_NAND is
	component BW_NAND is
		port (a0, a1, a2, a3, b0, b1, b2, b3: in std_logic; o0, o1, o2, o3, o4 : out std_logic);
	end component BW_NAND;
end package BITWISE_NAND;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
entity BW_NAND is
	port (a0, a1, a2, a3, b0, b1, b2, b3: in std_logic; o0, o1, o2, o3, o4 : out std_logic);
end entity BW_NAND;

architecture Struct of BW_NAND is
signal s1 : std_logic;
signal notc : std_logic;
signal s2 : std_logic;
begin
	NA0 : NAND_2 port map(A => a0, B => b0, Y => o0);
	NA1 : NAND_2 port map(A => a1, B => b1, Y => o1);
	NA2 : NAND_2 port map(A => a2, B => b2, Y => o2);
	NA3 : NAND_2 port map(A => a3, B => b3, Y => o3);
	o4 <= '0';
end Struct;
