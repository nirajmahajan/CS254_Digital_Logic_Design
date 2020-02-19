-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity demux1x2 is
	port (I, S: in std_logic; A, B: out std_logic);
end entity demux1x2;

architecture Behavioural of demux1x2 is

begin
	B <= I and (not S);
	A <= I and S;
end Behavioural;