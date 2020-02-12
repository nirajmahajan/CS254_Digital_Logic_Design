-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity cla is
	port (A, B: in std_logic_vector(7 downto 0); S: out std_logic_vector(8 downto 0));
end entity cla;

architecture Behavioural of cla is
signal P, G, C: std_logic_vector(7 downto 0);
begin
	P <= A xor B;
	G <= A and B;
	C(0) <= '0';
	S(0) <= P(0) xor C(0);
	C(1) <= G(0) or (P(0) and C(0));
	S(1) <= P(1) xor C(1);
	C(2) <= G(1) or (P(1) and C(1));
	S(2) <= P(2) xor C(2);
	C(3) <= G(2) or (P(2) and C(2));
	S(3) <= P(3) xor C(3);
	C(4) <= G(3) or (P(3) and C(3));
	S(4) <= P(4) xor C(4);
	C(5) <= G(4) or (P(4) and C(4));
	S(5) <= P(5) xor C(5);
	C(6) <= G(5) or (P(5) and C(5));
	S(6) <= P(6) xor C(6);
	C(7) <= G(6) or (P(6) and C(6));
	S(7) <= P(7) xor C(7);
	S(8) <= G(7) or (P(7) and C(7));
end Behavioural;