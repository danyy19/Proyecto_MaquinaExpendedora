library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity filtro_sensor is
    generic(
        N_STABLE     : integer := 3;
        ACTIVE_LEVEL : std_logic := '1'
    );
    port(
        clk       : in  std_logic;
        reset_n   : in  std_logic;
        sensor_in : in  std_logic;
        tick      : in  std_logic;
        pulse_out : out std_logic
    );
end filtro_sensor;

architecture rtl of filtro_sensor is
    signal sync0      : std_logic := '0';
    signal sync1      : std_logic := '0';
    signal sampled    : std_logic := '0';
    signal prev_state : std_logic := '0';
    signal stable_cnt : integer range 0 to N_STABLE := 0;
    signal pulse_i    : std_logic := '0';
begin
    -- Sincronizador para evitar metastabilidad
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            sync0 <= '0'; 
            sync1 <= '0';
        elsif rising_edge(clk) then
            sync0 <= sensor_in;
            sync1 <= sync0;
        end if;
    end process;

    -- Filtro y detección de flanco
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            sampled    <= '0';
            stable_cnt <= 0;
            prev_state <= '0';
            pulse_i    <= '0';
        elsif rising_edge(clk) then
            pulse_i <= '0';
            if tick = '1' then
                if sync1 = ACTIVE_LEVEL then
                    if stable_cnt < N_STABLE then
                        stable_cnt <= stable_cnt + 1;
                    end if;
                else
                    stable_cnt <= 0;
                end if;

                if stable_cnt >= N_STABLE then
                    sampled <= '1';
                else
                    sampled <= '0';
                end if;

                -- Detectar flanco de subida
                if (prev_state = '0' and sampled = '1') then
                    pulse_i <= '1';
                end if;

                prev_state <= sampled;
            end if;
        end if;
    end process;

    pulse_out <= pulse_i;
end rtl;