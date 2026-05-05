library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Subtract_Add_XOR is
    port(
        a,a_disable,b,b_disable,subtract,carry_in,carry_disable,flood_carry: in std_logic;
        sum,carry_out : out std_logic
    );
    end entity;

architecture rtl of Subtract_Add_XOR is
    signal l,m,n,o : std_logic;
begin
    l<= a and (not a_disable);
    n<= ((not carry_disable) and carry_in) or flood_carry;
    m<= ((not b_disable) and b) xor subtract;
    o<= l xor m;
    sum<= o xor n;
    carry_out <= (l and m) or (o and n);
end architecture;
