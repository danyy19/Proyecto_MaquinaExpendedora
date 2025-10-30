library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControlSensores is
    port (
        clk                : in std_logic;
        reset              : in std_logic;
        sensor_moneda_5    : in std_logic;
        sensor_moneda_10   : in std_logic;
        sensor_entrega     : in std_logic;
        compra_en_proceso  : in std_logic;
        actualizar_credito : in std_logic;
        monto_compra       : in integer range 0 to 127;
        credito_externo    : in integer range 0 to 99;  -- Nueva entrada para crédito externo
        actualizar_externo : in std_logic;              -- Señal para actualizar con crédito externo
        
        -- Salidas de detección
        moneda_5_detectada  : out std_logic;
        moneda_10_detectada : out std_logic;
        entrega_detectada   : out std_logic;
        
        -- Salidas de estado
        credito_total       : out integer range 0 to 99;
        bloqueo_monedas     : out std_logic;
        bloqueo_entrega     : out std_logic
    );
end entity;

architecture comportamiento of ControlSensores is

    -- Señales para detección de monedas
    signal moneda_5_prev : std_logic := '1';
    signal moneda_10_prev : std_logic := '1';
    signal moneda_5_debounce : std_logic_vector(7 downto 0) := (others => '1');
    signal moneda_10_debounce : std_logic_vector(7 downto 0) := (others => '1');
    signal moneda_5_estable : std_logic := '1';
    signal moneda_10_estable : std_logic := '1';
    signal moneda_5_detectada_int : std_logic := '0';
    signal moneda_10_detectada_int : std_logic := '0';
    signal bloqueo_monedas_int : std_logic := '0';
    signal contador_bloqueo : integer range 0 to 10000000 := 0;  -- 200ms a 50MHz

    -- Señales para sensor de entrega
    signal entrega_prev : std_logic := '1';
    signal entrega_debounce : std_logic_vector(7 downto 0) := (others => '1');
    signal entrega_estable : std_logic := '1';
    signal entrega_detectada_int : std_logic := '0';
    signal bloqueo_entrega_int : std_logic := '0';
    signal contador_bloqueo_entrega : integer range 0 to 10000000 := 0;  -- 200ms a 50MHz

    -- Registro de crédito
    signal credito_total_int : integer range 0 to 99 := 0;

