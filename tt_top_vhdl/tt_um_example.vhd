library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tt_um_example is
  port (
    ui_in  : in  std_logic_vector(7 downto 0);  -- Dedicated inputs
    uo_out : out std_logic_vector(7 downto 0);  -- Dedicated outputs

    uio_in  : in  std_logic_vector(7 downto 0); -- IOs: Input path
    uio_out : out std_logic_vector(7 downto 0); -- IOs: Output path
    uio_oe  : out std_logic_vector(7 downto 0); -- IOs: Enable (1=output)

    ena   : in  std_logic;  -- always '1' when powered (ignored)
    clk   : in  std_logic;  -- clock (unused here)
    rst_n : in  std_logic   -- active-low reset (unused here)
  );
end entity tt_um_example;

architecture rtl of tt_um_example is
  -- Local 'keep' signal to consume otherwise unused inputs
  signal unused_keep : std_logic;
begin
  -- Sum of ui_in and uio_in (8-bit modulo add)
  uo_out <= std_logic_vector(unsigned(ui_in) + unsigned(uio_in));

  -- Tie-offs for unused IO outputs and output enables
  uio_out <= (others => '0');
  uio_oe  <= (others => '0');

  -- Consume unused inputs to prevent warnings
  -- (AND-reduction style similar to Verilog &{...})
  unused_keep <= ena and clk and rst_n and '0';
end architecture rtl;