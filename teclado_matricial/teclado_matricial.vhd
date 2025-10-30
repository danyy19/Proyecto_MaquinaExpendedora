-- TECLADO MATRICIAL
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity teclado_matricial is
    port (
        clk          : in std_logic;
        reset        : in std_logic;
        filas_in     : in std_logic_vector(3 downto 0);
        columnas_out : out std_logic_vector(3 downto 0);
        tecla_valida : out std_logic;
        numero_tecla : out integer range 0 to 15
    );
end teclado_matricial;

architecture rtl of teclado_matricial is
    signal contador_scan : integer range 0 to 5000 := 0;
    signal columna_actual : integer range 0 to 3 := 0;
    signal tecla_actual : integer range 0 to 15 := 0;
    signal tecla_anterior : integer range 0 to 15 := 0;
    signal debounce_count : integer range 0 to 10000 := 0;
begin

    process(clk, reset)
    begin
        if reset = '1' then
            contador_scan <= 0;
            columna_actual <= 0;
            tecla_actual <= 0;
            tecla_anterior <= 0;
            debounce_count <= 0;
            tecla_valida <= '0';
            columnas_out <= "1110";
            
        elsif rising_edge(clk) then
            tecla_valida <= '0';
            
            -- Escaneo lento
            if contador_scan < 5000 then
                contador_scan <= contador_scan + 1;
            else
                contador_scan <= 0;
                
                -- Rotar columnas
                case columna_actual is
                    when 0 => columnas_out <= "1110";
                    when 1 => columnas_out <= "1101";
                    when 2 => columnas_out <= "1011";
                    when 3 => columnas_out <= "0111";
                end case;
                
                -- Decodificar tecla
                tecla_actual <= 0; -- Por defecto: no tecla
                
                case columna_actual is
                    when 0 => -- Columna 0: 1,4,7,*
                        if filas_in = "1110" then tecla_actual <= 1;
                        elsif filas_in = "1101" then tecla_actual <= 4;
                        elsif filas_in = "1011" then tecla_actual <= 7;
                        elsif filas_in = "0111" then tecla_actual <= 10; -- *
                        end if;
                        
                    when 1 => -- Columna 1: 2,5,8,0
                        if filas_in = "1110" then tecla_actual <= 2;
                        elsif filas_in = "1101" then tecla_actual <= 5;
                        elsif filas_in = "1011" then tecla_actual <= 8;
                        elsif filas_in = "0111" then tecla_actual <= 0;
                        end if;
                        
                    when 2 => -- Columna 2: 3,6,9,#
                        if filas_in = "1110" then tecla_actual <= 3;
                        elsif filas_in = "1101" then tecla_actual <= 6;
                        elsif filas_in = "1011" then tecla_actual <= 9;
                        elsif filas_in = "0111" then tecla_actual <= 11; -- #
                        end if;
                        
                    when 3 => -- Columna 3: A,B,C,D
                        if filas_in = "1110" then tecla_actual <= 12; -- A
                        elsif filas_in = "1101" then tecla_actual <= 13; -- B
                        elsif filas_in = "1011" then tecla_actual <= 14; -- C
                        elsif filas_in = "0111" then tecla_actual <= 15; -- D
                        end if;
                end case;
                
                -- Anti-rebote
                if tecla_actual = tecla_anterior then
                    if debounce_count < 10000 then
                        debounce_count <= debounce_count + 1;
                    else
                        if tecla_actual /= 0 then
                            tecla_valida <= '1';
                            numero_tecla <= tecla_actual;
                        end if;
                    end if;
                else
                    debounce_count <= 0;
                end if;
                
                tecla_anterior <= tecla_actual;
                
                -- Siguiente columna
                if columna_actual < 3 then
                    columna_actual <= columna_actual + 1;
                else
                    columna_actual <= 0;
                end if;
            end if;
        end if;
    end process;

end rtl;