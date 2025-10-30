library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MaquinaExpendedora is
    port (
        clk                : in std_logic;
        reset              : in std_logic;
        sensor_moneda_5    : in std_logic;
        sensor_moneda_10   : in std_logic;
        teclado_filas      : in std_logic_vector(3 downto 0);
        sensor_entrega     : in std_logic;
        -- Switches para posición del motor
        SW_motor           : in std_logic_vector(3 downto 0);

        teclado_columnas   : out std_logic_vector(3 downto 0);
        display_credito_decenas  : out std_logic_vector(6 downto 0);
        display_credito_unidades : out std_logic_vector(6 downto 0);
        display_fila             : out std_logic_vector(6 downto 0);
        display_columna          : out std_logic_vector(6 downto 0);

        led_entrega_producto : out std_logic;
        led_alerta_motor     : out std_logic;
        led_alerta_credito   : out std_logic;
        led_alerta_stock     : out std_logic;
        led_devolucion       : out std_logic;
        luces_decoracion     : out std_logic;
        
        -- Salidas para servomotores de monedas
        servo_moneda_5     : out std_logic;
        servo_moneda_10    : out std_logic;
        -- Salidas separadas para cada motor de entrega específico
        servo_motor_02     : out std_logic;  -- Motor para artículo "02"
        servo_motor_30     : out std_logic;  -- Motor para artículo "30"
        -- Salida para buzzer
        buzzer_out         : out std_logic   -- Cambié el nombre para evitar conflicto
    );
end entity;

