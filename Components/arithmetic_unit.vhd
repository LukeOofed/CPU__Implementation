library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity arithmetic_unit is
    port (
        subtract, carry_in, single, x,xn,ones,compare : in std_logic;
        A , B : in std_logic_vector(15 downto 0);

        overflow, negative, zero: out std_logic;

        C : out std_logic_vector(15 downto 0)

        
    );
end entity;

architecture rtl of arithmetic_unit is
    signal chain : std_logic_vector(16 downto 0);
    signal sum : std_logic_vector(15 downto 0);
    signal m, n, o : std_logic;
    
    
begin

    m<= subtract or compare;
    chain(0) <= m xor carry_in;
    n<= x or xn;
    

    G1: for i in 0 to 15 generate
        SAX:entity work.Subtract_Add_XOR
            port  map(
                a => A(i),
                b => B(i),
                a_disable => ones,
                b_disable => single,
                subtract => m,
                carry_in => chain(i),
                carry_disable => n,
                flood_carry => xn,

                sum => sum(i),
                carry_out => chain(i+1)
                
            );
        end generate G1;



    negative <= m and (not chain(16));
    zero <= (not (m xor chain(16))) and (not (sum(0) or sum(1) or sum(2) or sum(3) or sum(4) or sum(5) or sum(6) or sum(7) or sum(8) or sum(9) or sum(10) or sum(11) or sum(12) or sum(13) or sum(14) or sum(15)));
    overflow <= (not (zero and compare)) and (chain(16));
            
    G2: for i in 0 to 15 generate
        C(i)<= (A(i) and compare) or (sum(i) and (not compare));
    end generate G2;

end architecture;