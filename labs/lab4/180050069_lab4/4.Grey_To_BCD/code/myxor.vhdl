-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity myxor is
	port (G1, G0: in std_logic; O: out std_logic);
end entity myxor;

architecture Behavioural of myxor is
signal notg1, notg0, and1, and2 : std_logic;
begin
	NOT1 : entity work.mynot port map(G1, notg1);
	NOT2 : entity work.mynot port map(G0, notg0);
	Andg1 : entity work.myand port map(G1, notg0, and1);
	Andg2 : entity work.myand port map(G0, notg1, and2);
	Org1 : entity work.myor port map(and1, and2, O);
end Behavioural;