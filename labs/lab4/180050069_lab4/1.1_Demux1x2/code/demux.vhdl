-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity demux is
	port (I, S: in std_logic; O: out std_logic_vector(1 downto 0));
end entity demux;

architecture Behavioural of demux is

begin
	O(0) <= I and (not S);
	O(1) <= I and S;
end Behavioural;