
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arithmetic_unit_tb is
end;

architecture bench of arithmetic_unit_tb is
  -- Clock period
  constant clk_period : time := 5 ns;
  -- Generics
  -- Ports
  signal subtract : std_logic;
  signal carry_in : std_logic;
  signal single : std_logic;
  signal x : std_logic;
  signal xn : std_logic;
  signal ones : std_logic;
  signal compare : std_logic;
  signal A : std_logic_vector(7 downto 0);
  signal B : std_logic_vector(7 downto 0);
  signal overflow : std_logic;
  signal negative : std_logic;
  signal zero : std_logic;
  signal C : std_logic_vector(7 downto 0);
begin

  arithmetic_unit_inst : entity work.arithmetic_unit
  port map (
    subtract => subtract,
    carry_in => carry_in,
    single => single,
    x => x,
    xn => xn,
    ones => ones,
    compare => compare,
    A => A,
    B => B,
    overflow => overflow,
    negative => negative,
    zero => zero,
    C => C
  );
-- clk <= not clk after clk_period/2;

process
  begin
    -- Test Case 1
    A <= "00000100"; B <= "00000011"; carry_in<='0'; subtract<='1'; single<='0'; x<='0'; xn<='0'; compare<='0'; ones<='0';
    wait for 5 ns;
    
    wait for 10 ns;
  report "Final check at " & time'image(now);
  a <= not a; -- Force a final event to "stretch" the timeline
  wait;

    report "Simulation Finished Successfully!";
    wait; -- This stops the simulation from looping forever
  end process;

end;