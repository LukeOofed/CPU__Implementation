library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Program_Counter is
    port (
        clk   : in std_logic;
        reset : in std_logic;
        incr : in std_logic;
        load : in std_logic;
        new_address : in std_logic_vector(15 downto 0);
        output_address : out std_logic_vector(15 downto 0)
    );
end entity;
architecture rtl of Program_Counter is
    signal m, d : std_logic_vector(15 downto 0);
    
begin
    incrementer_inst: entity work.incrementer
     port map(
        A => output_address,
        O => m
    );

    if incr = '1' generate 
        d <= m;
    elsif load = '1' generate
        d <= new_address;
    else generate
        d <= "0000000000000000";
    
    end generate;
    


    register16_inst: entity work.register16
     port map(
        d => d,
        ld => '1',
        clr => '0',
        clk => clk,
        q => output_address
    );
    

end architecture;