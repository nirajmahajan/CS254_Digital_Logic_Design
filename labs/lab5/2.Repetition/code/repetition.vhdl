library ieee;
use ieee.std_logic_1164.all;
library work;

entity repetition is
	port(reset, clk: in std_logic; in_text: in std_logic_vector(119 downto 0);
			valid : out std_logic;
			outp: out std_logic_vector(3 downto 0));
end entity;

architecture Behavioral of repetition is
signal state, next_state: integer := 112;
signal curr, prev: std_logic_vector(7 downto 0);
signal temp: std_logic_vector(3 downto 0);
signal check, val_temp: std_logic := '0';
begin	
	-- Memory logic
	p1: process (clk,reset)
	begin
		if (reset = '1') then
			state <= 112;
		elsif (clk'event and clk = '1') then
			state <= next_state;
		end if;
	end process;
	
	-- NSL
	p2: process (state)
	begin
		if state = 0 then
			next_state <= 112;
		else
			next_state <= state - 8;
		end if;
	end process;
	
	-- Output Logic
	curr <= in_text(state+7 downto state);
	val_temp <= '0' when (state = 112) else (not check);
	outp <= temp when (val_temp = '1') else ("0000");
	valid <= '0' when (state = 112) else (not check);
	Store1 : entity work.storage  port map(reset, clk, curr, prev);
	Comp1 : entity work.comparator port map(curr, prev, check);
	Counter1 : entity work.counter port map(reset, clk, check, temp);
	
	
end architecture;
