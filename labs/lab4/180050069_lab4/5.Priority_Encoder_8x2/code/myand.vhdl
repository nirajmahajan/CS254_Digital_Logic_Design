-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity myand is
	port (I1, I2: in std_logic; O: out std_logic);
end entity myand;

architecture Struct of myand is
signal temp : std_logic;
begin
	Demux1x2 : entity work.demux1x2 port map(I1, I2, O, temp);
end Struct;