-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity decoder is
	port (I: in std_logic_vector(1 downto 0); O: out std_logic_vector(3 downto 0));
end entity decoder;

architecture Behavioural of decoder is

begin
	O(0) <= I(0) or I(1);
	O(1) <= I(1) or (not I(0));
	O(2) <= (not I(1)) or I(0);
	O(3) <= (not I(0)) or (not I(1));
end Behavioural;