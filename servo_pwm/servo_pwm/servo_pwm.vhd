library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity servo_pwm is
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
end servo_pwm;

architecture arch of servo_pwm is

  -- Función para calcular ciclos de reloj por microsegundo
  function cycles_per_us (us_count : integer) return integer is
  begin
    return integer(real(clk_hz) * real(us_count) / 1000000.0);
  end function;

  -- Constantes calculadas
  constant min_count : integer := cycles_per_us(min_pulse_us);
  constant max_count : integer := cycles_per_us(max_pulse_us);
  constant counter_max : integer := integer(clk_hz / pulse_hz) - 1;
  constant step_range : integer := max_count - min_count;
  constant cycles_per_step : integer := step_range / (step_count - 1);
  
  -- Señales
  signal counter : integer range 0 to counter_max;
  signal duty_cycle : integer range 0 to max_count;
  
begin

  -- Contador principal para periodo PWM de 20ms (50Hz)
  COUNTER_PROC : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        counter <= 0;
      else
        if counter < counter_max then
          counter <= counter + 1;
        else
          counter <= 0;
        end if;
      end if;
    end if;
  end process;

  -- Cálculo directo del duty cycle SIN suavizado
  DUTY_CYCLE_PROC : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        duty_cycle <= min_count;
      else
        -- Asignación DIRECTA para respuesta inmediata
        duty_cycle <= min_count + (position * cycles_per_step);
      end if;
    end if;
  end process;

  -- Generación PWM con máxima respuesta
  PWM_PROC : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        pwm <= '0';
      else
        -- PWM sin retardos adicionales
        if counter < duty_cycle then
          pwm <= '1';
        else
          pwm <= '0';
        end if;
      end if;
    end if;
  end process;

end arch;