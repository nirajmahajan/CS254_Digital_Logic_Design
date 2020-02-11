library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port (IA0, IA1, IA2, IA3, IB0, IB1, IB2, IB3, S1, S0: in std_logic; D0, D1, D2, D3, D4: out std_logic);
end entity ALU;

architecture Behavioral of ALU is
signal ac0, ac1, ac2, ac3: std_logic;
signal sc0, sc1, sc2, sc3: std_logic;
signal s1c0, s1c1, s1c2, s1c3: std_logic;
signal ms0, ms1, ms2, ms3, mc0: std_logic;
signal I1B0, I1B1, I1B2, I1B3: std_logic;
signal I2B0, I2B1, I2B2, I2B3, I2B4: std_logic;
signal aaD0, aaD1, aaD2, aaD3, aaD4: std_logic;
signal ssD0, ssD1, ssD2, ssD3, ssD4: std_logic;
signal nnD0, nnD1, nnD2, nnD3, nnD4: std_logic;
signal mmD0, mmD1, mmD2, mmD3, mmD4: std_logic;
signal mark0, mark1, mark2, mark3: std_logic;
begin
--	add below
	aaD0 <= IA0 xor IB0;
	ac0 <= IA0 and IB0;
	aaD1 <= (IA1 xor IB1) xor ac0;
	ac1 <= (IA1 and IB1) or (IB1 and ac0) or (ac0 and IA1);
	aaD2 <= (IA2 xor IB2) xor ac1;
	ac2 <= (IA2 and IB2) or (IB2 and ac1) or (ac1 and IA2);
	aaD3 <= (IA3 xor IB3) xor ac2;
	ac3 <= (IA3 and IB3) or (IB3 and ac2) or (ac2 and IA3);
	aaD4 <= ac3;
	
--	subtraction below
	--	take 2s complement of B
	I1B0 <= not IB0;
	I1B1 <= not IB1;
	I1B2 <= not IB2;
	I1B3 <= not IB3;
	
	I2B0 <= not I1B0;
	s1c0 <= I1B0;
	I2B1 <= I1B1 xor s1c0;
	s1c1 <= I1B1 and s1c0;
	I2B2 <= I1B2 xor s1c1;
	s1c2 <= I1B2 and s1c1;
	I2B3 <= I1B3 xor s1c2;
	s1c3 <= I1B3 and s1c2;
	I2B4 <= s1c3;	
	
	ssD0 <= IA0 xor I2B0;
	sc0 <= IA0 and I2B0;
	ssD1 <= (IA1 xor I2B1) xor sc0;
	sc1 <= (IA1 and I2B1) or (I2B1 and sc0) or (sc0 and IA1);
	ssD2 <= (IA2 xor I2B2) xor sc1;
	sc2 <= (IA2 and I2B2) or (I2B2 and sc1) or (sc1 and IA2);
	ssD3 <= (IA3 xor I2B3) xor sc2;
	sc3 <= (IA3 and I2B3) or (I2B3 and sc2) or (sc2 and IA3);
	ssD4 <= sc3 xor I2B4;
	
			
--	nand below
	nnD0 <= IA0 nand IB0;
	nnD1 <= IA1 nand IB1;
	nnD2 <= IA2 nand IB2;
	nnD3 <= IA3 nand IB3;
	nnD4 <= '0';
	
--	mult below
	ms0 <= IA0 and IB0;
	ms1 <= IA1 and IB0;
	ms2 <= IA0 and IB1;
	ms3 <= IA1 and IB1;
				
	mmD0 <= ms0;
	mmD1 <= ms1 xor ms2;
	mc0 <= ms1 and ms2;
	mmD2 <= mc0 xor ms3;
	mmD3 <= mc0 and ms3;
	mmD4 <= '0';	
	
	mark0 <= (not S1) and (not S0);
	mark1 <= (not S1) and S0;
	mark2 <= S1 and (not S0);
	mark3 <= S1 and S0;
	
	D0 <= (mark0 and aaD0) or (mark1 and ssD0) or (mark2 and nnD0) or (mark3 and mmD0);
	D1 <= (mark0 and aaD1) or (mark1 and ssD1) or (mark2 and nnD1) or (mark3 and mmD1);
	D2 <= (mark0 and aaD2) or (mark1 and ssD2) or (mark2 and nnD2) or (mark3 and mmD2);
	D3 <= (mark0 and aaD3) or (mark1 and ssD3) or (mark2 and nnD3) or (mark3 and mmD3);
	D4 <= (mark0 and aaD4) or (mark1 and ssD4) or (mark2 and nnD4) or (mark3 and mmD4);
			
end Behavioral;
