-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity decoder is
	port (I1, I0: in std_logic; A, B, C, D: out std_logic);
end entity decoder;

architecture Behavioural of decoder is

begin
	A <= I0 or I1;
	B <= I1 or (not I0);
	C <= (not I1) or I0;
	D <= (not I0) or (not I1);
end Behavioural;