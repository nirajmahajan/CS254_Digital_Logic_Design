-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity demux is
	port (I: in std_logic; S: in std_logic_vector(1 downto 0); O: out std_logic_vector(3 downto 0));
end entity demux;

architecture Behavioural of demux is

begin
	O(0) <= I and (not S(1)) and (not S(0));
	O(1) <= I and (not S(1)) and S(0);
	O(2) <= I and S(1) and (not S(0));
	O(3) <= I and S(1) and S(0);
end Behavioural;