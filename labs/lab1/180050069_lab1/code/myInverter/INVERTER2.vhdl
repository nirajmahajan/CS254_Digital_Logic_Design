-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Multiplexer.all;

entity INVERTER2 is
	port (I1: in std_logic; out1: out std_logic);
end entity INVERTER2;

architecture Struct of INVERTER2 is
signal l1: std_logic := '1';
signal r1: std_logic := '0';
begin
	M1 : MUX port map(l => l1, r => r1, c => I1, myout => out1);
end Struct;