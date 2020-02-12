-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity alu is
	port (A, B: in std_logic_vector(7 downto 0); S1, S0: in std_logic; D1: out std_logic_vector(8 downto 0); ZF: out std_logic);
end entity alu;

architecture Behavioural of alu is
shared variable B2, asG: std_logic_vector(7 downto 0);
shared variable asP, asC: std_logic_vector(8 downto 0);
shared variable D: std_logic_vector(8 downto 0);
begin
	process (A, B, S1, S0)
	begin
		-- adder subtractor below
		if (S1 = '0') then
			if (S0 = '0') then
				B2 := B;
				asC(0) := '0';
			else
				B2 := not B;
				asC(0) := '1';
			end if;
			
			asP(8) := '0';
			asP(7 downto 0) := A xor B2;
			asG := A and B2;
			asC(1) := asG(0) or (asP(0) and asC(0));
			asC(2) := asG(1) or (asP(1) and asC(1));
			asC(3) := asG(2) or (asP(2) and asC(2));
			asC(4) := asG(3) or (asP(3) and asC(3));
			asC(5) := asG(4) or (asP(4) and asC(4));
			asC(6) := asG(5) or (asP(5) and asC(5));
			asC(7) := asG(6) or (asP(6) and asC(6));
			asC(8) := asG(7) or (asP(7) and asC(7));
			D := asP xor asC;
		end if;
		
		if (S1 = '1' and S0 = '0') then
			D(8) := '0';
			D(7 downto 0) := A and B;
		end if;
		if (S1 = '1' and S0 = '1') then
			D(8) := '0';
			D(7 downto 0) := A xor B;
		end if;
		
		D1 <= D;
		if(D(7 downto 0) = "00000000") then
			ZF <= '1';
		else
			ZF <= '0';
		end if;
	end process;
end Behavioural;