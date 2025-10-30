library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControlServomotores is
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
end entity;

architecture comportamiento of ControlServomotores is

    -- Constantes para PWM (50MHz clock) - ÁNGULOS AJUSTADOS
    constant PERIODO_PWM : integer := 1000000;  -- 20ms periodo (50Hz)
    constant PULSO_0_GRADOS : integer := 50000;   -- 1ms pulso (0°)
    constant PULSO_190_GRADOS : integer := 108333; -- 2.166ms pulso (190°)

    -- Contadores PWM
    signal contador_pwm : integer range 0 to PERIODO_PWM := 0;
    signal pwm_5_monedas : std_logic := '0';
    signal pwm_10_monedas : std_logic := '0';
    
    -- Señales para controlar el servo_pwm del motor de entrega
    signal motor_position : integer range 0 to 8 := 0;
    signal pwm_motor_internal : std_logic := '0';
    signal enable_motor_02_pwm : std_logic := '0';
    signal enable_motor_30_pwm : std_logic := '0';

    -- Estados para devolución
    type estado_devolucion_t is (REPOSO, CALCULAR_MONEDAS, MOVER_190_5, ESPERAR_190_5, VOLVER_0_5, ESPERAR_0_5,
                                MOVER_190_10, ESPERAR_190_10, VOLVER_0_10, ESPERAR_0_10, FIN_DEVOLUCION);
    signal estado_devolucion : estado_devolucion_t := REPOSO;
    
    -- Estados para motores de entrega
    type estado_motor_t is (MOTOR_APAGADO, MOTOR_GIRANDO, MOTOR_ESPERANDO);
    signal estado_motor_02 : estado_motor_t := MOTOR_APAGADO;
    signal estado_motor_30 : estado_motor_t := MOTOR_APAGADO;

    -- Contadores de tiempo
    signal contador_1seg : integer range 0 to 50000000 := 0;  -- 1 segundo
    signal contador_4seg_02 : integer range 0 to 200000000 := 0; -- 4 segundos para motor 02
    signal contador_3seg_02 : integer range 0 to 150000000 := 0; -- 3 segundos para motor 02
    signal contador_4seg_30 : integer range 0 to 200000000 := 0; -- 4 segundos para motor 30
    signal contador_3seg_30 : integer range 0 to 150000000 := 0; -- 3 segundos para motor 30
    
    -- Contadores de monedas y crédito
    signal monedas_5_restantes : integer range 0 to 9 := 0;
    signal monedas_10_restantes : integer range 0 to 9 := 0;
    signal credito_restante_int : integer range 0 to 99 := 0;
    
    -- Señales internas
    signal devolucion_activa : std_logic := '0';
    signal motor_02_activo_int : std_logic := '0';
    signal motor_30_activo_int : std_logic := '0';
    signal activar_devolucion_reg : std_logic := '0';

    -- Componente servo_pwm
    component servo_pwm is
        generic (
            clk_hz : integer := 50000000;
            pulse_hz : integer := 50;        -- Frecuencia PWM estándar
            min_pulse_us : integer := 500;   -- Mínimo para MG90S
            max_pulse_us : integer := 2400;  -- Máximo para MG90S
            step_count : positive := 9       -- Número de posiciones
        );
        port (
            clk : in std_logic;
            rst : in std_logic;
            position : in integer range 0 to step_count - 1;
            pwm : out std_logic
        );
    end component;

