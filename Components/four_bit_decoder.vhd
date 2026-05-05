library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity four_bit_decoder is
    port (
        A : in std_logic_vector(3 downto 0);
        B : out std_logic_vector(15 downto 0)
    );
end entity;

architecture rtl of four_bit_decoder is

        begin
            B(0)<= (not A(0)) and (not A(1))and (not A(2))and (not A(3));
            B(1)<= (A(0)) and (not A(1))and (not A(2))and (not A(3));
            B(2)<= (not A(0)) and (A(1))and (not A(2))and (not A(3));
            B(3)<= (A(0)) and ( A(1))and (not A(2))and (not A(3));
            B(4)<= (not A(0)) and (not A(1))and ( A(2))and (not A(3));
            B(5)<= ( A(0)) and (not A(1))and ( A(2))and (not A(3));
            B(6)<= (not A(0)) and ( A(1))and ( A(2))and (not A(3));
            B(7)<= ( A(0)) and ( A(1))and ( A(2))and (not A(3));
            B(8)<= (not A(0)) and (not A(1))and (not A(2))and ( A(3));
            B(9)<= ( A(0)) and (not A(1))and (not A(2))and ( A(3));
            B(10)<= (not A(0)) and ( A(1))and (not A(2))and ( A(3));
            B(11)<= ( A(0)) and ( A(1))and (not A(2))and ( A(3));
            B(12)<= (not A(0)) and (not A(1))and ( A(2))and ( A(3));
            B(13)<= ( A(0)) and (not A(1))and ( A(2))and ( A(3));
            B(14)<= (not A(0)) and ( A(1))and ( A(2))and ( A(3));
            B(15)<= ( A(0)) and ( A(1))and ( A(2))and ( A(3));

            
end architecture;