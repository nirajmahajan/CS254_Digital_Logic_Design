-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Multiplexer.all;

entity myFullAdder is
	port (I1, I2, Cin: in std_logic; S1, C1: out std_logic);
end entity myFullAdder;

architecture Struct of myFullAdder is
signal const1: std_logic := '1';
signal const0: std_logic := '0';
signal wire1: std_logic;
signal wire2: std_logic;
signal wire3: std_logic;
signal wire4: std_logic;
signal wire21: std_logic;
signal wire22: std_logic;
signal wire23: std_logic;
signal wire24: std_logic;
signal wire25: std_logic;
begin
	M1 : MUX port map(l => const1, r => const0, c => Cin, myout => wire3);
	M2 : MUX port map(l => const0, r => const1, c => Cin, myout => wire4);
	M3 : MUX port map(l => wire4, r => wire3, c => I2, myout => wire1);
	M4 : MUX port map(l => wire3, r => wire4, c => I2, myout => wire2);
	M5 : MUX port map(l => wire1, r => wire2, c => I1, myout => S1);
	
	M6 : MUX port map(l => const0, r => const1, c => Cin, myout => wire23);
	M7 : MUX port map(l => const0, r => const0, c => Cin, myout => wire24);
	M8 : MUX port map(l => const1, r => const1, c => Cin, myout => wire25);
	M9 : MUX port map(l => wire24, r => wire23, c => I2, myout => wire21);
	M10 : MUX port map(l => wire23, r => wire25, c => I2, myout => wire22);
	M11 : MUX port map(l => wire21, r => wire22, c => I1, myout => C1);
end Struct;