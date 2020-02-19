-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity grey2bcd is
	port (G1, G0: in std_logic; A, B, C, D: out std_logic);
end entity grey2bcd;

architecture Behavioural of grey2bcd is
signal notg1, notg0, and1, and2 : std_logic;
signal temp1 : std_logic;
begin
	demux1x20 : entity work.demux1x2 port map('0', '1', B, A);
	demux1x21 : entity work.demux1x2 port map('1', G1, C, temp1);
	Xormy1 : entity work.myxor port map(G0, G1, D);
end Behavioural;