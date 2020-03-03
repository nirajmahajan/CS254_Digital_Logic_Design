library ieee;
use ieee.std_logic_1164.all;
library work;

entity counter is
	port(reset, clk: in std_logic; outp: out std_logic_vector(4 downto 0));
end entity;

architecture arc of counter is
signal state, next_state: std_logic_vector(3 downto 0);

begin
	-- Memory logic
	p1: process (clk,reset)
	begin
		if (reset = '1') then
			state <= "0000";
		elsif (clk'event and clk = '1') then
			state <= next_state;
		end if;
	end process;
	
	--Next state logic
	p2: process(state)
	begin
		next_state <= state;
		if state(0) = '0' then
			next_state(0) <= '1';
		else 
			if state(1) = '0' then
				next_state(1 downto 0) <= "10";
			else 
				if state(2) = '0' then
					next_state(2 downto 0) <= "100";
				else 
					if state(3) = '0' then 
						next_state(3 downto 0) <= "1000";
					else
						next_state(3 downto 0) <= "0000";
					end if;
				end if;
			end if;
		end if;
		
	end process;
	
	--Output logic
	p3: process(state)
	begin
		if state = "1111" then
			outp <= "11111";
		else
			outp(3 downto 0) <= state;
			outp(4) <= '0';
		end if;
	end process;
	
end architecture;
