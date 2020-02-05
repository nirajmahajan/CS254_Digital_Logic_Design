library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
use work.FullAdder.all;

package Four_bit_Adder is
	component Adder is
		port (A0, A1, A2, A3, B0, B1, B2, B3: in std_logic; o0, o1, o2, o3, o4 : out std_logic);
	end component Adder;
end package Four_bit_Adder;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;
use work.FullAdder.all;
entity Adder is
	port (A0, A1, A2, A3, B0, B1, B2, B3: in std_logic; o0, o1, o2, o3, o4 : out std_logic);
end entity Adder;

architecture Struct of Adder is
signal connect1, connect2, connect3 : std_logic;
begin
	FA1 : myFullAdder port map(X => A0, Y => B0, Cin => '0', S => o0, C => connect1);
	FA2 : myFullAdder port map(X => A1, Y => B1, Cin => connect1, S => o1, C => connect2);
	FA3 : myFullAdder port map(X => A2, Y => B2, Cin => connect2, S => o2, C => connect3);
	FA4 : myFullAdder port map(X => A3, Y => B3, Cin => connect3, S => o3, C => o4);
end Struct;
