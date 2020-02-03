-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Multiplexer.all;

entity myBinaryToGrey is
	port (B0, B1, B2: in std_logic; G0, G1, G2: out std_logic);
end entity myBinaryToGrey;

architecture Struct of myBinaryToGrey is
signal const1: std_logic := '1';
signal const0: std_logic := '0';
signal wire1: std_logic;
signal wire2: std_logic;
signal wire3: std_logic;
signal wire4: std_logic;
begin
	G2 <= B2;
	
	M1 : MUX port map(l => const1, r => const0, c => B2, myout => wire2);
	M2 : MUX port map(l => const0, r => const1, c => B2, myout => wire1);
	M3 : MUX port map(l => wire1, r => wire2, c => B1, myout => G1);
	
	M4 : MUX port map(l => const1, r => const0, c => B1, myout => wire3);
	M5 : MUX port map(l => const0, r => const1, c => B1, myout => wire4);
	M6 : MUX port map(l => wire3, r => wire4, c => B0, myout => G0);
end Struct;