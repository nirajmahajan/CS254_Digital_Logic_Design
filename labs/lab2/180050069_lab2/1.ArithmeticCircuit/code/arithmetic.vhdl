-- Basic Gates file (question 1)
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Multiplexer.all;
use work.BasicGates.all;
use work.BITWISE_NAND.all;
use work.FullAdder.all;
use work.FourBit_Adder_Subtractor.all;
use work.TwoBit_Multiplier.all;


entity arithmetic is
	port (IA0, IA1, IA2, IA3, IB0, IB1, IB2, IB3, S1, S0: in std_logic; D0, D1, D2, D3, D4: out std_logic);
end entity arithmetic;

architecture Struct of arithmetic is
signal oas0, oas1, oas2, oas3, oas4: std_logic;
signal nan0, nan1, nan2, nan3, nan4: std_logic;
signal mul0, mul1, mul2, mul3, mul4: std_logic;
begin
	Multi1 : Multiplier port map(IA0, IA1, IB0, IB1, mul0, mul1, mul2, mul3, mul4);
	Add_sub1 : Adder_Subtractor port map(IA0, IA1, IA2, IA3, IB0, IB1, IB2, IB3, S0, oas0, oas1, oas2, oas3, oas4);
	BWNAND1 : BW_NAND port map(IA0, IA1, IA2, IA3, IB0, IB1, IB2, IB3, nan0, nan1, nan2, nan3, nan4);
	
	TM0 : ThreeMUX port map(oas0, nan0, mul0, S1, S0, D0);
	TM1 : ThreeMUX port map(oas1, nan1, mul1, S1, S0, D1);
	TM2 : ThreeMUX port map(oas2, nan2, mul2, S1, S0, D2);
	TM3 : ThreeMUX port map(oas3, nan3, mul3, S1, S0, D3);
	TM4 : ThreeMUX port map(oas4, nan4, mul4, S1, S0, D4);
	
end Struct;