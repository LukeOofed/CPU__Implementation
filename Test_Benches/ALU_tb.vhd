
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_tb is
end;

architecture bench of ALU_tb is
  -- Clock period
  constant clk_period : time := 5 ns;
  -- Generics
  -- Ports
  signal A : std_logic_vector(15 downto 0);
  signal B : std_logic_vector(15 downto 0);
  signal OpCode : std_logic_vector(3 downto 0);
  signal Result : std_logic_vector(15 downto 0);
  signal Overflow : std_logic;
  signal Negative : std_logic;
  signal Zero : std_logic;
begin

  ALU_inst : entity work.ALU
  port map (
    A => A,
    B => B,
    OpCode => OpCode,
    Result => Result,
    Overflow => Overflow,
    Negative => Negative,
    Zero => Zero
  );
-- clk <= not clk after clk_period/2;
process
  begin
    -- Test Case 1
    A <= "0000000000000100"; B <= "0000000000000011"; OpCode <= "0000"; --Addition
    wait for 5 ns;
    
    A <= "0000000001100100"; B <= "0000000000001111"; OpCode <= "0010"; --subtraction
    wait for 5 ns;

    A <= "0000000000000110"; B <= "0000000000000000"; OpCode <= "0100"; --increment
    wait for 5 ns;

    A <= "0000000000000111"; B <= "0000000000000000"; OpCode <= "0101"; --decrement
    wait for 5 ns;

    A <= "0000000000000111"; B <= "0000000000000111"; OpCode <= "0110"; --compare equals
    wait for 5 ns;

    A <= "0000000000000111"; B <= "0000000000000110"; OpCode <= "0110"; --compare greater than
    wait for 5 ns;

    A <= "0000000000000111"; B <= "0000000000001111"; OpCode <= "0110"; --compare less than
    wait for 5 ns;

    A <= "0000000011111111"; B <= "0000000000011001"; OpCode <= "0111"; --XOR
    wait for 5 ns;

    A <= "0000000011011101"; B <= "0000000000011001"; OpCode <= "1000"; --XNOR
    wait for 5 ns;

    A <= "0000000011111111"; B <= "0000000000011001"; OpCode <= "1001"; --AND
    wait for 5 ns;

    A <= "0000000010010001"; B <= "0000000000011001"; OpCode <= "1010"; --OR
    wait for 5 ns;

    A <= "0000000000110111"; B <= "0000000000000000"; OpCode <= "1011"; --One's
    wait for 5 ns;

    A <= "0000000000000110"; B <= "0000000000000000"; OpCode <= "1100"; --Two's
    wait for 5 ns;

    A <= "0000000010010110"; B <= "0000000000000000"; OpCode <= "1101"; --Left Shift
    wait for 5 ns;

    A <= "0000000010010110"; B <= "0000000000000000"; OpCode <= "1110"; --Right Shift
    wait for 5 ns;

    A <= "0000000000010110"; B <= "0000000000000000"; OpCode <= "1111"; -- Reverse
    wait for 5 ns;
    
    
    wait for 10 ns;
  report "Final check at " & time'image(now);
  a <= not a; -- Force a final event to "stretch" the timeline
  wait;

    report "Simulation Finished Successfully!";
    wait; -- This stops the simulation from looping forever
  end process;
end;