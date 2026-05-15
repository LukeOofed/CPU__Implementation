library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity ControlUnit is
    port (
        clk   : in std_logic;
        reset : in std_logic;
        en : in std_logic;
        increment_idx: in std_logic;
        load_idx : in std_logic;
        fetch : out std_logic;
        decode : out std_logic;
        execute : out std_logic;
        instruction_idx : out std_logic_vector(15 downto 0)
        
    );
end entity;


architecture rtl of ControlUnit is
    signal inc_pc : std_logic;
    signal program_counter_feedback : std_logic_vector(15 downto 0);
    
begin

    SystemClock_inst: entity work.SystemClock
     port map(
        clk => clk,
        reset => reset,
        en => en,
        fetch => fetch,
        decode => decode,
        execute => execute,
        inc_pc => inc_pc
    );


    Program_Counter_inst: entity work.Program_Counter
     port map(
        clk => clk,
        reset => reset,
        incr => increment_idx,
        load => load_idx,
        new_address => program_counter_feedback,
        output_address => program_counter_feedback
    );

    instruction_idx <= program_counter_feedback;





end architecture;