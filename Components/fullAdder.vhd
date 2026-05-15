library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity fullAdder is
    port (
        A : in std_logic;
        B : in std_logic;
        Carry_In : in std_logic;
        Sum : out std_logic;
        Carry_Out : out std_logic
    );
end entity;

architecture rtl of fullAdder is
    signal m : std_logic;
    
begin
    m<= A xor B;
    Sum<= m xor Carry_In;
    Carry_Out <= (A and  B) or (m and Carry_In);

end architecture;