architecture comportamiento of MaquinaExpendedora is

    component Decodificador7seg is
        port (
            numero    : in integer range 0 to 9;
            segmentos : out std_logic_vector(6 downto 0)
        );
    end component;

    component DivisorFrecuencia is
        port (
            clk     : in std_logic;
            reset   : in std_logic;
            clk_1hz : out std_logic
        );
    end component;

    component ControlTecladoStock is
        port (
            clk                : in std_logic;
            reset              : in std_logic;
            teclado_filas      : in std_logic_vector(3 downto 0);
            actualizar_stock   : in std_logic;
            fila_compra        : in integer range 0 to 6;
            columna_compra     : in integer range 0 to 2;
            
            teclado_columnas   : out std_logic_vector(3 downto 0);
            digito_decenas     : out integer range 0 to 9;
            digito_unidades    : out integer range 0 to 9;
            codigo_ingresado   : out integer range 0 to 99;
            precio_actual      : out integer range 0 to 127;
            stock_disponible   : out std_logic;
            key_valid          : out std_logic;
            confirmar_pulsado  : out std_logic;
            devolver_pulsado   : out std_logic
        );
    end component;

    component ControlSensores is
        port (
            clk                : in std_logic;
            reset              : in std_logic;
            sensor_moneda_5    : in std_logic;
            sensor_moneda_10   : in std_logic;
            sensor_entrega     : in std_logic;
            compra_en_proceso  : in std_logic;
            actualizar_credito : in std_logic;
            monto_compra       : in integer range 0 to 127;
            credito_externo    : in integer range 0 to 99;
            actualizar_externo : in std_logic;
            
            moneda_5_detectada  : out std_logic;
            moneda_10_detectada : out std_logic;
            entrega_detectada   : out std_logic;
            credito_total       : out integer range 0 to 99;
            bloqueo_monedas     : out std_logic;
            bloqueo_entrega     : out std_logic
        );
    end component;

    component ControlServomotores is
        port (
            clk                : in std_logic;
            reset              : in std_logic;
            -- Señales de control
            activar_devolucion : in std_logic;
            credito_actual     : in integer range 0 to 99;
            activar_motor_02   : in std_logic;
            activar_motor_30   : in std_logic;
            entrega_completada : in std_logic;
            -- Switches para posición del motor
            SW_motor           : in std_logic_vector(3 downto 0);
            
            -- Salidas a servomotores
            servo_moneda_5     : out std_logic;
            servo_moneda_10    : out std_logic;
            servo_motor_02     : out std_logic;
            servo_motor_30     : out std_logic;
            
            -- Estados y control
            devolucion_en_curso : out std_logic;
            motor_02_activo    : out std_logic;
            motor_30_activo    : out std_logic;
            credito_restante   : out integer range 0 to 99
        );
    end component;

    component BUZZER is
        port (
            CLK   : in std_logic;
            RESET : in std_logic;
            BEEP  : buffer std_logic
        );
    end component;

    -- Señales
    signal clk_1hz : std_logic;
    
    -- Control
    signal compra_en_proceso : std_logic := '0';
    signal precio_actual : integer range 0 to 127 := 0;
    signal stock_disponible : std_logic := '1';
    signal credito_suficiente : std_logic := '0';
    
    -- Estados
    type estado_compra_t is (ESPERA, PROCESANDO, ENTREGANDO, ERROR_CREDITO, ERROR_STOCK);
    signal estado_compra : estado_compra_t := ESPERA;
    signal contador_entrega : integer range 0 to 5 := 0;

    -- Pulsadores del teclado
    signal confirmar_pulsado : std_logic := '0';
    signal devolver_pulsado : std_logic := '0';
    signal confirmar_reg : std_logic := '0';
    signal devolver_reg : std_logic := '0';
    
    -- Para parpadeo del motor
    signal parpadeo_motor : std_logic := '0';
    signal contador_parpadeo : integer range 0 to 1 := 0;

    -- Alertas con temporizadores
    signal contador_alerta_credito : integer range 0 to 3 := 0;
    signal contador_alerta_stock : integer range 0 to 3 := 0;
    signal contador_devolucion : integer range 0 to 4 := 0;

    -- Señales para control de timing
    signal clk_1hz_prev : std_logic := '0';
    signal tick_1hz : std_logic := '0';

    -- Señales del módulo de teclado y stock
    signal digito_decenas   : integer range 0 to 9 := 0;
    signal digito_unidades  : integer range 0 to 9 := 0;
    signal codigo_ingresado : integer range 0 to 99 := 0;
    signal key_valid        : std_logic := '0';

    -- Señales para actualizar stock
    signal actualizar_stock : std_logic := '0';
    signal fila_compra : integer range 0 to 6 := 0;
    signal columna_compra : integer range 0 to 2 := 0;

    -- Señales del módulo de sensores
    signal moneda_5_detectada : std_logic := '0';
    signal moneda_10_detectada : std_logic := '0';
    signal entrega_detectada : std_logic := '0';
    signal credito_total : integer range 0 to 99 := 0;
    signal entrega_detectada_reg : std_logic := '0';
    signal bloqueo_monedas : std_logic := '0';
    signal bloqueo_entrega : std_logic := '0';

    -- Señales para actualizar crédito
    signal actualizar_credito : std_logic := '0';

    -- Señales para servomotores
    signal activar_devolucion : std_logic := '0';
    signal activar_motor_02   : std_logic := '0';
    signal activar_motor_30   : std_logic := '0';
    signal entrega_completada : std_logic := '0';
    signal devolucion_en_curso : std_logic := '0';
    signal motor_02_activo    : std_logic := '0';
    signal motor_30_activo    : std_logic := '0';
    signal credito_restante   : integer range 0 to 99 := 0;

    -- Señales para actualización externa de crédito
    signal actualizar_externo : std_logic := '0';
    signal credito_externo : integer range 0 to 99 := 0;

    -- Señal para controlar el buzzer
    signal buzzer_internal : std_logic := '0';
    signal enable_buzzer : std_logic := '0';

