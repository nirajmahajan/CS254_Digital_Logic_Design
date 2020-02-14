-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ALU_8.all;

entity bonus is
	port (A, B: in std_logic_vector(7 downto 0);
			S1, S0: in std_logic; 
			D1: out std_logic_vector(8 downto 0); 
			X: out std_logic_vector(2 downto 0));
end entity bonus;

architecture Struct of bonus is
signal ZF1: std_logic;
signal D: std_logic_vector(8 downto 0);
begin
	ALU8 : alu port map(A, B, S1, S0, D, ZF1);
	X <= "001" when (D(8) = '0') else
			"100" when (D(8) = '1' and ZF1 = '0') else
			"010" when (ZF1 = '1') else
			"111";
	
	D1 <= D;
end Struct;