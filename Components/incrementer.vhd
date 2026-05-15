library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity incrementer is
    port (
        A : in std_logic_vector(15 downto 0);
        O : out std_logic_vector(15 downto 0)
    );
end entity;

architecture rtl of incrementer is
    signal chain : std_logic_vector(16 downto 0);
    
begin
    chain(0) <= '1';
    G1: for i in 0 to 15 generate
        add:entity work.fullAdder
            port  map(
                A => A(i),
                B => '0',
                Carry_In => chain(i),
                sum => O(i),
                carry_out => chain(i+1)
                
            );
        end generate G1;

end architecture;