begin

    U_Divisor : DivisorFrecuencia
        port map (clk => clk, reset => reset, clk_1hz => clk_1hz);

    U_TecladoStock : ControlTecladoStock
        port map (
            clk => clk,
            reset => reset,
            teclado_filas => teclado_filas,
            actualizar_stock => actualizar_stock,
            fila_compra => fila_compra,
            columna_compra => columna_compra,
            teclado_columnas => teclado_columnas,
            digito_decenas => digito_decenas,
            digito_unidades => digito_unidades,
            codigo_ingresado => codigo_ingresado,
            precio_actual => precio_actual,
            stock_disponible => stock_disponible,
            key_valid => key_valid,
            confirmar_pulsado => confirmar_pulsado,
            devolver_pulsado => devolver_pulsado
        );

    U_Sensores : ControlSensores
        port map (
            clk => clk,
            reset => reset,
            sensor_moneda_5 => sensor_moneda_5,
            sensor_moneda_10 => sensor_moneda_10,
            sensor_entrega => sensor_entrega,
            compra_en_proceso => compra_en_proceso,
            actualizar_credito => actualizar_credito,
            monto_compra => precio_actual,
            credito_externo => credito_externo,
            actualizar_externo => actualizar_externo,
            moneda_5_detectada => moneda_5_detectada,
            moneda_10_detectada => moneda_10_detectada,
            entrega_detectada => entrega_detectada,
            credito_total => credito_total,
            bloqueo_monedas => bloqueo_monedas,
            bloqueo_entrega => bloqueo_entrega
        );

    U_Servomotores : ControlServomotores
        port map (
            clk => clk,
            reset => reset,
            -- Señales de control
            activar_devolucion => activar_devolucion,
            credito_actual => credito_total,
            activar_motor_02 => activar_motor_02,
            activar_motor_30 => activar_motor_30,
            entrega_completada => entrega_completada,
            -- Switches para posición del motor
            SW_motor => SW_motor,
            
            -- Salidas a servomotores
            servo_moneda_5 => servo_moneda_5,
            servo_moneda_10 => servo_moneda_10,
            servo_motor_02 => servo_motor_02,
            servo_motor_30 => servo_motor_30,
            
            -- Estados y control
            devolucion_en_curso => devolucion_en_curso,
            motor_02_activo => motor_02_activo,
            motor_30_activo => motor_30_activo,
            credito_restante => credito_restante
        );

    -- INSTANCIA DEL BUZZER
    U_Buzzer : BUZZER
        port map (
            CLK   => clk,
            RESET => reset,
            BEEP  => buzzer_internal
        );

    -- CONTROL DE HABILITACIÓN DEL BUZZER
    process(estado_compra, contador_alerta_credito, contador_alerta_stock)
    begin
        if (estado_compra = ERROR_CREDITO and contador_alerta_credito > 0) or
           (estado_compra = ERROR_STOCK and contador_alerta_stock > 0) then
            enable_buzzer <= '1';
        else
            enable_buzzer <= '0';
        end if;
    end process;

    -- ASIGNACIÓN DE SALIDA DEL BUZZER
    buzzer_out <= buzzer_internal when enable_buzzer = '1' else '0';

    -- PROCESO PRINCIPAL UNIFICADO
    process(clk, reset)
        variable fila_int : integer range 0 to 6;
        variable columna_int : integer range 0 to 2;
        variable necesita_motor_02 : std_logic := '0';
        variable necesita_motor_30 : std_logic := '0';
    begin
        if reset = '1' then
            estado_compra <= ESPERA;
            contador_entrega <= 0;
            compra_en_proceso <= '0';
            led_entrega_producto <= '0';
            led_alerta_motor <= '0';
            led_alerta_credito <= '0';
            led_alerta_stock <= '0';
            led_devolucion <= '0';
            contador_alerta_credito <= 0;
            contador_alerta_stock <= 0;
            contador_devolucion <= 0;
            parpadeo_motor <= '0';
            contador_parpadeo <= 0;
            credito_suficiente <= '0';
            clk_1hz_prev <= '0';
            tick_1hz <= '0';
            confirmar_reg <= '0';
            devolver_reg <= '0';
            actualizar_stock <= '0';
            actualizar_credito <= '0';
            fila_compra <= 0;
            columna_compra <= 0;
            entrega_detectada_reg <= '0';
            
            -- Reset servomotores
            activar_devolucion <= '0';
            activar_motor_02 <= '0';
            activar_motor_30 <= '0';
            entrega_completada <= '0';
            
            -- Reset actualización externa
            actualizar_externo <= '0';
            credito_externo <= 0;
            
        elsif rising_edge(clk) then
            -- Resetear señales de actualización
            actualizar_stock <= '0';
            actualizar_credito <= '0';
            activar_devolucion <= '0';
            actualizar_externo <= '0';
            activar_motor_02 <= '0';
            activar_motor_30 <= '0';
            necesita_motor_02 := '0';
            necesita_motor_30 := '0';
            
            -- Detectar flanco de subida de clk_1hz
            clk_1hz_prev <= clk_1hz;
            if clk_1hz = '1' and clk_1hz_prev = '0' then
                tick_1hz <= '1';
            else
                tick_1hz <= '0';
            end if;

            -- REGISTRAR PULSADORES (para mantener el estado)
            if confirmar_pulsado = '1' then
                confirmar_reg <= '1';
            end if;
            
            if devolver_pulsado = '1' then
                devolver_reg <= '1';
            end if;

            -- REGISTRAR DETECCIÓN DE ENTREGA
            if entrega_detectada = '1' then
                entrega_detectada_reg <= '1';
            end if;

            -- Verificar crédito suficiente
            if credito_total >= precio_actual and precio_actual > 0 then
                credito_suficiente <= '1';
            else
                credito_suficiente <= '0';
            end if;

            -- CALCULAR FILA Y COLUMNA DEL PRODUCTO SELECCIONADO
            if codigo_ingresado <= 62 then
                fila_int := codigo_ingresado / 10;
                columna_int := codigo_ingresado mod 10;
                fila_compra <= fila_int;
                columna_compra <= columna_int;
                
                -- DETERMINAR QUÉ MOTOR NECESITA (separado para "02" y "30")
                if (fila_int = 0 and columna_int = 2) then  -- Código "02"
                    necesita_motor_02 := '1';
                elsif (fila_int = 3 and columna_int = 0) then -- Código "30"
                    necesita_motor_30 := '1';
                end if;
            end if;

            -- CONTROL DE SERVOMOTORES DE ENTREGA - SEPARADO POR ARTÍCULO
            if estado_compra = PROCESANDO then
                if necesita_motor_02 = '1' then
                    activar_motor_02 <= '1';  -- Activar solo motor para artículo 02
                elsif necesita_motor_30 = '1' then
                    activar_motor_30 <= '1';  -- Activar solo motor para artículo 30
                end if;
            end if;
            
            entrega_completada <= '0';
            if estado_compra = ENTREGANDO and contador_entrega = 0 then
                entrega_completada <= '1';
            end if;

            -- ACTUALIZAR CRÉDITO DESDE SERVOMOTORES
            if devolucion_en_curso = '1' then
                -- Sincronizar el crédito del módulo de sensores con el de servomotores
                credito_externo <= credito_restante;
                actualizar_externo <= '1';
            end if;

            -- MÁQUINA DE ESTADOS Y CONTROL DE LEDs (solo en tick_1hz)
            if tick_1hz = '1' then
                -- PARPADEO DEL MOTOR (solo en estado PROCESANDO y para artículos que necesitan motor)
                if estado_compra = PROCESANDO and (necesita_motor_02 = '1' or necesita_motor_30 = '1') then
                    if contador_parpadeo = 0 then
                        parpadeo_motor <= '1';
                        contador_parpadeo <= 1;
                    else
                        parpadeo_motor <= '0';
                        contador_parpadeo <= 0;
                    end if;
                else
                    parpadeo_motor <= '0';
                    contador_parpadeo <= 0;
                end if;

                -- DECREMENTAR CONTADORES DE ALERTA
                if contador_alerta_credito > 0 then
                    contador_alerta_credito <= contador_alerta_credito - 1;
                end if;
                if contador_alerta_stock > 0 then
                    contador_alerta_stock <= contador_alerta_stock - 1;
                end if;
                if contador_devolucion > 0 then
                    contador_devolucion <= contador_devolucion - 1;
                end if;

                -- LÓGICA DE ESTADOS
                case estado_compra is
                    when ESPERA =>
                        led_entrega_producto <= '0';
                        compra_en_proceso <= '0';
                        contador_entrega <= 0;
                        entrega_detectada_reg <= '0';
                        
                        if confirmar_reg = '1' then
                            confirmar_reg <= '0';
                            if stock_disponible = '0' then
                                estado_compra <= ERROR_STOCK;
                                contador_alerta_stock <= 3;
                            elsif credito_suficiente = '0' then
                                estado_compra <= ERROR_CREDITO;
                                contador_alerta_credito <= 3;
                            else
                                estado_compra <= PROCESANDO;
                                compra_en_proceso <= '1';
                            end if;
                        end if;
                        
                    when PROCESANDO =>
                        compra_en_proceso <= '1';
                        if entrega_detectada_reg = '1' then
                            entrega_detectada_reg <= '0';
                            estado_compra <= ENTREGANDO;
                            contador_entrega <= 3;
                            led_entrega_producto <= '1';
                            -- ACTUALIZAR STOCK Y CRÉDITO
                            actualizar_stock <= '1';
                            actualizar_credito <= '1';
                        end if;
                        
                    when ENTREGANDO =>
                        if contador_entrega > 0 then
                            contador_entrega <= contador_entrega - 1;
                        else
                            estado_compra <= ESPERA;
                            led_entrega_producto <= '0';
                            compra_en_proceso <= '0';
                        end if;
                        
                    when ERROR_CREDITO =>
                        if contador_alerta_credito = 0 then
                            estado_compra <= ESPERA;
                        end if;
                        
                    when ERROR_STOCK =>
                        if contador_alerta_stock = 0 then
                            estado_compra <= ESPERA;
                        end if;
                end case;

                -- Devolución manual
                if devolver_reg = '1' and devolucion_en_curso = '0' then
                    devolver_reg <= '0';
                    estado_compra <= ESPERA;
                    led_entrega_producto <= '0';
                    compra_en_proceso <= '0';
                    contador_devolucion <= 4;
                    -- ACTIVAR DEVOLUCIÓN DE MONEDAS
                    activar_devolucion <= '1';
                end if;
            end if;

            -- CONTROL CONTINUO DE LEDs
            -- LED del motor parpadea para artículos que necesitan motor, se mantiene encendido para otros
            if estado_compra = PROCESANDO then
                if necesita_motor_02 = '1' or necesita_motor_30 = '1' then
                    led_alerta_motor <= parpadeo_motor;  -- Parpadeo para artículos con motor
                else
                    led_alerta_motor <= '1';  -- Encendido constante para otros artículos
                end if;
            else
                led_alerta_motor <= '0';
            end if;
            
            if estado_compra = ERROR_CREDITO and contador_alerta_credito > 0 then
                led_alerta_credito <= '1';
            else
                led_alerta_credito <= '0';
            end if;
            if estado_compra = ERROR_STOCK and contador_alerta_stock > 0 then
                led_alerta_stock <= '1';
            else
                led_alerta_stock <= '0';
            end if;
            if contador_devolucion > 0 then
                led_devolucion <= '1';
            else
                led_devolucion <= '0';
            end if;
        end if;
    end process;

    -- LUCES DECORATIVAS
    luces_decoracion <= '1' when credito_total > 0 or compra_en_proceso = '1' else '0';

    -- DISPLAYS
    U_dec_cred_dec : Decodificador7seg 
        port map (numero => credito_total / 10, segmentos => display_credito_decenas);
    U_dec_cred_uni : Decodificador7seg 
        port map (numero => credito_total mod 10, segmentos => display_credito_unidades);
    U_dec_fila : Decodificador7seg 
        port map (numero => digito_decenas, segmentos => display_fila);
    U_dec_col  : Decodificador7seg 
        port map (numero => digito_unidades, segmentos => display_columna);

end architecture;