library ieee;
use ieee.std_logic_1164.all;

entity DivisorFrecuencia is
    port (
        clk : in std_logic;
        reset : in std_logic;
        clk_1hz : out std_logic
    );
end entity;

architecture comportamiento of DivisorFrecuencia is
    signal contador : integer range 0 to 24999999 := 0;
    signal clk_aux : std_logic := '0';
begin
    process(clk, reset)
    begin
        if reset = '1' then
            contador <= 0;
            clk_aux <= '0';
        elsif rising_edge(clk) then
            if contador = 12499999 then
                contador <= 0;
                clk_aux <= not clk_aux;
            else
                contador <= contador + 1;
            end if;
        end if;
    end process;
    clk_1hz <= clk_aux;
end architecture;