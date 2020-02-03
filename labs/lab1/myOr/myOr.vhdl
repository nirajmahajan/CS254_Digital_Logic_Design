-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Multiplexer.all;

entity myOr is
	port (I1, I2: in std_logic; O1: out std_logic);
end entity myOr;

architecture Struct of myOr is
signal const1: std_logic := '1';
signal const0: std_logic := '0';
signal wire1: std_logic;
begin
	M1 : MUX port map(l => wire1, r => const1, c => I1, myout => O1);
	M2 : MUX port map(l => const0, r => const1, c => I2, myout => wire1);
end Struct;