library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Required for arithmetic operations

entity sync_counter is
    Port ( clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC; -- Asynchronous reset
           en    : in  STD_LOGIC; -- Enable signal
           count : out STD_LOGIC_VECTOR (1 downto 0));
end sync_counter;

architecture Behavioral of sync_counter is
    signal temp_count : unsigned(1 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            temp_count <= (others => '0'); -- Reset to 0
        elsif rising_edge(clk) then
            if en = '1' then
                temp_count <= temp_count + 1; -- Increment on clock edge
            end if;
        end if;
    end process;

    count <= std_logic_vector(temp_count); -- Convert back to vector for output
end Behavioral;
