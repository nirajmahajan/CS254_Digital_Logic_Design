-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;

entity pencoder is
	port (En, A, B, C, D: in std_logic; O1, O0, V: out std_logic);
end entity pencoder;

architecture Behavioural of pencoder is

begin
	process(En, A, B, C, D)
	begin
		if (En = '0') then
			V <= '0';
			O1 <= '0';
			O0 <= '0';
		else 
			if (A = '1') then
				V <= '1';
				O1 <= '1';
				O0 <= '1';
			else
				if (B = '1') then
					V <= '1';
					O1 <= '1';
					O0 <= '0';
				else
					if (C = '1') then
						V <= '1';
						O1 <= '0';
						O0 <= '1';
					else
						if (D = '1') then
							V <= '1';
							O1 <= '0';
							O0 <= '0';
						else
							V <= '0';
							O1 <= '0';
							O0 <= '0';
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
end Behavioural;