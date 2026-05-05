library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity ALU is
    port (
        A, B : in std_logic_vector(7 downto 0);
        OpCode : in std_logic_vector(3 downto 0);
        Result : out std_logic_vector(7 downto 0);
        Overflow , Negative, Zero : out std_logic
    );
end entity;

architecture rtl of ALU is
    signal decoded : std_logic_vector(15 downto 0);
    signal result_au, result_and, result_or, result_ls, result_rs, result_rv, C, m, n, o, p, q, r: std_logic_vector(7 downto 0);
    signal overflow_au , negative_au, zero_au , overflow_ls, overflow_rs : std_logic;
    constant off : std_logic := '0';
    
begin
    four_bit_decoder_inst: entity work.four_bit_decoder
     port map(
        A => OpCode,
        B => decoded
    );

    G0: for i in 0 to 7 generate
        C(i) <= (B(i) and (not (decoded(11) or decoded(12))))or (A(i) and (decoded(11) or decoded(12)));
    end generate G0;


    arithmetic_unit_inst: entity work.arithmetic_unit
     port map(
        subtract =>  decoded(2) or decoded(3) or decoded(5) or decoded(11) or decoded(12), --Sub, borrow sub, decrement, ones, twos
        carry_in => decoded(1) or decoded(3) or decoded(4) or  decoded(5) or decoded(11), --carry add, borrow sub, increment, decrement, ones
        single => decoded(4) or decoded(5), --increment, decrement
        x => decoded(7), --XOR
        xn => decoded(8), --XNOR
        ones => decoded(11) or decoded(12), --ones, twos
        compare => decoded(6), --compare
        A => A,
        B => C,
        overflow => overflow_au,
        negative => negative_au,
        zero => zero_au,
        C => result_au
    );


    G1 : for i in 0 to 7 generate
        m(i) <= (result_au(i) and (decoded(0) or decoded(1) or decoded(2) or decoded(3) or decoded(4) or decoded(5) or decoded(6) or decoded(7) or decoded(8) or decoded(11) or decoded(12)));
    end generate G1;   

    result_and <= A and B; --bitwise and
    result_or <= A or B; --bitwise or

    G2 : for i in 0 to 6 generate -- left shift
        result_ls(i+1) <= A(i);
    end generate G2;
    overflow_ls <= A(7);
    result_ls(0) <= off;

    G3 : for i in 1 to 7 generate -- right shift
        result_rs(i-1) <= A(i);
    end generate G3;
    overflow_rs <= A(0);
    result_rs(7) <= off;

    G4 : for i in 0 to 7 generate -- reverse
        result_rv(7-i) <= A(i);
    end generate G4;



    G5 : for i in 0 to 7 generate
        n(i) <= result_and(i) and decoded(9);
    end generate G5;

    G6 : for i in 0 to 7 generate
        o(i) <= result_or(i) and decoded(10);
    end generate G6;

    G7 : for i in 0 to 7 generate
        p(i) <= result_ls(i) and decoded(13);
    end generate G7;

    G8 : for i in 0 to 7 generate
        q(i) <= result_rs(i) and decoded(14);
    end generate G8;  
    
    G9 : for i in 0 to 7 generate
        r(i) <= result_rv(i) and decoded(15);
    end generate G9;  

    Gr : for i in 0 to 7 generate
        Result(i) <= m(i)or n(i) or o(i) or p(i) or q(i) or r(i);
    end generate Gr;



    Zero<= zero_au and (decoded(0) or decoded(1)  or decoded(2)  or decoded(3)  or decoded(4)  or decoded(5)  or decoded(6));
    Overflow<= (overflow_au and (decoded(0) or decoded(1) or decoded(4) or decoded(6))) or (overflow_ls and decoded(13)) or (overflow_rs and decoded(14));
    Negative<= (negative_au and (decoded(2) or decoded(3) or decoded(5) or decoded(6)));
    
    
end architecture;

