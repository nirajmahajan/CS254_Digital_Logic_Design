-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity pencoder8x2 is
	port (En: in std_logic; 
			D: in std_logic_vector(0 to 7);
			X, Y, Z, V: out std_logic);
end entity pencoder8x2;

architecture Struct of pencoder8x2 is
signal Ol1, Ol2, Or1, Or2, V1, V2, notv1 : std_logic;
signal andz1, andz2, andy1, andy2 : std_logic;
begin
	Peng1 : entity work.pencoder4x2 port map(En, D(3), D(2), D(1), D(0), Ol2, Ol1, V2);
	Peng2 : entity work.pencoder4x2 port map(En, D(7), D(6), D(5), D(4), Or2, Or1, V1);
	org1 : entity work.myor port map(V1, V2, V);
	X <= V1;
	Notg1 : entity work.mynot port map(V1, notv1);
	Andg1 : entity work.myand port map(V1, Or1, andz1);
	Andg2 : entity work.myand port map(notV1, Ol1, andz2);
	Org2 : entity work.myor port map(andz1, andz2, Z);
	Andg3 : entity work.myand port map(V1, Or2, andy1);
	Andg4 : entity work.myand port map(notV1, Ol2, andy2);
	Org3 : entity work.myor port map(andy1, andy2, Y);
end Struct;