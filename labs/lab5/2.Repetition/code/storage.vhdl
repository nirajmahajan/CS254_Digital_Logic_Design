library ieee;
use ieee.std_logic_1164.all;
library work;

entity storage is
	port(reset, clk: in std_logic; curr: in std_logic_vector(7 downto 0);
			outp: out std_logic_vector(7 downto 0));
end entity;

architecture Behavioral of storage is
signal state, next_state: std_logic_vector(7 downto 0);
begin	
	-- Memory logic
	p1: process (clk,reset)
	begin
		if (reset = '1') then
			state <= "XXXXXXXX";
		elsif (clk'event and clk = '1') then
			state <= next_state;
		end if;
	end process;
	
	-- NSL
	p2: process (curr, state)
	begin
		next_state <= curr;
	end process;
	
	-- Output Logic
	outp <= state;
	
	
end architecture;
