library ieee;
use ieee.std_logic_1164.all;
library work;

entity comparator is
	port(a1, a2: in std_logic_vector(7 downto 0); outp: out std_logic);
end entity;

architecture arc of comparator is
begin
	process(a1, a2)
		begin
			if (a1 xor a2) = "00000000" then
				outp <= '1';
			else
				outp <= '0';
			end if;	
	end process;
end architecture;