begin

    -- Asignar salidas
    servo_moneda_5 <= pwm_5_monedas;
    servo_moneda_10 <= pwm_10_monedas;
    servo_motor_02 <= pwm_motor_internal when enable_motor_02_pwm = '1' else '0';
    servo_motor_30 <= pwm_motor_internal when enable_motor_30_pwm = '1' else '0';
    devolucion_en_curso <= devolucion_activa;
    motor_02_activo <= motor_02_activo_int;
    motor_30_activo <= motor_30_activo_int;
    credito_restante <= credito_restante_int;

    --------------------------------------------------------------------------
    -- CONVERSIÓN DE SWITCHES A POSICIÓN
    --------------------------------------------------------------------------
    process(SW_motor)
    begin
        motor_position <= to_integer(unsigned(SW_motor));
    end process;

    --------------------------------------------------------------------------
    -- CONTROL DE HABILITACIÓN DE MOTORES - CORREGIDO
    --------------------------------------------------------------------------
    process(estado_motor_02, estado_motor_30)
    begin
        -- Motor 02
        case estado_motor_02 is
            when MOTOR_GIRANDO =>
                enable_motor_02_pwm <= '1';
            when others =>
                enable_motor_02_pwm <= '0';
        end case;
        
        -- Motor 30
        case estado_motor_30 is
            when MOTOR_GIRANDO =>
                enable_motor_30_pwm <= '1';
            when others =>
                enable_motor_30_pwm <= '0';
        end case;
    end process;

    --------------------------------------------------------------------------
    -- GENERADOR PWM PARA SERVOMOTORES (190° A 0°)
    --------------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
            if contador_pwm < PERIODO_PWM then
                contador_pwm <= contador_pwm + 1;
            else
                contador_pwm <= 0;
            end if;
            
            -- Servo moneda 5 (190° a 0°)
            if estado_devolucion = MOVER_190_5 or estado_devolucion = ESPERAR_190_5 then
                if contador_pwm < PULSO_0_GRADOS then
                    pwm_5_monedas <= '1';
                else
                    pwm_5_monedas <= '0';
                end if;
            else
                if contador_pwm < PULSO_190_GRADOS then
                    pwm_5_monedas <= '1';
                else
                    pwm_5_monedas <= '0';
                end if;
            end if;
            
            -- Servo moneda 10 (190° a 0°)
            if estado_devolucion = MOVER_190_10 or estado_devolucion = ESPERAR_190_10 then
                if contador_pwm < PULSO_0_GRADOS then
                    pwm_10_monedas <= '1';
                else
                    pwm_10_monedas <= '0';
                end if;
            else
                if contador_pwm < PULSO_190_GRADOS then
                    pwm_10_monedas <= '1';
                else
                    pwm_10_monedas <= '0';
                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- INSTANCIA DEL SERVO_PWM PARA LOS MOTORES DE ENTREGA
    --------------------------------------------------------------------------
    U_MOTOR_PWM: servo_pwm
        generic map (
            clk_hz => 50000000,
            pulse_hz => 50,
            min_pulse_us => 500,
            max_pulse_us => 2400,
            step_count => 9
        )
        port map (
            clk      => clk,
            rst      => reset,
            position => motor_position,
            pwm      => pwm_motor_internal
        );

    --------------------------------------------------------------------------
    -- REGISTRO PARA DETECCIÓN DE PULSO DE DEVOLUCIÓN
    --------------------------------------------------------------------------
    process(clk, reset)
    begin
        if reset = '1' then
            activar_devolucion_reg <= '0';
        elsif rising_edge(clk) then
            if activar_devolucion = '1' then
                activar_devolucion_reg <= '1';
            elsif estado_devolucion /= REPOSO then
                activar_devolucion_reg <= '0';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- MÁQUINA DE ESTADOS PARA DEVOLUCIÓN DE MONEDAS
    --------------------------------------------------------------------------
    process(clk, reset)
        variable credito_temp : integer range 0 to 99;
    begin
        if reset = '1' then
            estado_devolucion <= REPOSO;
            monedas_5_restantes <= 0;
            monedas_10_restantes <= 0;
            contador_1seg <= 0;
            devolucion_activa <= '0';
            credito_restante_int <= 0;
            
        elsif rising_edge(clk) then
            case estado_devolucion is
                when REPOSO =>
                    devolucion_activa <= '0';
                    if activar_devolucion_reg = '1' then
                        estado_devolucion <= CALCULAR_MONEDAS;
                        devolucion_activa <= '1';
                        contador_1seg <= 0;
                    end if;
                    
                when CALCULAR_MONEDAS =>
                    credito_temp := credito_actual;
                    monedas_10_restantes <= credito_temp / 10;
                    monedas_5_restantes <= (credito_temp mod 10) / 5;
                    credito_restante_int <= credito_temp;
                    
                    if monedas_10_restantes > 0 then
                        estado_devolucion <= MOVER_190_10;
                    elsif monedas_5_restantes > 0 then
                        estado_devolucion <= MOVER_190_5;
                    else
                        estado_devolucion <= FIN_DEVOLUCION;
                    end if;
                    
                when MOVER_190_10 =>
                    if monedas_10_restantes > 0 then
                        if contador_1seg < 50000000 then
                            contador_1seg <= contador_1seg + 1;
                        else
                            contador_1seg <= 0;
                            estado_devolucion <= ESPERAR_190_10;
                        end if;
                    else
                        estado_devolucion <= MOVER_190_5;
                    end if;
                    
                when ESPERAR_190_10 =>
                    if contador_1seg < 50000000 then
                        contador_1seg <= contador_1seg + 1;
                    else
                        contador_1seg <= 0;
                        monedas_10_restantes <= monedas_10_restantes - 1;
                        credito_restante_int <= credito_restante_int - 10;
                        estado_devolucion <= VOLVER_0_10;
                    end if;
                    
                when VOLVER_0_10 =>
                    if contador_1seg < 50000000 then
                        contador_1seg <= contador_1seg + 1;
                    else
                        contador_1seg <= 0;
                        estado_devolucion <= ESPERAR_0_10;
                    end if;
                    
                when ESPERAR_0_10 =>
                    if contador_1seg < 50000000 then
                        contador_1seg <= contador_1seg + 1;
                    else
                        contador_1seg <= 0;
                        if monedas_10_restantes > 0 then
                            estado_devolucion <= MOVER_190_10;
                        else
                            estado_devolucion <= MOVER_190_5;
                        end if;
                    end if;
                    
                when MOVER_190_5 =>
                    if monedas_5_restantes > 0 then
                        if contador_1seg < 50000000 then
                            contador_1seg <= contador_1seg + 1;
                        else
                            contador_1seg <= 0;
                            estado_devolucion <= ESPERAR_190_5;
                        end if;
                    else
                        estado_devolucion <= FIN_DEVOLUCION;
                    end if;
                    
                when ESPERAR_190_5 =>
                    if contador_1seg < 50000000 then
                        contador_1seg <= contador_1seg + 1;
                    else
                        contador_1seg <= 0;
                        monedas_5_restantes <= monedas_5_restantes - 1;
                        credito_restante_int <= credito_restante_int - 5;
                        estado_devolucion <= VOLVER_0_5;
                    end if;
                    
                when VOLVER_0_5 =>
                    if contador_1seg < 50000000 then
                        contador_1seg <= contador_1seg + 1;
                    else
                        contador_1seg <= 0;
                        estado_devolucion <= ESPERAR_0_5;
                    end if;
                    
                when ESPERAR_0_5 =>
                    if contador_1seg < 50000000 then
                        contador_1seg <= contador_1seg + 1;
                    else
                        contador_1seg <= 0;
                        if monedas_5_restantes > 0 then
                            estado_devolucion <= MOVER_190_5;
                        else
                            estado_devolucion <= FIN_DEVOLUCION;
                        end if;
                    end if;
                    
                when FIN_DEVOLUCION =>
                    if contador_1seg < 10000000 then
                        contador_1seg <= contador_1seg + 1;
                    else
                        contador_1seg <= 0;
                        estado_devolucion <= REPOSO;
                        devolucion_activa <= '0';
                    end if;
                    
            end case;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- MÁQUINA DE ESTADOS PARA MOTOR 02
    --------------------------------------------------------------------------
    process(clk, reset)
    begin
        if reset = '1' then
            estado_motor_02 <= MOTOR_APAGADO;
            contador_4seg_02 <= 0;
            contador_3seg_02 <= 0;
            motor_02_activo_int <= '0';
            
        elsif rising_edge(clk) then
            case estado_motor_02 is
                when MOTOR_APAGADO =>
                    motor_02_activo_int <= '0';
                    contador_4seg_02 <= 0;
                    contador_3seg_02 <= 0;
                    if activar_motor_02 = '1' and entrega_completada = '0' then
                        estado_motor_02 <= MOTOR_GIRANDO;
                        motor_02_activo_int <= '1';
                    end if;
                    
                when MOTOR_GIRANDO =>
                    if entrega_completada = '1' then
                        estado_motor_02 <= MOTOR_APAGADO;
                    elsif contador_4seg_02 < 100000000 then
                        contador_4seg_02 <= contador_4seg_02 + 1;
                    else
                        contador_4seg_02 <= 0;
                        estado_motor_02 <= MOTOR_ESPERANDO;
                    end if;
                    
                when MOTOR_ESPERANDO =>
                    if entrega_completada = '1' then
                        estado_motor_02 <= MOTOR_APAGADO;
                    elsif contador_3seg_02 < 150000000 then
                        contador_3seg_02 <= contador_3seg_02 + 1;
                    else
                        contador_3seg_02 <= 0;
                        estado_motor_02 <= MOTOR_GIRANDO;
                    end if;
                    
            end case;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- MÁQUINA DE ESTADOS PARA MOTOR 30
    --------------------------------------------------------------------------
    process(clk, reset)
    begin
        if reset = '1' then
            estado_motor_30 <= MOTOR_APAGADO;
            contador_4seg_30 <= 0;
            contador_3seg_30 <= 0;
            motor_30_activo_int <= '0';
            
        elsif rising_edge(clk) then
            case estado_motor_30 is
                when MOTOR_APAGADO =>
                    motor_30_activo_int <= '0';
                    contador_4seg_30 <= 0;
                    contador_3seg_30 <= 0;
                    if activar_motor_30 = '1' and entrega_completada = '0' then
                        estado_motor_30 <= MOTOR_GIRANDO;
                        motor_30_activo_int <= '1';
                    end if;
                    
                when MOTOR_GIRANDO =>
                    if entrega_completada = '1' then
                        estado_motor_30 <= MOTOR_APAGADO;
                    elsif contador_4seg_30 < 100000000 then
                        contador_4seg_30 <= contador_4seg_30 + 1;
                    else
                        contador_4seg_30 <= 0;
                        estado_motor_30 <= MOTOR_ESPERANDO;
                    end if;
                    
                when MOTOR_ESPERANDO =>
                    if entrega_completada = '1' then
                        estado_motor_30 <= MOTOR_APAGADO;
                    elsif contador_3seg_30 < 150000000 then
                        contador_3seg_30 <= contador_3seg_30 + 1;
                    else
                        contador_3seg_30 <= 0;
                        estado_motor_30 <= MOTOR_GIRANDO;
                    end if;
                    
            end case;
        end if;
    end process;

end architecture;