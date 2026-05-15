library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SystemClock is
    port (
        clk   : in std_logic;
        reset : in std_logic;
        en : in std_logic;
        fetch : out std_logic;
        decode : out std_logic;
        execute : out std_logic;
        inc_pc : out std_logic
    );
end entity;

architecture rtl of SystemClock is

    signal counter_output : std_logic_vector(1 downto 0);
    
    
begin
    
    sync_counter_inst : entity work.sync_counter
        port map (
            clk => clk,
            reset => reset,
            en => en,
            count => counter_output
            
        );



    fetch <= (not counter_output(0)) and (not counter_output(1));
    decode <= (counter_output(0)) and (not counter_output(1));
    execute <= (not counter_output(0)) and (counter_output(1));
    inc_pc <= (counter_output(0)) and (counter_output(1));
        
    
    

end architecture;