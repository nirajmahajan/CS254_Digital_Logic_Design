library ieee;
use ieee.std_logic_1164.all;
library work;

entity word_counter is
	port(reset, clk: in std_logic; in_text: in std_logic_vector(119 downto 0);
			outp: out std_logic_vector(3 downto 0));
end entity;

architecture Behavioral of word_counter is
signal state, next_state: integer := 0;
signal curr: std_logic_vector(7 downto 0);
signal check: std_logic := '0';
begin	
	-- Memory logic
	p1: process (clk,reset)
	begin
		if (reset = '1') then
			state <= 0;
		elsif (clk'event and clk = '1') then
			state <= next_state;
		end if;
	end process;
	
	-- NSL
	p2: process (state)
	begin
		if state = 119 then
			next_state <= 0;
		else
			next_state <= state + 8;
		end if;
	end process;
	
	-- Output Logic
	curr <= in_text(state+7 downto state);
	Comp1 : entity work.comparator port map(curr, "00100000", check);
	Counter1 : entity work.counter port map(reset, clk, check, outp);
	
	
end architecture;
