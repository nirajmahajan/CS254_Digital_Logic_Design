-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Multiplexer.all;

entity myXor is
	port (I1, I2: in std_logic; O1: out std_logic);
end entity myXor;

architecture Struct of myXor is
signal const1: std_logic := '1';
signal const0: std_logic := '0';
signal wire1: std_logic;
signal wire2: std_logic;
begin
	M1 : MUX port map(l => const1, r => const0, c => I2, myout => wire2);
	M2 : MUX port map(l => const0, r => const1, c => I2, myout => wire1);
	M3 : MUX port map(l => wire1, r => wire2, c => I1, myout => O1);
end Struct;