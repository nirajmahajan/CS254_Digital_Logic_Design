library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;

entity Testbench is
end entity;
architecture Behave of Testbench is

  ----------------------------------------------------------------
  --  edit the following lines to set the number of i/o's of your
  --  DUT.
  ----------------------------------------------------------------
  constant number_of_inputs  : integer := 120;  -- # input bits to your design.
  constant number_of_outputs : integer := 4;  -- # output bits from your design.
  ----------------------------------------------------------------
  ----------------------------------------------------------------

  -- Note that you will have to wrap your design into the DUT
  -- as indicated in class.
  component word_counter is
	port(reset, clk: in std_logic; in_text: in std_logic_vector(119 downto 0);
			outp: out std_logic_vector(3 downto 0));
  end component;


	signal input_vector  : std_logic_vector(number_of_inputs-1 downto 0);
	signal output_vector : std_logic_vector(number_of_outputs-1 downto 0);
	signal clk, reset : STD_LOGIC := '0';
  
  -- create a constrained string
  function to_string(x: string) return string is
		variable ret_val: string(1 to x'length);
		alias lx : string (1 to x'length) is x;
  begin  
		ret_val := lx;
		return(ret_val);
  end to_string;

  -- bit-vector to std-logic-vector and vice-versa
  function to_std_logic_vector(x: bit_vector) return std_logic_vector is
	  alias lx: bit_vector(1 to x'length) is x;
	  variable ret_val: std_logic_vector(1 to x'length);
  begin
	  for I in 1 to x'length loop
		  if(lx(I) = '1') then
			 ret_val(I) := '1';
		  else
			 ret_val(I) := '0';
		  end if;
	  end loop; 
	  return ret_val;
  end to_std_logic_vector;

  function to_bit_vector(x: std_logic_vector) return bit_vector is
	  alias lx: std_logic_vector(1 to x'length) is x;
	  variable ret_val: bit_vector(1 to x'length);
  begin
	  for I in 1 to x'length loop
		  if(lx(I) = '1') then
			 ret_val(I) := '1';
		  else
			 ret_val(I) := '0';
		  end if;
	  end loop; 
	  return ret_val;
  end to_bit_vector;

  
begin
  process 
	 variable err_flag : boolean := false;
	 File INFILE: text open read_mode is "C:\Users\niraj\Documents\Niraj\Github\CS254\labs\lab5\1.Word_count\code\TRACEFILE.txt";
	 FILE OUTFILE: text  open write_mode is "C:\Users\niraj\Documents\Niraj\Github\CS254\labs\lab5\1.Word_count\code\OUTPUTFILE.txt";

	 -- bit-vectors are read from the file.
	 variable input_vector_var: bit_vector (number_of_inputs-1 downto 0);
	 -- for read/write.
	 variable INPUT_LINE: Line;
	 variable OUTPUT_LINE: Line;
	 
  begin
	 while not endfile(INFILE) loop 
	  -- will read a new line every 5ns, apply input,
	  -- wait for 1 ns for circuit to settle.
	  -- read output.

	  -- read input at current time.
		readLine (INFILE, INPUT_LINE);
		read (INPUT_LINE, input_vector_var);
	
	  -- apply input.
		input_vector <= to_std_logic_vector(input_vector_var);

	  -- wait for the circuit to settle 
		reset <= '1';
		wait for 20 ns;
		reset <= '0';
		clk <= '0';
		
		write(OUTPUT_LINE, to_bit_vector(output_vector));
		writeline(OUTFILE, OUTPUT_LINE);

	  
		for I in 2 to 15 loop          
			wait for 20ns;
			clk<='1';
			wait for 20ns;
			clk<='0';
			write(OUTPUT_LINE, to_bit_vector(output_vector));
			writeline(OUTFILE, OUTPUT_LINE);
		end loop;
	  
		wait for 4 ns;
      write(OUTPUT_LINE,to_string(" "));
	   writeline(OUTFILE, OUTPUT_LINE);
      write(OUTPUT_LINE, to_bit_vector(output_vector));
	   writeline(OUTFILE, OUTPUT_LINE);
	 end loop;

	report "Done" severity note;

	 wait;
  end process;

	dut_instance: word_counter 
		port map(reset,
					clk,
					input_vector,
					output_vector);

end Behave;
