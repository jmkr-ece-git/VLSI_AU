library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port (
        clk_i   : in  std_logic;
        rst_ni  : in  std_logic;
        count_o : out std_logic_vector(7 downto 0)
    );
end entity counter;

architecture rtl of counter is

    signal count_reg : unsigned(7 downto 0);

begin

    count_o <= std_logic_vector(count_reg);

    process (clk_i)
    begin
        if rising_edge(clk_i) then
            if rst_ni = '1' then
                count_reg <= (others => '0');
            else
                count_reg <= count_reg + 1;
            end if;
        end if;
    end process;

end architecture;