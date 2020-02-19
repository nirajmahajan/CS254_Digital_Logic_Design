-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity myor is
	port (I1, I2: in std_logic; O: out std_logic);
end entity myor;

architecture Struct of myor is
signal andtemp, notI1, notI2 : std_logic;
begin
	Notg1 : entity work.mynot port map(I1, notI1);
	Notg2 : entity work.mynot port map(I2, notI2);
	Andg1 : entity work.myand port map(notI1, notI2, andtemp);
	Notg3 : entity work.mynot port map(andtemp, O);
end Struct;