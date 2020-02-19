-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity mynot is
	port (I: in std_logic; O: out std_logic);
end entity mynot;

architecture Behavioural of mynot is
signal temp1, temp2 : std_logic;
begin
	temp1 <= '1';
	Demux1x2 : entity work.demux1x2 port map(temp1, I, temp2, O);
end Behavioural;