begin

    -- Asignar salidas
    moneda_5_detectada <= moneda_5_detectada_int;
    moneda_10_detectada <= moneda_10_detectada_int;
    entrega_detectada <= entrega_detectada_int;
    credito_total <= credito_total_int;
    bloqueo_monedas <= bloqueo_monedas_int;
    bloqueo_entrega <= bloqueo_entrega_int;

    --------------------------------------------------------------------------
    -- PROCESO PRINCIPAL DE SENSORES
    --------------------------------------------------------------------------
    process(clk, reset)
        variable nuevo_credito : integer range 0 to 99;
        variable moneda_rechazada : std_logic := '0';
    begin
        if reset = '1' then
            -- Reset señales de monedas
            moneda_5_prev <= '1';
            moneda_10_prev <= '1';
            moneda_5_debounce <= (others => '1');
            moneda_10_debounce <= (others => '1');
            moneda_5_estable <= '1';
            moneda_10_estable <= '1';
            moneda_5_detectada_int <= '0';
            moneda_10_detectada_int <= '0';
            bloqueo_monedas_int <= '0';
            contador_bloqueo <= 0;
            
            -- Reset sensor de entrega
            entrega_prev <= '1';
            entrega_debounce <= (others => '1');
            entrega_estable <= '1';
            entrega_detectada_int <= '0';
            bloqueo_entrega_int <= '0';
            contador_bloqueo_entrega <= 0;
            
            -- Reset crédito
            credito_total_int <= 0;
            nuevo_credito := 0;
            moneda_rechazada := '0';
            
        elsif rising_edge(clk) then
            -- Inicializar variables
            nuevo_credito := credito_total_int;
            
            -- ACTUALIZACIÓN DE CRÉDITO DESDE FUENTE EXTERNA (SERVOMOTORES)
            if actualizar_externo = '1' then
                nuevo_credito := credito_externo;
            end if;
            
            -- Resetear detecciones
            moneda_5_detectada_int <= '0';
            moneda_10_detectada_int <= '0';
            entrega_detectada_int <= '0';

            ------------------------------------------------------------------
            -- ACTUALIZACIÓN DE CRÉDITO (RESTAR POR COMPRA)
            ------------------------------------------------------------------
            if actualizar_credito = '1' then
                if nuevo_credito >= monto_compra then
                    nuevo_credito := nuevo_credito - monto_compra;
                else
                    nuevo_credito := 0;  -- Por seguridad
                end if;
            end if;

            ------------------------------------------------------------------
            -- DETECCIÓN DEL SENSOR DE ENTREGA
            ------------------------------------------------------------------
            entrega_debounce <= entrega_debounce(6 downto 0) & sensor_entrega;
            
            -- Determinar estado estable (todos los bits iguales)
            if entrega_debounce = "00000000" then
                entrega_estable <= '0';
            elsif entrega_debounce = "11111111" then
                entrega_estable <= '1';
            end if;
            
            -- Detectar flancos de bajada (1->0) con estado estable
            entrega_prev <= entrega_estable;
            
            -- Control de bloqueo para evitar múltiples detecciones
            if bloqueo_entrega_int = '1' then
                if contador_bloqueo_entrega < 10000000 then  -- 200ms
                    contador_bloqueo_entrega <= contador_bloqueo_entrega + 1;
                else
                    contador_bloqueo_entrega <= 0;
                    bloqueo_entrega_int <= '0';
                end if;
            end if;
            
            -- Detectar entrega solo si no hay bloqueo
            if bloqueo_entrega_int = '0' then
                -- Sensor de entrega: detectar flanco de bajada (producto tomado)
                if entrega_estable = '0' and entrega_prev = '1' then
                    entrega_detectada_int <= '1';
                    bloqueo_entrega_int <= '1';
                    contador_bloqueo_entrega <= 0;
                end if;
            end if;

            ------------------------------------------------------------------
            -- DETECCIÓN DE MONEDAS
            ------------------------------------------------------------------
            moneda_5_debounce <= moneda_5_debounce(6 downto 0) & sensor_moneda_5;
            moneda_10_debounce <= moneda_10_debounce(6 downto 0) & sensor_moneda_10;
            
            -- Determinar estado estable (todos los bits iguales)
            if moneda_5_debounce = "00000000" then
                moneda_5_estable <= '0';
            elsif moneda_5_debounce = "11111111" then
                moneda_5_estable <= '1';
            end if;
            
            if moneda_10_debounce = "00000000" then
                moneda_10_estable <= '0';
            elsif moneda_10_debounce = "11111111" then
                moneda_10_estable <= '1';
            end if;
            
            -- Detectar flancos de bajada (1->0) con estado estable
            moneda_5_prev <= moneda_5_estable;
            moneda_10_prev <= moneda_10_estable;
            
            -- Control de bloqueo para evitar múltiples detecciones
            if bloqueo_monedas_int = '1' then
                if contador_bloqueo < 10000000 then  -- 200ms
                    contador_bloqueo <= contador_bloqueo + 1;
                else
                    contador_bloqueo <= 0;
                    bloqueo_monedas_int <= '0';
                end if;
            end if;
            
            -- Resetear flag de moneda rechazada
            moneda_rechazada := '0';
            
            -- Detectar monedas solo si no hay bloqueo y no hay compra en proceso
            if bloqueo_monedas_int = '0' and compra_en_proceso = '0' then
                -- Moneda de 5: detectar flanco de bajada
                if moneda_5_estable = '0' and moneda_5_prev = '1' then
                    if nuevo_credito <= 90 then  -- 95 - 5 = 90
                        nuevo_credito := nuevo_credito + 5;
                        moneda_5_detectada_int <= '1';
                        bloqueo_monedas_int <= '1';
                        contador_bloqueo <= 0;
                    else
                        -- Crédito lleno, activar devolución
                        moneda_rechazada := '1';
                        bloqueo_monedas_int <= '1';
                        contador_bloqueo <= 0;
                    end if;
                end if;
                
                -- Moneda de 10: detectar flanco de bajada
                if moneda_10_estable = '0' and moneda_10_prev = '1' then
                    if nuevo_credito <= 85 then  -- 95 - 10 = 85
                        nuevo_credito := nuevo_credito + 10;
                        moneda_10_detectada_int <= '1';
                        bloqueo_monedas_int <= '1';
                        contador_bloqueo <= 0;
                    else
                        -- Crédito lleno, activar devolución
                        moneda_rechazada := '1';
                        bloqueo_monedas_int <= '1';
                        contador_bloqueo <= 0;
                    end if;
                end if;
            end if;

            -- Actualizar crédito final
            credito_total_int <= nuevo_credito;
        end if;
    end process;

end architecture;