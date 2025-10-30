-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "10/30/2025 07:58:55"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
LIBRARY STD;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.STANDARD.ALL;

ENTITY 	ControlServomotores IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	activar_devolucion : IN std_logic;
	credito_actual : IN STD.STANDARD.integer range 0 TO 99;
	activar_motor_02 : IN std_logic;
	activar_motor_30 : IN std_logic;
	entrega_completada : IN std_logic;
	SW_motor : IN std_logic_vector(3 DOWNTO 0);
	servo_moneda_5 : OUT std_logic;
	servo_moneda_10 : OUT std_logic;
	servo_motor_02 : OUT std_logic;
	servo_motor_30 : OUT std_logic;
	devolucion_en_curso : OUT std_logic;
	motor_02_activo : OUT std_logic;
	motor_30_activo : OUT std_logic;
	credito_restante : OUT STD.STANDARD.integer range 0 TO 99
	);
END ControlServomotores;

-- Design Ports Information
-- servo_moneda_5	=>  Location: PIN_V1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- servo_moneda_10	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- servo_motor_02	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- servo_motor_30	=>  Location: PIN_H11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- devolucion_en_curso	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- motor_02_activo	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- motor_30_activo	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_restante[0]	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_restante[1]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_restante[2]	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_restante[3]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_restante[4]	=>  Location: PIN_Y7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_restante[5]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_restante[6]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entrega_completada	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- activar_motor_02	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- activar_motor_30	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_actual[0]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_actual[1]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_actual[2]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_actual[3]	=>  Location: PIN_P4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_actual[4]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_actual[5]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_actual[6]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW_motor[1]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW_motor[3]	=>  Location: PIN_W6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW_motor[2]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW_motor[0]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- activar_devolucion	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ControlServomotores IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_activar_devolucion : std_logic;
SIGNAL ww_credito_actual : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_activar_motor_02 : std_logic;
SIGNAL ww_activar_motor_30 : std_logic;
SIGNAL ww_entrega_completada : std_logic;
SIGNAL ww_SW_motor : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_servo_moneda_5 : std_logic;
SIGNAL ww_servo_moneda_10 : std_logic;
SIGNAL ww_servo_motor_02 : std_logic;
SIGNAL ww_servo_motor_30 : std_logic;
SIGNAL ww_devolucion_en_curso : std_logic;
SIGNAL ww_motor_02_activo : std_logic;
SIGNAL ww_motor_30_activo : std_logic;
SIGNAL ww_credito_restante : std_logic_vector(6 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \servo_moneda_5~output_o\ : std_logic;
SIGNAL \servo_moneda_10~output_o\ : std_logic;
SIGNAL \servo_motor_02~output_o\ : std_logic;
SIGNAL \servo_motor_30~output_o\ : std_logic;
SIGNAL \devolucion_en_curso~output_o\ : std_logic;
SIGNAL \motor_02_activo~output_o\ : std_logic;
SIGNAL \motor_30_activo~output_o\ : std_logic;
SIGNAL \credito_restante[0]~output_o\ : std_logic;
SIGNAL \credito_restante[1]~output_o\ : std_logic;
SIGNAL \credito_restante[2]~output_o\ : std_logic;
SIGNAL \credito_restante[3]~output_o\ : std_logic;
SIGNAL \credito_restante[4]~output_o\ : std_logic;
SIGNAL \credito_restante[5]~output_o\ : std_logic;
SIGNAL \credito_restante[6]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \contador_pwm[0]~20_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \contador_pwm[0]~21\ : std_logic;
SIGNAL \contador_pwm[1]~22_combout\ : std_logic;
SIGNAL \contador_pwm[1]~23\ : std_logic;
SIGNAL \contador_pwm[2]~24_combout\ : std_logic;
SIGNAL \contador_pwm[2]~25\ : std_logic;
SIGNAL \contador_pwm[3]~26_combout\ : std_logic;
SIGNAL \contador_pwm[3]~27\ : std_logic;
SIGNAL \contador_pwm[4]~28_combout\ : std_logic;
SIGNAL \contador_pwm[4]~29\ : std_logic;
SIGNAL \contador_pwm[5]~30_combout\ : std_logic;
SIGNAL \contador_pwm[5]~31\ : std_logic;
SIGNAL \contador_pwm[6]~32_combout\ : std_logic;
SIGNAL \contador_pwm[6]~33\ : std_logic;
SIGNAL \contador_pwm[7]~34_combout\ : std_logic;
SIGNAL \contador_pwm[7]~35\ : std_logic;
SIGNAL \contador_pwm[8]~36_combout\ : std_logic;
SIGNAL \contador_pwm[8]~37\ : std_logic;
SIGNAL \contador_pwm[9]~38_combout\ : std_logic;
SIGNAL \contador_pwm[9]~39\ : std_logic;
SIGNAL \contador_pwm[10]~40_combout\ : std_logic;
SIGNAL \contador_pwm[10]~41\ : std_logic;
SIGNAL \contador_pwm[11]~42_combout\ : std_logic;
SIGNAL \contador_pwm[11]~43\ : std_logic;
SIGNAL \contador_pwm[12]~44_combout\ : std_logic;
SIGNAL \contador_pwm[12]~45\ : std_logic;
SIGNAL \contador_pwm[13]~46_combout\ : std_logic;
SIGNAL \contador_pwm[13]~47\ : std_logic;
SIGNAL \contador_pwm[14]~48_combout\ : std_logic;
SIGNAL \contador_pwm[14]~49\ : std_logic;
SIGNAL \contador_pwm[15]~50_combout\ : std_logic;
SIGNAL \contador_pwm[15]~51\ : std_logic;
SIGNAL \contador_pwm[16]~52_combout\ : std_logic;
SIGNAL \contador_pwm[16]~53\ : std_logic;
SIGNAL \contador_pwm[17]~54_combout\ : std_logic;
SIGNAL \contador_pwm[17]~55\ : std_logic;
SIGNAL \contador_pwm[18]~56_combout\ : std_logic;
SIGNAL \contador_pwm[18]~57\ : std_logic;
SIGNAL \contador_pwm[19]~58_combout\ : std_logic;
SIGNAL \credito_actual[6]~input_o\ : std_logic;
SIGNAL \credito_actual[5]~input_o\ : std_logic;
SIGNAL \credito_actual[4]~input_o\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[17]~29_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[17]~28_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~30_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~31_combout\ : std_logic;
SIGNAL \credito_actual[3]~input_o\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[15]~32_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[15]~33_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~27_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[23]~34_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[23]~47_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[22]~35_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[22]~48_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[21]~37_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[21]~36_combout\ : std_logic;
SIGNAL \credito_actual[2]~input_o\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[20]~38_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[20]~39_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[28]~46_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[28]~40_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[27]~41_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[27]~49_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[26]~43_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[26]~42_combout\ : std_logic;
SIGNAL \credito_actual[1]~input_o\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[25]~45_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[25]~44_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ : std_logic;
SIGNAL \estado_devolucion.VOLVER_0_10~feeder_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \contador_1seg[0]~26_combout\ : std_logic;
SIGNAL \LessThan4~0_combout\ : std_logic;
SIGNAL \LessThan6~0_combout\ : std_logic;
SIGNAL \LessThan6~1_combout\ : std_logic;
SIGNAL \LessThan6~2_combout\ : std_logic;
SIGNAL \LessThan6~3_combout\ : std_logic;
SIGNAL \LessThan6~4_combout\ : std_logic;
SIGNAL \LessThan6~5_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[24]~54_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[24]~55_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[23]~57_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[23]~56_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[22]~59_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[22]~58_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[21]~60_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[21]~61_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[32]~62_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[32]~93_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[31]~94_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[31]~63_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[30]~64_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[30]~95_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[29]~66_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[29]~65_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[28]~67_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[28]~68_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[40]~69_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[40]~86_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[39]~70_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[39]~87_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[38]~71_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[38]~88_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[37]~72_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[37]~96_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[36]~73_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[36]~74_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[35]~75_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[35]~76_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~9\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~11\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[48]~89_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[48]~77_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[47]~78_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[47]~90_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[46]~91_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[46]~79_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_1~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_1~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_1~4_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_1~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_1~6_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[10]~30_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[10]~42_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[9]~43_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_1~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[9]~31_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[8]~44_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_1~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[8]~32_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[45]~80_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[45]~92_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_2~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_2~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_2~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_2~7_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_2~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_2~4_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[14]~33_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[14]~45_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_2~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[13]~34_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[13]~46_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_2~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[12]~35_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[12]~47_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[44]~81_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[44]~97_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_3~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_3~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_3~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_3~7_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_3~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[17]~49_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_3~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[17]~37_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[16]~50_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_3~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[16]~38_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[43]~82_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[43]~83_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_4~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_4~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_4~4_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[18]~48_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_3~4_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[18]~36_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_4~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_4~7_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_4~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[22]~39_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[22]~51_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_4~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[21]~40_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[21]~52_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_4~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[20]~41_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[20]~53_combout\ : std_logic;
SIGNAL \credito_actual[0]~input_o\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[42]~84_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[42]~85_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_5~1_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_5~3_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_5~5_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_5~7_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_5~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|op_5~8_wirecell_combout\ : std_logic;
SIGNAL \monedas_5_restantes[0]~_wirecell_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \estado_devolucion.REPOSO~q\ : std_logic;
SIGNAL \activar_devolucion~input_o\ : std_logic;
SIGNAL \activar_devolucion_reg~0_combout\ : std_logic;
SIGNAL \activar_devolucion_reg~q\ : std_logic;
SIGNAL \Selector2~2_combout\ : std_logic;
SIGNAL \estado_devolucion.CALCULAR_MONEDAS~q\ : std_logic;
SIGNAL \credito_restante_int[0]~6_combout\ : std_logic;
SIGNAL \Selector44~0_combout\ : std_logic;
SIGNAL \Selector43~0_combout\ : std_logic;
SIGNAL \Selector43~1_combout\ : std_logic;
SIGNAL \Add4~0_combout\ : std_logic;
SIGNAL \Selector42~0_combout\ : std_logic;
SIGNAL \LessThan5~0_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \estado_devolucion.ESPERAR_190_5~q\ : std_logic;
SIGNAL \estado_devolucion.VOLVER_0_5~feeder_combout\ : std_logic;
SIGNAL \estado_devolucion.VOLVER_0_5~q\ : std_logic;
SIGNAL \estado_devolucion.ESPERAR_0_5~q\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \Selector11~1_combout\ : std_logic;
SIGNAL \Selector11~2_combout\ : std_logic;
SIGNAL \estado_devolucion.FIN_DEVOLUCION~q\ : std_logic;
SIGNAL \contador_1seg[13]~42_combout\ : std_logic;
SIGNAL \contador_1seg[13]~43_combout\ : std_logic;
SIGNAL \contador_1seg[13]~44_combout\ : std_logic;
SIGNAL \contador_1seg[0]~27\ : std_logic;
SIGNAL \contador_1seg[1]~28_combout\ : std_logic;
SIGNAL \contador_1seg[1]~29\ : std_logic;
SIGNAL \contador_1seg[2]~30_combout\ : std_logic;
SIGNAL \contador_1seg[2]~31\ : std_logic;
SIGNAL \contador_1seg[3]~32_combout\ : std_logic;
SIGNAL \contador_1seg[3]~33\ : std_logic;
SIGNAL \contador_1seg[4]~34_combout\ : std_logic;
SIGNAL \contador_1seg[4]~35\ : std_logic;
SIGNAL \contador_1seg[5]~36_combout\ : std_logic;
SIGNAL \contador_1seg[5]~37\ : std_logic;
SIGNAL \contador_1seg[6]~38_combout\ : std_logic;
SIGNAL \contador_1seg[6]~39\ : std_logic;
SIGNAL \contador_1seg[7]~40_combout\ : std_logic;
SIGNAL \contador_1seg[7]~41\ : std_logic;
SIGNAL \contador_1seg[8]~45_combout\ : std_logic;
SIGNAL \contador_1seg[8]~46\ : std_logic;
SIGNAL \contador_1seg[9]~47_combout\ : std_logic;
SIGNAL \contador_1seg[9]~48\ : std_logic;
SIGNAL \contador_1seg[10]~49_combout\ : std_logic;
SIGNAL \contador_1seg[10]~50\ : std_logic;
SIGNAL \contador_1seg[11]~51_combout\ : std_logic;
SIGNAL \contador_1seg[11]~52\ : std_logic;
SIGNAL \contador_1seg[12]~53_combout\ : std_logic;
SIGNAL \contador_1seg[12]~54\ : std_logic;
SIGNAL \contador_1seg[13]~55_combout\ : std_logic;
SIGNAL \contador_1seg[13]~56\ : std_logic;
SIGNAL \contador_1seg[14]~57_combout\ : std_logic;
SIGNAL \contador_1seg[14]~58\ : std_logic;
SIGNAL \contador_1seg[15]~59_combout\ : std_logic;
SIGNAL \contador_1seg[15]~60\ : std_logic;
SIGNAL \contador_1seg[16]~61_combout\ : std_logic;
SIGNAL \contador_1seg[16]~62\ : std_logic;
SIGNAL \contador_1seg[17]~63_combout\ : std_logic;
SIGNAL \contador_1seg[17]~64\ : std_logic;
SIGNAL \contador_1seg[18]~65_combout\ : std_logic;
SIGNAL \contador_1seg[18]~66\ : std_logic;
SIGNAL \contador_1seg[19]~67_combout\ : std_logic;
SIGNAL \contador_1seg[19]~68\ : std_logic;
SIGNAL \contador_1seg[20]~69_combout\ : std_logic;
SIGNAL \contador_1seg[20]~70\ : std_logic;
SIGNAL \contador_1seg[21]~71_combout\ : std_logic;
SIGNAL \contador_1seg[21]~72\ : std_logic;
SIGNAL \contador_1seg[22]~73_combout\ : std_logic;
SIGNAL \contador_1seg[22]~74\ : std_logic;
SIGNAL \contador_1seg[23]~75_combout\ : std_logic;
SIGNAL \contador_1seg[23]~76\ : std_logic;
SIGNAL \contador_1seg[24]~77_combout\ : std_logic;
SIGNAL \contador_1seg[24]~78\ : std_logic;
SIGNAL \contador_1seg[25]~79_combout\ : std_logic;
SIGNAL \LessThan4~5_combout\ : std_logic;
SIGNAL \LessThan4~2_combout\ : std_logic;
SIGNAL \LessThan4~1_combout\ : std_logic;
SIGNAL \LessThan4~3_combout\ : std_logic;
SIGNAL \LessThan4~4_combout\ : std_logic;
SIGNAL \LessThan4~6_combout\ : std_logic;
SIGNAL \estado_devolucion.VOLVER_0_10~q\ : std_logic;
SIGNAL \estado_devolucion.ESPERAR_0_10~feeder_combout\ : std_logic;
SIGNAL \estado_devolucion.ESPERAR_0_10~q\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Selector7~1_combout\ : std_logic;
SIGNAL \estado_devolucion.MOVER_190_10~q\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \estado_devolucion.ESPERAR_190_10~q\ : std_logic;
SIGNAL \Selector41~0_combout\ : std_logic;
SIGNAL \monedas_10_restantes[2]~0_combout\ : std_logic;
SIGNAL \Selector40~0_combout\ : std_logic;
SIGNAL \Selector39~0_combout\ : std_logic;
SIGNAL \Selector39~1_combout\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \Selector38~0_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Selector3~3_combout\ : std_logic;
SIGNAL \estado_devolucion.MOVER_190_5~q\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \LessThan2~2_combout\ : std_logic;
SIGNAL \LessThan2~3_combout\ : std_logic;
SIGNAL \LessThan2~4_combout\ : std_logic;
SIGNAL \pwm_5_monedas~0_combout\ : std_logic;
SIGNAL \pwm_5_monedas~1_combout\ : std_logic;
SIGNAL \pwm_5_monedas~q\ : std_logic;
SIGNAL \pwm_10_monedas~0_combout\ : std_logic;
SIGNAL \pwm_10_monedas~1_combout\ : std_logic;
SIGNAL \pwm_10_monedas~q\ : std_logic;
SIGNAL \entrega_completada~input_o\ : std_logic;
SIGNAL \Selector55~0_combout\ : std_logic;
SIGNAL \Add6~54_combout\ : std_logic;
SIGNAL \Add6~0_combout\ : std_logic;
SIGNAL \Selector80~0_combout\ : std_logic;
SIGNAL \Add6~1\ : std_logic;
SIGNAL \Add6~2_combout\ : std_logic;
SIGNAL \Selector79~0_combout\ : std_logic;
SIGNAL \Add6~3\ : std_logic;
SIGNAL \Add6~4_combout\ : std_logic;
SIGNAL \Selector78~0_combout\ : std_logic;
SIGNAL \Add6~5\ : std_logic;
SIGNAL \Add6~6_combout\ : std_logic;
SIGNAL \Selector77~0_combout\ : std_logic;
SIGNAL \Add6~7\ : std_logic;
SIGNAL \Add6~8_combout\ : std_logic;
SIGNAL \Selector76~0_combout\ : std_logic;
SIGNAL \Add6~9\ : std_logic;
SIGNAL \Add6~10_combout\ : std_logic;
SIGNAL \Selector75~0_combout\ : std_logic;
SIGNAL \Add6~11\ : std_logic;
SIGNAL \Add6~12_combout\ : std_logic;
SIGNAL \Selector74~0_combout\ : std_logic;
SIGNAL \Add6~13\ : std_logic;
SIGNAL \Add6~14_combout\ : std_logic;
SIGNAL \Selector73~0_combout\ : std_logic;
SIGNAL \Add6~15\ : std_logic;
SIGNAL \Add6~16_combout\ : std_logic;
SIGNAL \Selector72~0_combout\ : std_logic;
SIGNAL \Add6~17\ : std_logic;
SIGNAL \Add6~18_combout\ : std_logic;
SIGNAL \Selector71~0_combout\ : std_logic;
SIGNAL \Add6~19\ : std_logic;
SIGNAL \Add6~20_combout\ : std_logic;
SIGNAL \Selector70~0_combout\ : std_logic;
SIGNAL \Add6~21\ : std_logic;
SIGNAL \Add6~22_combout\ : std_logic;
SIGNAL \Selector69~0_combout\ : std_logic;
SIGNAL \Add6~23\ : std_logic;
SIGNAL \Add6~24_combout\ : std_logic;
SIGNAL \Selector68~0_combout\ : std_logic;
SIGNAL \Add6~25\ : std_logic;
SIGNAL \Add6~26_combout\ : std_logic;
SIGNAL \Selector67~0_combout\ : std_logic;
SIGNAL \Add6~27\ : std_logic;
SIGNAL \Add6~28_combout\ : std_logic;
SIGNAL \Selector66~0_combout\ : std_logic;
SIGNAL \Add6~29\ : std_logic;
SIGNAL \Add6~30_combout\ : std_logic;
SIGNAL \Selector65~0_combout\ : std_logic;
SIGNAL \Add6~31\ : std_logic;
SIGNAL \Add6~32_combout\ : std_logic;
SIGNAL \Selector64~0_combout\ : std_logic;
SIGNAL \Add6~33\ : std_logic;
SIGNAL \Add6~34_combout\ : std_logic;
SIGNAL \Selector63~0_combout\ : std_logic;
SIGNAL \Add6~35\ : std_logic;
SIGNAL \Add6~36_combout\ : std_logic;
SIGNAL \Selector62~0_combout\ : std_logic;
SIGNAL \Add6~37\ : std_logic;
SIGNAL \Add6~38_combout\ : std_logic;
SIGNAL \Selector61~0_combout\ : std_logic;
SIGNAL \Add6~39\ : std_logic;
SIGNAL \Add6~40_combout\ : std_logic;
SIGNAL \Selector60~0_combout\ : std_logic;
SIGNAL \Add6~41\ : std_logic;
SIGNAL \Add6~42_combout\ : std_logic;
SIGNAL \Selector59~0_combout\ : std_logic;
SIGNAL \Add6~43\ : std_logic;
SIGNAL \Add6~44_combout\ : std_logic;
SIGNAL \Selector58~0_combout\ : std_logic;
SIGNAL \Add6~45\ : std_logic;
SIGNAL \Add6~46_combout\ : std_logic;
SIGNAL \Selector57~0_combout\ : std_logic;
SIGNAL \Add6~47\ : std_logic;
SIGNAL \Add6~48_combout\ : std_logic;
SIGNAL \Selector56~0_combout\ : std_logic;
SIGNAL \Add6~49\ : std_logic;
SIGNAL \Add6~50_combout\ : std_logic;
SIGNAL \Selector55~1_combout\ : std_logic;
SIGNAL \Add6~51\ : std_logic;
SIGNAL \Add6~52_combout\ : std_logic;
SIGNAL \Selector54~0_combout\ : std_logic;
SIGNAL \Add6~53\ : std_logic;
SIGNAL \Add6~55_combout\ : std_logic;
SIGNAL \Selector53~0_combout\ : std_logic;
SIGNAL \LessThan7~4_combout\ : std_logic;
SIGNAL \LessThan7~0_combout\ : std_logic;
SIGNAL \LessThan7~1_combout\ : std_logic;
SIGNAL \LessThan7~2_combout\ : std_logic;
SIGNAL \LessThan7~3_combout\ : std_logic;
SIGNAL \LessThan7~5_combout\ : std_logic;
SIGNAL \Selector111~0_combout\ : std_logic;
SIGNAL \Selector111~1_combout\ : std_logic;
SIGNAL \Selector111~3_combout\ : std_logic;
SIGNAL \Selector109~1_combout\ : std_logic;
SIGNAL \Selector109~2_combout\ : std_logic;
SIGNAL \estado_motor_02.MOTOR_APAGADO~q\ : std_logic;
SIGNAL \activar_motor_02~input_o\ : std_logic;
SIGNAL \Selector111~2_combout\ : std_logic;
SIGNAL \Selector111~4_combout\ : std_logic;
SIGNAL \Selector111~5_combout\ : std_logic;
SIGNAL \estado_motor_02.MOTOR_ESPERANDO~q\ : std_logic;
SIGNAL \Selector82~0_combout\ : std_logic;
SIGNAL \Add7~56_combout\ : std_logic;
SIGNAL \Add7~0_combout\ : std_logic;
SIGNAL \Selector108~0_combout\ : std_logic;
SIGNAL \Add7~1\ : std_logic;
SIGNAL \Add7~2_combout\ : std_logic;
SIGNAL \Selector107~0_combout\ : std_logic;
SIGNAL \Add7~3\ : std_logic;
SIGNAL \Add7~4_combout\ : std_logic;
SIGNAL \Selector106~0_combout\ : std_logic;
SIGNAL \Add7~5\ : std_logic;
SIGNAL \Add7~6_combout\ : std_logic;
SIGNAL \Selector105~0_combout\ : std_logic;
SIGNAL \Add7~7\ : std_logic;
SIGNAL \Add7~8_combout\ : std_logic;
SIGNAL \Selector104~0_combout\ : std_logic;
SIGNAL \Add7~9\ : std_logic;
SIGNAL \Add7~10_combout\ : std_logic;
SIGNAL \Selector103~0_combout\ : std_logic;
SIGNAL \Add7~11\ : std_logic;
SIGNAL \Add7~12_combout\ : std_logic;
SIGNAL \Selector102~0_combout\ : std_logic;
SIGNAL \Add7~13\ : std_logic;
SIGNAL \Add7~14_combout\ : std_logic;
SIGNAL \Selector101~0_combout\ : std_logic;
SIGNAL \Add7~15\ : std_logic;
SIGNAL \Add7~16_combout\ : std_logic;
SIGNAL \Selector100~0_combout\ : std_logic;
SIGNAL \Add7~17\ : std_logic;
SIGNAL \Add7~18_combout\ : std_logic;
SIGNAL \Selector99~0_combout\ : std_logic;
SIGNAL \Add7~19\ : std_logic;
SIGNAL \Add7~20_combout\ : std_logic;
SIGNAL \Selector98~0_combout\ : std_logic;
SIGNAL \Add7~21\ : std_logic;
SIGNAL \Add7~22_combout\ : std_logic;
SIGNAL \Selector97~0_combout\ : std_logic;
SIGNAL \Add7~23\ : std_logic;
SIGNAL \Add7~24_combout\ : std_logic;
SIGNAL \Selector96~0_combout\ : std_logic;
SIGNAL \Add7~25\ : std_logic;
SIGNAL \Add7~26_combout\ : std_logic;
SIGNAL \Selector95~0_combout\ : std_logic;
SIGNAL \Add7~27\ : std_logic;
SIGNAL \Add7~28_combout\ : std_logic;
SIGNAL \Selector94~0_combout\ : std_logic;
SIGNAL \Add7~29\ : std_logic;
SIGNAL \Add7~30_combout\ : std_logic;
SIGNAL \Selector93~0_combout\ : std_logic;
SIGNAL \Add7~31\ : std_logic;
SIGNAL \Add7~32_combout\ : std_logic;
SIGNAL \Selector92~0_combout\ : std_logic;
SIGNAL \Add7~33\ : std_logic;
SIGNAL \Add7~34_combout\ : std_logic;
SIGNAL \Selector91~0_combout\ : std_logic;
SIGNAL \Add7~35\ : std_logic;
SIGNAL \Add7~36_combout\ : std_logic;
SIGNAL \Selector90~0_combout\ : std_logic;
SIGNAL \Add7~37\ : std_logic;
SIGNAL \Add7~38_combout\ : std_logic;
SIGNAL \Selector89~0_combout\ : std_logic;
SIGNAL \Add7~39\ : std_logic;
SIGNAL \Add7~40_combout\ : std_logic;
SIGNAL \Selector88~0_combout\ : std_logic;
SIGNAL \Add7~41\ : std_logic;
SIGNAL \Add7~42_combout\ : std_logic;
SIGNAL \Selector87~0_combout\ : std_logic;
SIGNAL \Add7~43\ : std_logic;
SIGNAL \Add7~44_combout\ : std_logic;
SIGNAL \Selector86~0_combout\ : std_logic;
SIGNAL \Add7~45\ : std_logic;
SIGNAL \Add7~46_combout\ : std_logic;
SIGNAL \Selector85~0_combout\ : std_logic;
SIGNAL \Add7~47\ : std_logic;
SIGNAL \Add7~48_combout\ : std_logic;
SIGNAL \Selector84~0_combout\ : std_logic;
SIGNAL \Add7~49\ : std_logic;
SIGNAL \Add7~50_combout\ : std_logic;
SIGNAL \Selector83~0_combout\ : std_logic;
SIGNAL \Add7~51\ : std_logic;
SIGNAL \Add7~52_combout\ : std_logic;
SIGNAL \Selector82~1_combout\ : std_logic;
SIGNAL \Add7~53\ : std_logic;
SIGNAL \Add7~54_combout\ : std_logic;
SIGNAL \Selector81~0_combout\ : std_logic;
SIGNAL \LessThan8~0_combout\ : std_logic;
SIGNAL \LessThan8~1_combout\ : std_logic;
SIGNAL \LessThan8~3_combout\ : std_logic;
SIGNAL \LessThan8~4_combout\ : std_logic;
SIGNAL \LessThan8~2_combout\ : std_logic;
SIGNAL \LessThan8~5_combout\ : std_logic;
SIGNAL \LessThan8~6_combout\ : std_logic;
SIGNAL \Selector109~0_combout\ : std_logic;
SIGNAL \Selector110~2_combout\ : std_logic;
SIGNAL \Selector110~3_combout\ : std_logic;
SIGNAL \estado_motor_02.MOTOR_GIRANDO~q\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[0]~20_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[8]~54_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[8]~55_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[8]~56_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan0~0_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[8]~57_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[8]~58_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[8]~59_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[0]~21\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[1]~22_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[1]~23\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[2]~24_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[2]~25\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[3]~26_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[3]~27\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[4]~28_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[4]~29\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[5]~30_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[5]~31\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[6]~32_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[6]~33\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[7]~34_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[7]~35\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[8]~36_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[8]~37\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[9]~38_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[9]~39\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[10]~40_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[10]~41\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[11]~42_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[11]~43\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[12]~44_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[12]~45\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[13]~46_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[13]~47\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[14]~48_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[14]~49\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[15]~50_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[15]~51\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[16]~52_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[16]~53\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[17]~60_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[17]~61\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[18]~62_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[18]~63\ : std_logic;
SIGNAL \U_MOTOR_PWM|counter[19]~64_combout\ : std_logic;
SIGNAL \SW_motor[2]~input_o\ : std_logic;
SIGNAL \SW_motor[1]~input_o\ : std_logic;
SIGNAL \SW_motor[3]~input_o\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][16]~combout\ : std_logic;
SIGNAL \SW_motor[0]~input_o\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][15]~combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][14]~0_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][13]~1_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][12]~2_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][11]~3_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][10]~combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][9]~4_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][7]~5_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][6]~6_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][5]~7_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][16]~8_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~9_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[3]~15\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[4]~17\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[5]~19\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[6]~21\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[7]~23\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[8]~25\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[9]~27\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[10]~29\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[11]~31\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[12]~33\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[13]~35\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[14]~37\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[15]~39\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[16]~40_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[15]~38_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[14]~36_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[13]~34_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[13]~feeder_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[12]~32_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[11]~30_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[11]~feeder_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[10]~28_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[9]~26_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[9]~feeder_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[8]~24_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[7]~22_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[6]~20_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[5]~18_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[4]~16_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[3]~14_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle[3]~feeder_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][2]~combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|Mult0|mult_core|romout[0][1]~10_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|duty_cycle~42_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~1_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~3_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~5_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~7_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~9_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~11_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~13_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~15_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~17_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~19_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~21_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~23_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~25_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~27_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~29_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~31_cout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~32_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|LessThan1~34_combout\ : std_logic;
SIGNAL \U_MOTOR_PWM|pwm~q\ : std_logic;
SIGNAL \servo_motor_02~0_combout\ : std_logic;
SIGNAL \activar_motor_30~input_o\ : std_logic;
SIGNAL \Selector141~0_combout\ : std_logic;
SIGNAL \Add9~56_combout\ : std_logic;
SIGNAL \Add9~0_combout\ : std_logic;
SIGNAL \Selector167~0_combout\ : std_logic;
SIGNAL \Add9~1\ : std_logic;
SIGNAL \Add9~2_combout\ : std_logic;
SIGNAL \Selector166~0_combout\ : std_logic;
SIGNAL \Add9~3\ : std_logic;
SIGNAL \Add9~4_combout\ : std_logic;
SIGNAL \Selector165~0_combout\ : std_logic;
SIGNAL \Add9~5\ : std_logic;
SIGNAL \Add9~6_combout\ : std_logic;
SIGNAL \Selector164~0_combout\ : std_logic;
SIGNAL \Add9~7\ : std_logic;
SIGNAL \Add9~8_combout\ : std_logic;
SIGNAL \Selector163~0_combout\ : std_logic;
SIGNAL \Add9~9\ : std_logic;
SIGNAL \Add9~10_combout\ : std_logic;
SIGNAL \Selector162~0_combout\ : std_logic;
SIGNAL \Add9~11\ : std_logic;
SIGNAL \Add9~12_combout\ : std_logic;
SIGNAL \Selector161~0_combout\ : std_logic;
SIGNAL \Add9~13\ : std_logic;
SIGNAL \Add9~14_combout\ : std_logic;
SIGNAL \Selector160~0_combout\ : std_logic;
SIGNAL \Add9~15\ : std_logic;
SIGNAL \Add9~16_combout\ : std_logic;
SIGNAL \Selector159~0_combout\ : std_logic;
SIGNAL \Add9~17\ : std_logic;
SIGNAL \Add9~18_combout\ : std_logic;
SIGNAL \Selector158~0_combout\ : std_logic;
SIGNAL \Add9~19\ : std_logic;
SIGNAL \Add9~20_combout\ : std_logic;
SIGNAL \Selector157~0_combout\ : std_logic;
SIGNAL \Add9~21\ : std_logic;
SIGNAL \Add9~22_combout\ : std_logic;
SIGNAL \Selector156~0_combout\ : std_logic;
SIGNAL \Add9~23\ : std_logic;
SIGNAL \Add9~24_combout\ : std_logic;
SIGNAL \Selector155~0_combout\ : std_logic;
SIGNAL \Add9~25\ : std_logic;
SIGNAL \Add9~26_combout\ : std_logic;
SIGNAL \Selector154~0_combout\ : std_logic;
SIGNAL \Add9~27\ : std_logic;
SIGNAL \Add9~28_combout\ : std_logic;
SIGNAL \Selector153~0_combout\ : std_logic;
SIGNAL \Add9~29\ : std_logic;
SIGNAL \Add9~30_combout\ : std_logic;
SIGNAL \Selector152~0_combout\ : std_logic;
SIGNAL \Add9~31\ : std_logic;
SIGNAL \Add9~32_combout\ : std_logic;
SIGNAL \Selector151~0_combout\ : std_logic;
SIGNAL \Add9~33\ : std_logic;
SIGNAL \Add9~34_combout\ : std_logic;
SIGNAL \Selector150~0_combout\ : std_logic;
SIGNAL \Add9~35\ : std_logic;
SIGNAL \Add9~36_combout\ : std_logic;
SIGNAL \Selector149~0_combout\ : std_logic;
SIGNAL \Add9~37\ : std_logic;
SIGNAL \Add9~38_combout\ : std_logic;
SIGNAL \Selector148~0_combout\ : std_logic;
SIGNAL \Add9~39\ : std_logic;
SIGNAL \Add9~40_combout\ : std_logic;
SIGNAL \Selector147~0_combout\ : std_logic;
SIGNAL \Add9~41\ : std_logic;
SIGNAL \Add9~42_combout\ : std_logic;
SIGNAL \Selector146~0_combout\ : std_logic;
SIGNAL \Add9~43\ : std_logic;
SIGNAL \Add9~44_combout\ : std_logic;
SIGNAL \Selector145~0_combout\ : std_logic;
SIGNAL \Add9~45\ : std_logic;
SIGNAL \Add9~46_combout\ : std_logic;
SIGNAL \Selector144~0_combout\ : std_logic;
SIGNAL \LessThan10~1_combout\ : std_logic;
SIGNAL \Add9~47\ : std_logic;
SIGNAL \Add9~48_combout\ : std_logic;
SIGNAL \Selector143~0_combout\ : std_logic;
SIGNAL \Add9~49\ : std_logic;
SIGNAL \Add9~50_combout\ : std_logic;
SIGNAL \Selector142~0_combout\ : std_logic;
SIGNAL \Add9~51\ : std_logic;
SIGNAL \Add9~52_combout\ : std_logic;
SIGNAL \Selector141~1_combout\ : std_logic;
SIGNAL \Add9~53\ : std_logic;
SIGNAL \Add9~54_combout\ : std_logic;
SIGNAL \Selector140~0_combout\ : std_logic;
SIGNAL \LessThan10~0_combout\ : std_logic;
SIGNAL \LessThan10~3_combout\ : std_logic;
SIGNAL \LessThan10~4_combout\ : std_logic;
SIGNAL \LessThan10~2_combout\ : std_logic;
SIGNAL \LessThan10~5_combout\ : std_logic;
SIGNAL \LessThan10~6_combout\ : std_logic;
SIGNAL \Selector168~0_combout\ : std_logic;
SIGNAL \Selector168~1_combout\ : std_logic;
SIGNAL \Selector168~2_combout\ : std_logic;
SIGNAL \estado_motor_30.MOTOR_APAGADO~q\ : std_logic;
SIGNAL \Selector169~3_combout\ : std_logic;
SIGNAL \Selector169~4_combout\ : std_logic;
SIGNAL \Selector169~5_combout\ : std_logic;
SIGNAL \Selector170~0_combout\ : std_logic;
SIGNAL \Selector170~1_combout\ : std_logic;
SIGNAL \estado_motor_30.MOTOR_ESPERANDO~q\ : std_logic;
SIGNAL \Selector114~0_combout\ : std_logic;
SIGNAL \Add8~54_combout\ : std_logic;
SIGNAL \Add8~0_combout\ : std_logic;
SIGNAL \Selector139~0_combout\ : std_logic;
SIGNAL \Add8~1\ : std_logic;
SIGNAL \Add8~2_combout\ : std_logic;
SIGNAL \Selector138~0_combout\ : std_logic;
SIGNAL \Add8~3\ : std_logic;
SIGNAL \Add8~4_combout\ : std_logic;
SIGNAL \Selector137~0_combout\ : std_logic;
SIGNAL \Add8~5\ : std_logic;
SIGNAL \Add8~6_combout\ : std_logic;
SIGNAL \Selector136~0_combout\ : std_logic;
SIGNAL \Add8~7\ : std_logic;
SIGNAL \Add8~8_combout\ : std_logic;
SIGNAL \Selector135~0_combout\ : std_logic;
SIGNAL \Add8~9\ : std_logic;
SIGNAL \Add8~10_combout\ : std_logic;
SIGNAL \Selector134~0_combout\ : std_logic;
SIGNAL \Add8~11\ : std_logic;
SIGNAL \Add8~12_combout\ : std_logic;
SIGNAL \Selector133~0_combout\ : std_logic;
SIGNAL \Add8~13\ : std_logic;
SIGNAL \Add8~14_combout\ : std_logic;
SIGNAL \Selector132~0_combout\ : std_logic;
SIGNAL \Add8~15\ : std_logic;
SIGNAL \Add8~16_combout\ : std_logic;
SIGNAL \Selector131~0_combout\ : std_logic;
SIGNAL \Add8~17\ : std_logic;
SIGNAL \Add8~18_combout\ : std_logic;
SIGNAL \Selector130~0_combout\ : std_logic;
SIGNAL \Add8~19\ : std_logic;
SIGNAL \Add8~20_combout\ : std_logic;
SIGNAL \Selector129~0_combout\ : std_logic;
SIGNAL \Add8~21\ : std_logic;
SIGNAL \Add8~22_combout\ : std_logic;
SIGNAL \Selector128~0_combout\ : std_logic;
SIGNAL \Add8~23\ : std_logic;
SIGNAL \Add8~24_combout\ : std_logic;
SIGNAL \Selector127~0_combout\ : std_logic;
SIGNAL \Add8~25\ : std_logic;
SIGNAL \Add8~26_combout\ : std_logic;
SIGNAL \Selector126~0_combout\ : std_logic;
SIGNAL \Add8~27\ : std_logic;
SIGNAL \Add8~28_combout\ : std_logic;
SIGNAL \Selector125~0_combout\ : std_logic;
SIGNAL \Add8~29\ : std_logic;
SIGNAL \Add8~30_combout\ : std_logic;
SIGNAL \Selector124~0_combout\ : std_logic;
SIGNAL \Add8~31\ : std_logic;
SIGNAL \Add8~32_combout\ : std_logic;
SIGNAL \Selector123~0_combout\ : std_logic;
SIGNAL \Add8~33\ : std_logic;
SIGNAL \Add8~34_combout\ : std_logic;
SIGNAL \Selector122~0_combout\ : std_logic;
SIGNAL \Add8~35\ : std_logic;
SIGNAL \Add8~36_combout\ : std_logic;
SIGNAL \Selector121~0_combout\ : std_logic;
SIGNAL \Add8~37\ : std_logic;
SIGNAL \Add8~38_combout\ : std_logic;
SIGNAL \Selector120~0_combout\ : std_logic;
SIGNAL \Add8~39\ : std_logic;
SIGNAL \Add8~40_combout\ : std_logic;
SIGNAL \Selector119~0_combout\ : std_logic;
SIGNAL \Add8~41\ : std_logic;
SIGNAL \Add8~42_combout\ : std_logic;
SIGNAL \Selector118~0_combout\ : std_logic;
SIGNAL \Add8~43\ : std_logic;
SIGNAL \Add8~44_combout\ : std_logic;
SIGNAL \Selector117~0_combout\ : std_logic;
SIGNAL \Add8~45\ : std_logic;
SIGNAL \Add8~46_combout\ : std_logic;
SIGNAL \Selector116~0_combout\ : std_logic;
SIGNAL \Add8~47\ : std_logic;
SIGNAL \Add8~48_combout\ : std_logic;
SIGNAL \Selector115~0_combout\ : std_logic;
SIGNAL \Add8~49\ : std_logic;
SIGNAL \Add8~50_combout\ : std_logic;
SIGNAL \Selector114~1_combout\ : std_logic;
SIGNAL \Add8~51\ : std_logic;
SIGNAL \Add8~52_combout\ : std_logic;
SIGNAL \Selector113~0_combout\ : std_logic;
SIGNAL \Add8~53\ : std_logic;
SIGNAL \Add8~55_combout\ : std_logic;
SIGNAL \Selector112~0_combout\ : std_logic;
SIGNAL \LessThan9~4_combout\ : std_logic;
SIGNAL \LessThan9~0_combout\ : std_logic;
SIGNAL \LessThan9~1_combout\ : std_logic;
SIGNAL \LessThan9~2_combout\ : std_logic;
SIGNAL \LessThan9~3_combout\ : std_logic;
SIGNAL \LessThan9~5_combout\ : std_logic;
SIGNAL \Selector169~2_combout\ : std_logic;
SIGNAL \Selector169~6_combout\ : std_logic;
SIGNAL \Selector169~7_combout\ : std_logic;
SIGNAL \estado_motor_30.MOTOR_GIRANDO~q\ : std_logic;
SIGNAL \servo_motor_30~0_combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \devolucion_activa~q\ : std_logic;
SIGNAL \motor_02_activo_int~0_combout\ : std_logic;
SIGNAL \motor_02_activo_int~q\ : std_logic;
SIGNAL \motor_30_activo_int~0_combout\ : std_logic;
SIGNAL \motor_30_activo_int~q\ : std_logic;
SIGNAL \Add5~0_combout\ : std_logic;
SIGNAL \Add5~2_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \credito_restante_int[1]~0_combout\ : std_logic;
SIGNAL \Add5~1\ : std_logic;
SIGNAL \Add5~3_combout\ : std_logic;
SIGNAL \credito_restante_int[3]~7_combout\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \credito_restante_int[2]~1_combout\ : std_logic;
SIGNAL \Add5~4\ : std_logic;
SIGNAL \Add5~5_combout\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \credito_restante_int[3]~2_combout\ : std_logic;
SIGNAL \Add5~6\ : std_logic;
SIGNAL \Add5~7_combout\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \credito_restante_int[4]~3_combout\ : std_logic;
SIGNAL \Add5~8\ : std_logic;
SIGNAL \Add5~9_combout\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \credito_restante_int[5]~4_combout\ : std_logic;
SIGNAL \Add5~10\ : std_logic;
SIGNAL \Add5~11_combout\ : std_logic;
SIGNAL \Add3~9\ : std_logic;
SIGNAL \Add3~10_combout\ : std_logic;
SIGNAL \credito_restante_int[6]~5_combout\ : std_logic;
SIGNAL \Add5~12\ : std_logic;
SIGNAL \Add5~13_combout\ : std_logic;
SIGNAL contador_pwm : std_logic_vector(19 DOWNTO 0);
SIGNAL monedas_10_restantes : std_logic_vector(3 DOWNTO 0);
SIGNAL credito_restante_int : std_logic_vector(6 DOWNTO 0);
SIGNAL contador_3seg_30 : std_logic_vector(27 DOWNTO 0);
SIGNAL contador_1seg : std_logic_vector(25 DOWNTO 0);
SIGNAL contador_4seg_30 : std_logic_vector(27 DOWNTO 0);
SIGNAL contador_4seg_02 : std_logic_vector(27 DOWNTO 0);
SIGNAL monedas_5_restantes : std_logic_vector(3 DOWNTO 0);
SIGNAL \U_MOTOR_PWM|counter\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \U_MOTOR_PWM|duty_cycle\ : std_logic_vector(16 DOWNTO 0);
SIGNAL contador_3seg_02 : std_logic_vector(27 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_LessThan4~6_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_activar_devolucion <= activar_devolucion;
ww_credito_actual <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(credito_actual, 7);
ww_activar_motor_02 <= activar_motor_02;
ww_activar_motor_30 <= activar_motor_30;
ww_entrega_completada <= entrega_completada;
ww_SW_motor <= SW_motor;
servo_moneda_5 <= ww_servo_moneda_5;
servo_moneda_10 <= ww_servo_moneda_10;
servo_motor_02 <= ww_servo_motor_02;
servo_motor_30 <= ww_servo_motor_30;
devolucion_en_curso <= ww_devolucion_en_curso;
motor_02_activo <= ww_motor_02_activo;
motor_30_activo <= ww_motor_30_activo;
credito_restante <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_credito_restante));
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_LessThan4~6_combout\ <= NOT \LessThan4~6_combout\;

-- Location: IOOBUF_X0_Y8_N2
\servo_moneda_5~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pwm_5_monedas~q\,
	devoe => ww_devoe,
	o => \servo_moneda_5~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\servo_moneda_10~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pwm_10_monedas~q\,
	devoe => ww_devoe,
	o => \servo_moneda_10~output_o\);

-- Location: IOOBUF_X21_Y29_N30
\servo_motor_02~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \servo_motor_02~0_combout\,
	devoe => ww_devoe,
	o => \servo_motor_02~output_o\);

-- Location: IOOBUF_X19_Y29_N30
\servo_motor_30~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \servo_motor_30~0_combout\,
	devoe => ww_devoe,
	o => \servo_motor_30~output_o\);

-- Location: IOOBUF_X11_Y0_N9
\devolucion_en_curso~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \devolucion_activa~q\,
	devoe => ww_devoe,
	o => \devolucion_en_curso~output_o\);

-- Location: IOOBUF_X21_Y29_N16
\motor_02_activo~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \motor_02_activo_int~q\,
	devoe => ww_devoe,
	o => \motor_02_activo~output_o\);

-- Location: IOOBUF_X21_Y29_N9
\motor_30_activo~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \motor_30_activo_int~q\,
	devoe => ww_devoe,
	o => \motor_30_activo~output_o\);

-- Location: IOOBUF_X9_Y0_N16
\credito_restante[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_restante_int(0),
	devoe => ww_devoe,
	o => \credito_restante[0]~output_o\);

-- Location: IOOBUF_X11_Y0_N23
\credito_restante[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_restante_int(1),
	devoe => ww_devoe,
	o => \credito_restante[1]~output_o\);

-- Location: IOOBUF_X0_Y9_N2
\credito_restante[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_restante_int(2),
	devoe => ww_devoe,
	o => \credito_restante[2]~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\credito_restante[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_restante_int(3),
	devoe => ww_devoe,
	o => \credito_restante[3]~output_o\);

-- Location: IOOBUF_X9_Y0_N9
\credito_restante[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_restante_int(4),
	devoe => ww_devoe,
	o => \credito_restante[4]~output_o\);

-- Location: IOOBUF_X0_Y9_N16
\credito_restante[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_restante_int(5),
	devoe => ww_devoe,
	o => \credito_restante[5]~output_o\);

-- Location: IOOBUF_X11_Y0_N30
\credito_restante[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_restante_int(6),
	devoe => ww_devoe,
	o => \credito_restante[6]~output_o\);

-- Location: IOIBUF_X0_Y14_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X8_Y9_N12
\contador_pwm[0]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[0]~20_combout\ = contador_pwm(0) $ (VCC)
-- \contador_pwm[0]~21\ = CARRY(contador_pwm(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contador_pwm(0),
	datad => VCC,
	combout => \contador_pwm[0]~20_combout\,
	cout => \contador_pwm[0]~21\);

-- Location: LCCOMB_X8_Y8_N26
\LessThan0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (((!contador_pwm(19)) # (!contador_pwm(17))) # (!contador_pwm(18))) # (!contador_pwm(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(16),
	datab => contador_pwm(18),
	datac => contador_pwm(17),
	datad => contador_pwm(19),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X8_Y9_N6
\LessThan0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!contador_pwm(7) & !contador_pwm(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => contador_pwm(7),
	datad => contador_pwm(6),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X8_Y8_N30
\LessThan1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (!contador_pwm(13) & (!contador_pwm(11) & (!contador_pwm(12) & !contador_pwm(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(13),
	datab => contador_pwm(11),
	datac => contador_pwm(12),
	datad => contador_pwm(10),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X8_Y7_N0
\LessThan0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (\LessThan1~0_combout\ & (((\LessThan0~0_combout\ & !contador_pwm(8))) # (!contador_pwm(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => contador_pwm(9),
	datac => \LessThan1~0_combout\,
	datad => contador_pwm(8),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X8_Y7_N2
\LessThan0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (!\LessThan0~1_combout\ & ((contador_pwm(15)) # ((contador_pwm(14) & !\LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~1_combout\,
	datab => contador_pwm(14),
	datac => contador_pwm(15),
	datad => \LessThan0~2_combout\,
	combout => \LessThan0~3_combout\);

-- Location: FF_X8_Y9_N13
\contador_pwm[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[0]~20_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(0));

-- Location: LCCOMB_X8_Y9_N14
\contador_pwm[1]~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[1]~22_combout\ = (contador_pwm(1) & (!\contador_pwm[0]~21\)) # (!contador_pwm(1) & ((\contador_pwm[0]~21\) # (GND)))
-- \contador_pwm[1]~23\ = CARRY((!\contador_pwm[0]~21\) # (!contador_pwm(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_pwm(1),
	datad => VCC,
	cin => \contador_pwm[0]~21\,
	combout => \contador_pwm[1]~22_combout\,
	cout => \contador_pwm[1]~23\);

-- Location: FF_X8_Y9_N15
\contador_pwm[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[1]~22_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(1));

-- Location: LCCOMB_X8_Y9_N16
\contador_pwm[2]~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[2]~24_combout\ = (contador_pwm(2) & (\contador_pwm[1]~23\ $ (GND))) # (!contador_pwm(2) & (!\contador_pwm[1]~23\ & VCC))
-- \contador_pwm[2]~25\ = CARRY((contador_pwm(2) & !\contador_pwm[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_pwm(2),
	datad => VCC,
	cin => \contador_pwm[1]~23\,
	combout => \contador_pwm[2]~24_combout\,
	cout => \contador_pwm[2]~25\);

-- Location: FF_X8_Y9_N17
\contador_pwm[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[2]~24_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(2));

-- Location: LCCOMB_X8_Y9_N18
\contador_pwm[3]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[3]~26_combout\ = (contador_pwm(3) & (!\contador_pwm[2]~25\)) # (!contador_pwm(3) & ((\contador_pwm[2]~25\) # (GND)))
-- \contador_pwm[3]~27\ = CARRY((!\contador_pwm[2]~25\) # (!contador_pwm(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(3),
	datad => VCC,
	cin => \contador_pwm[2]~25\,
	combout => \contador_pwm[3]~26_combout\,
	cout => \contador_pwm[3]~27\);

-- Location: FF_X8_Y9_N19
\contador_pwm[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[3]~26_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(3));

-- Location: LCCOMB_X8_Y9_N20
\contador_pwm[4]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[4]~28_combout\ = (contador_pwm(4) & (\contador_pwm[3]~27\ $ (GND))) # (!contador_pwm(4) & (!\contador_pwm[3]~27\ & VCC))
-- \contador_pwm[4]~29\ = CARRY((contador_pwm(4) & !\contador_pwm[3]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_pwm(4),
	datad => VCC,
	cin => \contador_pwm[3]~27\,
	combout => \contador_pwm[4]~28_combout\,
	cout => \contador_pwm[4]~29\);

-- Location: FF_X8_Y9_N21
\contador_pwm[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[4]~28_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(4));

-- Location: LCCOMB_X8_Y9_N22
\contador_pwm[5]~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[5]~30_combout\ = (contador_pwm(5) & (!\contador_pwm[4]~29\)) # (!contador_pwm(5) & ((\contador_pwm[4]~29\) # (GND)))
-- \contador_pwm[5]~31\ = CARRY((!\contador_pwm[4]~29\) # (!contador_pwm(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(5),
	datad => VCC,
	cin => \contador_pwm[4]~29\,
	combout => \contador_pwm[5]~30_combout\,
	cout => \contador_pwm[5]~31\);

-- Location: FF_X8_Y9_N23
\contador_pwm[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[5]~30_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(5));

-- Location: LCCOMB_X8_Y9_N24
\contador_pwm[6]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[6]~32_combout\ = (contador_pwm(6) & (\contador_pwm[5]~31\ $ (GND))) # (!contador_pwm(6) & (!\contador_pwm[5]~31\ & VCC))
-- \contador_pwm[6]~33\ = CARRY((contador_pwm(6) & !\contador_pwm[5]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_pwm(6),
	datad => VCC,
	cin => \contador_pwm[5]~31\,
	combout => \contador_pwm[6]~32_combout\,
	cout => \contador_pwm[6]~33\);

-- Location: FF_X8_Y9_N25
\contador_pwm[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[6]~32_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(6));

-- Location: LCCOMB_X8_Y9_N26
\contador_pwm[7]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[7]~34_combout\ = (contador_pwm(7) & (!\contador_pwm[6]~33\)) # (!contador_pwm(7) & ((\contador_pwm[6]~33\) # (GND)))
-- \contador_pwm[7]~35\ = CARRY((!\contador_pwm[6]~33\) # (!contador_pwm(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(7),
	datad => VCC,
	cin => \contador_pwm[6]~33\,
	combout => \contador_pwm[7]~34_combout\,
	cout => \contador_pwm[7]~35\);

-- Location: FF_X8_Y9_N27
\contador_pwm[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[7]~34_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(7));

-- Location: LCCOMB_X8_Y9_N28
\contador_pwm[8]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[8]~36_combout\ = (contador_pwm(8) & (\contador_pwm[7]~35\ $ (GND))) # (!contador_pwm(8) & (!\contador_pwm[7]~35\ & VCC))
-- \contador_pwm[8]~37\ = CARRY((contador_pwm(8) & !\contador_pwm[7]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_pwm(8),
	datad => VCC,
	cin => \contador_pwm[7]~35\,
	combout => \contador_pwm[8]~36_combout\,
	cout => \contador_pwm[8]~37\);

-- Location: FF_X8_Y9_N29
\contador_pwm[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[8]~36_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(8));

-- Location: LCCOMB_X8_Y9_N30
\contador_pwm[9]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[9]~38_combout\ = (contador_pwm(9) & (!\contador_pwm[8]~37\)) # (!contador_pwm(9) & ((\contador_pwm[8]~37\) # (GND)))
-- \contador_pwm[9]~39\ = CARRY((!\contador_pwm[8]~37\) # (!contador_pwm(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(9),
	datad => VCC,
	cin => \contador_pwm[8]~37\,
	combout => \contador_pwm[9]~38_combout\,
	cout => \contador_pwm[9]~39\);

-- Location: FF_X8_Y9_N31
\contador_pwm[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[9]~38_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(9));

-- Location: LCCOMB_X8_Y8_N0
\contador_pwm[10]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[10]~40_combout\ = (contador_pwm(10) & (\contador_pwm[9]~39\ $ (GND))) # (!contador_pwm(10) & (!\contador_pwm[9]~39\ & VCC))
-- \contador_pwm[10]~41\ = CARRY((contador_pwm(10) & !\contador_pwm[9]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_pwm(10),
	datad => VCC,
	cin => \contador_pwm[9]~39\,
	combout => \contador_pwm[10]~40_combout\,
	cout => \contador_pwm[10]~41\);

-- Location: FF_X8_Y8_N1
\contador_pwm[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[10]~40_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(10));

-- Location: LCCOMB_X8_Y8_N2
\contador_pwm[11]~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[11]~42_combout\ = (contador_pwm(11) & (!\contador_pwm[10]~41\)) # (!contador_pwm(11) & ((\contador_pwm[10]~41\) # (GND)))
-- \contador_pwm[11]~43\ = CARRY((!\contador_pwm[10]~41\) # (!contador_pwm(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_pwm(11),
	datad => VCC,
	cin => \contador_pwm[10]~41\,
	combout => \contador_pwm[11]~42_combout\,
	cout => \contador_pwm[11]~43\);

-- Location: FF_X8_Y8_N3
\contador_pwm[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[11]~42_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(11));

-- Location: LCCOMB_X8_Y8_N4
\contador_pwm[12]~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[12]~44_combout\ = (contador_pwm(12) & (\contador_pwm[11]~43\ $ (GND))) # (!contador_pwm(12) & (!\contador_pwm[11]~43\ & VCC))
-- \contador_pwm[12]~45\ = CARRY((contador_pwm(12) & !\contador_pwm[11]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_pwm(12),
	datad => VCC,
	cin => \contador_pwm[11]~43\,
	combout => \contador_pwm[12]~44_combout\,
	cout => \contador_pwm[12]~45\);

-- Location: FF_X8_Y8_N5
\contador_pwm[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[12]~44_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(12));

-- Location: LCCOMB_X8_Y8_N6
\contador_pwm[13]~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[13]~46_combout\ = (contador_pwm(13) & (!\contador_pwm[12]~45\)) # (!contador_pwm(13) & ((\contador_pwm[12]~45\) # (GND)))
-- \contador_pwm[13]~47\ = CARRY((!\contador_pwm[12]~45\) # (!contador_pwm(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(13),
	datad => VCC,
	cin => \contador_pwm[12]~45\,
	combout => \contador_pwm[13]~46_combout\,
	cout => \contador_pwm[13]~47\);

-- Location: FF_X8_Y8_N7
\contador_pwm[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[13]~46_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(13));

-- Location: LCCOMB_X8_Y8_N8
\contador_pwm[14]~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[14]~48_combout\ = (contador_pwm(14) & (\contador_pwm[13]~47\ $ (GND))) # (!contador_pwm(14) & (!\contador_pwm[13]~47\ & VCC))
-- \contador_pwm[14]~49\ = CARRY((contador_pwm(14) & !\contador_pwm[13]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_pwm(14),
	datad => VCC,
	cin => \contador_pwm[13]~47\,
	combout => \contador_pwm[14]~48_combout\,
	cout => \contador_pwm[14]~49\);

-- Location: FF_X8_Y8_N9
\contador_pwm[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[14]~48_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(14));

-- Location: LCCOMB_X8_Y8_N10
\contador_pwm[15]~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[15]~50_combout\ = (contador_pwm(15) & (!\contador_pwm[14]~49\)) # (!contador_pwm(15) & ((\contador_pwm[14]~49\) # (GND)))
-- \contador_pwm[15]~51\ = CARRY((!\contador_pwm[14]~49\) # (!contador_pwm(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(15),
	datad => VCC,
	cin => \contador_pwm[14]~49\,
	combout => \contador_pwm[15]~50_combout\,
	cout => \contador_pwm[15]~51\);

-- Location: FF_X8_Y8_N11
\contador_pwm[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[15]~50_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(15));

-- Location: LCCOMB_X8_Y8_N12
\contador_pwm[16]~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[16]~52_combout\ = (contador_pwm(16) & (\contador_pwm[15]~51\ $ (GND))) # (!contador_pwm(16) & (!\contador_pwm[15]~51\ & VCC))
-- \contador_pwm[16]~53\ = CARRY((contador_pwm(16) & !\contador_pwm[15]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(16),
	datad => VCC,
	cin => \contador_pwm[15]~51\,
	combout => \contador_pwm[16]~52_combout\,
	cout => \contador_pwm[16]~53\);

-- Location: FF_X8_Y8_N13
\contador_pwm[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[16]~52_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(16));

-- Location: LCCOMB_X8_Y8_N14
\contador_pwm[17]~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[17]~54_combout\ = (contador_pwm(17) & (!\contador_pwm[16]~53\)) # (!contador_pwm(17) & ((\contador_pwm[16]~53\) # (GND)))
-- \contador_pwm[17]~55\ = CARRY((!\contador_pwm[16]~53\) # (!contador_pwm(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_pwm(17),
	datad => VCC,
	cin => \contador_pwm[16]~53\,
	combout => \contador_pwm[17]~54_combout\,
	cout => \contador_pwm[17]~55\);

-- Location: FF_X8_Y8_N15
\contador_pwm[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[17]~54_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(17));

-- Location: LCCOMB_X8_Y8_N16
\contador_pwm[18]~56\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[18]~56_combout\ = (contador_pwm(18) & (\contador_pwm[17]~55\ $ (GND))) # (!contador_pwm(18) & (!\contador_pwm[17]~55\ & VCC))
-- \contador_pwm[18]~57\ = CARRY((contador_pwm(18) & !\contador_pwm[17]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_pwm(18),
	datad => VCC,
	cin => \contador_pwm[17]~55\,
	combout => \contador_pwm[18]~56_combout\,
	cout => \contador_pwm[18]~57\);

-- Location: FF_X8_Y8_N17
\contador_pwm[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[18]~56_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(18));

-- Location: LCCOMB_X8_Y8_N18
\contador_pwm[19]~58\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_pwm[19]~58_combout\ = \contador_pwm[18]~57\ $ (contador_pwm(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => contador_pwm(19),
	cin => \contador_pwm[18]~57\,
	combout => \contador_pwm[19]~58_combout\);

-- Location: FF_X8_Y8_N19
\contador_pwm[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_pwm[19]~58_combout\,
	sclr => \LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_pwm(19));

-- Location: IOIBUF_X14_Y29_N29
\credito_actual[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_actual(6),
	o => \credito_actual[6]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\credito_actual[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_actual(5),
	o => \credito_actual[5]~input_o\);

-- Location: IOIBUF_X11_Y0_N1
\credito_actual[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_actual(4),
	o => \credito_actual[4]~input_o\);

-- Location: LCCOMB_X10_Y6_N20
\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \credito_actual[4]~input_o\ $ (VCC)
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\credito_actual[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \credito_actual[4]~input_o\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X10_Y6_N22
\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\credito_actual[5]~input_o\ & (\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\credito_actual[5]~input_o\ & 
-- (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\credito_actual[5]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \credito_actual[5]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X10_Y6_N24
\Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\credito_actual[6]~input_o\ & (\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\credito_actual[6]~input_o\ & 
-- (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\credito_actual[6]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \credito_actual[6]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X10_Y6_N26
\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X10_Y6_N30
\Div0|auto_generated|divider|divider|StageOut[17]~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[17]~29_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[17]~29_combout\);

-- Location: LCCOMB_X10_Y6_N28
\Div0|auto_generated|divider|divider|StageOut[17]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[17]~28_combout\ = (\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \credito_actual[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \credito_actual[5]~input_o\,
	combout => \Div0|auto_generated|divider|divider|StageOut[17]~28_combout\);

-- Location: LCCOMB_X10_Y6_N12
\Div0|auto_generated|divider|divider|StageOut[16]~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~30_combout\ = (\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \credito_actual[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \credito_actual[4]~input_o\,
	combout => \Div0|auto_generated|divider|divider|StageOut[16]~30_combout\);

-- Location: LCCOMB_X10_Y6_N14
\Div0|auto_generated|divider|divider|StageOut[16]~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~31_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[16]~31_combout\);

-- Location: IOIBUF_X0_Y10_N22
\credito_actual[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_actual(3),
	o => \credito_actual[3]~input_o\);

-- Location: LCCOMB_X10_Y9_N8
\Div0|auto_generated|divider|divider|StageOut[15]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[15]~32_combout\ = (\credito_actual[3]~input_o\ & \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[3]~input_o\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[15]~32_combout\);

-- Location: LCCOMB_X10_Y9_N18
\Div0|auto_generated|divider|divider|StageOut[15]~33\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[15]~33_combout\ = (\credito_actual[3]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[3]~input_o\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[15]~33_combout\);

-- Location: LCCOMB_X10_Y6_N2
\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\Div0|auto_generated|divider|divider|StageOut[15]~32_combout\) # (\Div0|auto_generated|divider|divider|StageOut[15]~33_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[15]~32_combout\) # (\Div0|auto_generated|divider|divider|StageOut[15]~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[15]~32_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[15]~33_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X10_Y6_N4
\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\Div0|auto_generated|divider|divider|StageOut[16]~30_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[16]~31_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\Div0|auto_generated|divider|divider|StageOut[16]~30_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[16]~31_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[16]~30_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[16]~31_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[16]~30_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[16]~31_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X10_Y6_N6
\Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\Div0|auto_generated|divider|divider|StageOut[17]~29_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[17]~28_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\Div0|auto_generated|divider|divider|StageOut[17]~29_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[17]~28_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\Div0|auto_generated|divider|divider|StageOut[17]~29_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[17]~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[17]~29_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[17]~28_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X12_Y9_N30
\Div0|auto_generated|divider|divider|StageOut[18]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\ = (\credito_actual[6]~input_o\ & \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \credito_actual[6]~input_o\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\);

-- Location: LCCOMB_X10_Y6_N16
\Div0|auto_generated|divider|divider|StageOut[18]~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~27_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~27_combout\);

-- Location: LCCOMB_X10_Y6_N8
\Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[18]~26_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[18]~27_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[18]~27_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X10_Y6_N10
\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X9_Y9_N0
\Div0|auto_generated|divider|divider|StageOut[23]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[23]~34_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[23]~34_combout\);

-- Location: LCCOMB_X10_Y6_N0
\Div0|auto_generated|divider|divider|StageOut[23]~47\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[23]~47_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\credito_actual[5]~input_o\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \credito_actual[5]~input_o\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[23]~47_combout\);

-- Location: LCCOMB_X10_Y9_N12
\Div0|auto_generated|divider|divider|StageOut[22]~35\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[22]~35_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[22]~35_combout\);

-- Location: LCCOMB_X10_Y6_N18
\Div0|auto_generated|divider|divider|StageOut[22]~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[22]~48_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\credito_actual[4]~input_o\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \credito_actual[4]~input_o\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[22]~48_combout\);

-- Location: LCCOMB_X10_Y9_N10
\Div0|auto_generated|divider|divider|StageOut[21]~37\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[21]~37_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[21]~37_combout\);

-- Location: LCCOMB_X9_Y9_N30
\Div0|auto_generated|divider|divider|StageOut[21]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[21]~36_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \credito_actual[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \credito_actual[3]~input_o\,
	combout => \Div0|auto_generated|divider|divider|StageOut[21]~36_combout\);

-- Location: IOIBUF_X0_Y12_N22
\credito_actual[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_actual(2),
	o => \credito_actual[2]~input_o\);

-- Location: LCCOMB_X9_Y9_N16
\Div0|auto_generated|divider|divider|StageOut[20]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[20]~38_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \credito_actual[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \credito_actual[2]~input_o\,
	combout => \Div0|auto_generated|divider|divider|StageOut[20]~38_combout\);

-- Location: LCCOMB_X9_Y9_N6
\Div0|auto_generated|divider|divider|StageOut[20]~39\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[20]~39_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \credito_actual[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \credito_actual[2]~input_o\,
	combout => \Div0|auto_generated|divider|divider|StageOut[20]~39_combout\);

-- Location: LCCOMB_X10_Y9_N20
\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\Div0|auto_generated|divider|divider|StageOut[20]~38_combout\) # (\Div0|auto_generated|divider|divider|StageOut[20]~39_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[20]~38_combout\) # (\Div0|auto_generated|divider|divider|StageOut[20]~39_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[20]~38_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[20]~39_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X10_Y9_N22
\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\Div0|auto_generated|divider|divider|StageOut[21]~37_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[21]~36_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\Div0|auto_generated|divider|divider|StageOut[21]~37_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[21]~36_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[21]~37_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[21]~36_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[21]~37_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[21]~36_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X10_Y9_N24
\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\Div0|auto_generated|divider|divider|StageOut[22]~35_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[22]~48_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\Div0|auto_generated|divider|divider|StageOut[22]~35_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[22]~48_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\Div0|auto_generated|divider|divider|StageOut[22]~35_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[22]~48_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[22]~35_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[22]~48_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X10_Y9_N26
\Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[23]~34_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[23]~47_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[23]~34_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[23]~47_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X10_Y9_N28
\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X10_Y9_N30
\Div0|auto_generated|divider|divider|StageOut[28]~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[28]~46_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[22]~48_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[22]~48_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[28]~46_combout\);

-- Location: LCCOMB_X9_Y9_N4
\Div0|auto_generated|divider|divider|StageOut[28]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[28]~40_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[28]~40_combout\);

-- Location: LCCOMB_X10_Y9_N4
\Div0|auto_generated|divider|divider|StageOut[27]~41\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[27]~41_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[27]~41_combout\);

-- Location: LCCOMB_X10_Y9_N0
\Div0|auto_generated|divider|divider|StageOut[27]~49\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[27]~49_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\credito_actual[3]~input_o\))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \credito_actual[3]~input_o\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[27]~49_combout\);

-- Location: LCCOMB_X9_Y9_N12
\Div0|auto_generated|divider|divider|StageOut[26]~43\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[26]~43_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[26]~43_combout\);

-- Location: LCCOMB_X9_Y9_N18
\Div0|auto_generated|divider|divider|StageOut[26]~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[26]~42_combout\ = (\credito_actual[2]~input_o\ & \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \credito_actual[2]~input_o\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[26]~42_combout\);

-- Location: IOIBUF_X14_Y0_N22
\credito_actual[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_actual(1),
	o => \credito_actual[1]~input_o\);

-- Location: LCCOMB_X10_Y9_N16
\Div0|auto_generated|divider|divider|StageOut[25]~45\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[25]~45_combout\ = (\credito_actual[1]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[1]~input_o\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[25]~45_combout\);

-- Location: LCCOMB_X10_Y9_N14
\Div0|auto_generated|divider|divider|StageOut[25]~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[25]~44_combout\ = (\credito_actual[1]~input_o\ & \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[1]~input_o\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[25]~44_combout\);

-- Location: LCCOMB_X9_Y9_N20
\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1_cout\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[25]~45_combout\) # (\Div0|auto_generated|divider|divider|StageOut[25]~44_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[25]~45_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[25]~44_combout\,
	datad => VCC,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1_cout\);

-- Location: LCCOMB_X9_Y9_N22
\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[26]~43_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[26]~42_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[26]~43_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[26]~42_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3_cout\);

-- Location: LCCOMB_X9_Y9_N24
\Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5_cout\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3_cout\ & ((\Div0|auto_generated|divider|divider|StageOut[27]~41_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[27]~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[27]~41_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[27]~49_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5_cout\);

-- Location: LCCOMB_X9_Y9_N26
\Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[28]~46_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[28]~40_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[28]~46_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[28]~40_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\);

-- Location: LCCOMB_X9_Y9_N28
\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ = \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\);

-- Location: LCCOMB_X12_Y8_N28
\estado_devolucion.VOLVER_0_10~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \estado_devolucion.VOLVER_0_10~feeder_combout\ = \estado_devolucion.ESPERAR_190_10~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \estado_devolucion.ESPERAR_190_10~q\,
	combout => \estado_devolucion.VOLVER_0_10~feeder_combout\);

-- Location: IOIBUF_X0_Y14_N8
\reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G2
\reset~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: LCCOMB_X10_Y8_N6
\contador_1seg[0]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[0]~26_combout\ = contador_1seg(0) $ (VCC)
-- \contador_1seg[0]~27\ = CARRY(contador_1seg(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(0),
	datad => VCC,
	combout => \contador_1seg[0]~26_combout\,
	cout => \contador_1seg[0]~27\);

-- Location: LCCOMB_X10_Y7_N30
\LessThan4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan4~0_combout\ = (contador_1seg(20) & contador_1seg(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => contador_1seg(20),
	datad => contador_1seg(19),
	combout => \LessThan4~0_combout\);

-- Location: LCCOMB_X10_Y8_N0
\LessThan6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan6~0_combout\ = (((!contador_1seg(8) & !contador_1seg(7))) # (!contador_1seg(9))) # (!contador_1seg(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(8),
	datab => contador_1seg(7),
	datac => contador_1seg(10),
	datad => contador_1seg(9),
	combout => \LessThan6~0_combout\);

-- Location: LCCOMB_X10_Y8_N2
\LessThan6~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan6~1_combout\ = ((!contador_1seg(11) & \LessThan6~0_combout\)) # (!contador_1seg(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(11),
	datac => contador_1seg(12),
	datad => \LessThan6~0_combout\,
	combout => \LessThan6~1_combout\);

-- Location: LCCOMB_X11_Y8_N16
\LessThan6~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan6~2_combout\ = ((!contador_1seg(14) & (!contador_1seg(13) & \LessThan6~1_combout\))) # (!contador_1seg(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(14),
	datab => contador_1seg(13),
	datac => contador_1seg(15),
	datad => \LessThan6~1_combout\,
	combout => \LessThan6~2_combout\);

-- Location: LCCOMB_X11_Y8_N2
\LessThan6~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan6~3_combout\ = (!contador_1seg(17) & (!contador_1seg(16) & (!contador_1seg(18) & \LessThan6~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(17),
	datab => contador_1seg(16),
	datac => contador_1seg(18),
	datad => \LessThan6~2_combout\,
	combout => \LessThan6~3_combout\);

-- Location: LCCOMB_X11_Y8_N20
\LessThan6~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan6~4_combout\ = (!contador_1seg(21) & (!contador_1seg(22) & ((\LessThan6~3_combout\) # (!\LessThan4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(21),
	datab => contador_1seg(22),
	datac => \LessThan4~0_combout\,
	datad => \LessThan6~3_combout\,
	combout => \LessThan6~4_combout\);

-- Location: LCCOMB_X11_Y8_N6
\LessThan6~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan6~5_combout\ = (!contador_1seg(25) & (!contador_1seg(24) & ((\LessThan6~4_combout\) # (!contador_1seg(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(25),
	datab => contador_1seg(24),
	datac => contador_1seg(23),
	datad => \LessThan6~4_combout\,
	combout => \LessThan6~5_combout\);

-- Location: LCCOMB_X15_Y13_N0
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \credito_actual[4]~input_o\ $ (VCC)
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\credito_actual[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \credito_actual[4]~input_o\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X15_Y13_N2
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\credito_actual[5]~input_o\ & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\credito_actual[5]~input_o\ & 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\credito_actual[5]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \credito_actual[5]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X15_Y13_N4
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\credito_actual[6]~input_o\ & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\credito_actual[6]~input_o\ & 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\credito_actual[6]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \credito_actual[6]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X15_Y13_N6
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X15_Y13_N16
\Mod0|auto_generated|divider|divider|StageOut[24]~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[24]~54_combout\ = (\credito_actual[6]~input_o\ & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[6]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[24]~54_combout\);

-- Location: LCCOMB_X15_Y13_N22
\Mod0|auto_generated|divider|divider|StageOut[24]~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[24]~55_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[24]~55_combout\);

-- Location: LCCOMB_X15_Y13_N14
\Mod0|auto_generated|divider|divider|StageOut[23]~57\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[23]~57_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[23]~57_combout\);

-- Location: LCCOMB_X15_Y13_N28
\Mod0|auto_generated|divider|divider|StageOut[23]~56\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[23]~56_combout\ = (\credito_actual[5]~input_o\ & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[5]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[23]~56_combout\);

-- Location: LCCOMB_X15_Y13_N26
\Mod0|auto_generated|divider|divider|StageOut[22]~59\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[22]~59_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[22]~59_combout\);

-- Location: LCCOMB_X15_Y13_N20
\Mod0|auto_generated|divider|divider|StageOut[22]~58\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[22]~58_combout\ = (\credito_actual[4]~input_o\ & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[4]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[22]~58_combout\);

-- Location: LCCOMB_X15_Y13_N12
\Mod0|auto_generated|divider|divider|StageOut[21]~60\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[21]~60_combout\ = (\credito_actual[3]~input_o\ & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[3]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[21]~60_combout\);

-- Location: LCCOMB_X15_Y13_N18
\Mod0|auto_generated|divider|divider|StageOut[21]~61\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[21]~61_combout\ = (\credito_actual[3]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[3]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[21]~61_combout\);

-- Location: LCCOMB_X16_Y13_N0
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[21]~60_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[21]~61_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[21]~60_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[21]~61_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[21]~60_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[21]~61_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X16_Y13_N2
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[22]~59_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[22]~58_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[22]~59_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[22]~58_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[22]~59_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[22]~58_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[22]~59_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[22]~58_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X16_Y13_N4
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[23]~57_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[23]~56_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[23]~57_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[23]~56_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[23]~57_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[23]~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[23]~57_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[23]~56_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X16_Y13_N6
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\Mod0|auto_generated|divider|divider|StageOut[24]~54_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[24]~55_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\Mod0|auto_generated|divider|divider|StageOut[24]~54_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[24]~55_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[24]~54_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[24]~55_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[24]~54_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[24]~55_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X16_Y13_N8
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X16_Y13_N26
\Mod0|auto_generated|divider|divider|StageOut[32]~62\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[32]~62_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[32]~62_combout\);

-- Location: LCCOMB_X15_Y13_N10
\Mod0|auto_generated|divider|divider|StageOut[32]~93\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[32]~93_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\credito_actual[6]~input_o\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \credito_actual[6]~input_o\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[32]~93_combout\);

-- Location: LCCOMB_X15_Y13_N8
\Mod0|auto_generated|divider|divider|StageOut[31]~94\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[31]~94_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\credito_actual[5]~input_o\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \credito_actual[5]~input_o\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[31]~94_combout\);

-- Location: LCCOMB_X16_Y13_N28
\Mod0|auto_generated|divider|divider|StageOut[31]~63\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[31]~63_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[31]~63_combout\);

-- Location: LCCOMB_X16_Y13_N10
\Mod0|auto_generated|divider|divider|StageOut[30]~64\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[30]~64_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[30]~64_combout\);

-- Location: LCCOMB_X15_Y13_N30
\Mod0|auto_generated|divider|divider|StageOut[30]~95\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[30]~95_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\credito_actual[4]~input_o\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \credito_actual[4]~input_o\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[30]~95_combout\);

-- Location: LCCOMB_X17_Y13_N4
\Mod0|auto_generated|divider|divider|StageOut[29]~66\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[29]~66_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[29]~66_combout\);

-- Location: LCCOMB_X15_Y13_N24
\Mod0|auto_generated|divider|divider|StageOut[29]~65\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[29]~65_combout\ = (\credito_actual[3]~input_o\ & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \credito_actual[3]~input_o\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[29]~65_combout\);

-- Location: LCCOMB_X17_Y12_N12
\Mod0|auto_generated|divider|divider|StageOut[28]~67\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[28]~67_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \credito_actual[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \credito_actual[2]~input_o\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[28]~67_combout\);

-- Location: LCCOMB_X17_Y12_N26
\Mod0|auto_generated|divider|divider|StageOut[28]~68\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[28]~68_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \credito_actual[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \credito_actual[2]~input_o\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[28]~68_combout\);

-- Location: LCCOMB_X16_Y13_N12
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[28]~67_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[28]~68_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[28]~67_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[28]~68_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[28]~67_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[28]~68_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X16_Y13_N14
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[29]~66_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[29]~65_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[29]~66_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[29]~65_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[29]~66_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[29]~65_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[29]~66_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[29]~65_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X16_Y13_N16
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[30]~64_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[30]~95_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[30]~64_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[30]~95_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[30]~64_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[30]~95_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[30]~64_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[30]~95_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X16_Y13_N18
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ & (((\Mod0|auto_generated|divider|divider|StageOut[31]~94_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[31]~63_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ & (!\Mod0|auto_generated|divider|divider|StageOut[31]~94_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[31]~63_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[31]~94_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[31]~63_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[31]~94_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[31]~63_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\);

-- Location: LCCOMB_X16_Y13_N20
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ & ((((\Mod0|auto_generated|divider|divider|StageOut[32]~62_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[32]~93_combout\))))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ & ((\Mod0|auto_generated|divider|divider|StageOut[32]~62_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|StageOut[32]~93_combout\) # (GND))))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[32]~62_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[32]~93_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[32]~62_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[32]~93_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\);

-- Location: LCCOMB_X16_Y13_N22
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\);

-- Location: LCCOMB_X17_Y13_N26
\Mod0|auto_generated|divider|divider|StageOut[40]~69\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[40]~69_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[40]~69_combout\);

-- Location: LCCOMB_X17_Y13_N0
\Mod0|auto_generated|divider|divider|StageOut[40]~86\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[40]~86_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[32]~93_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[32]~93_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[40]~86_combout\);

-- Location: LCCOMB_X17_Y13_N8
\Mod0|auto_generated|divider|divider|StageOut[39]~70\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[39]~70_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[39]~70_combout\);

-- Location: LCCOMB_X16_Y13_N24
\Mod0|auto_generated|divider|divider|StageOut[39]~87\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[39]~87_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[31]~94_combout\) # 
-- ((!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[31]~94_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[39]~87_combout\);

-- Location: LCCOMB_X17_Y13_N6
\Mod0|auto_generated|divider|divider|StageOut[38]~71\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[38]~71_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[38]~71_combout\);

-- Location: LCCOMB_X16_Y13_N30
\Mod0|auto_generated|divider|divider|StageOut[38]~88\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[38]~88_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[30]~95_combout\) # 
-- ((!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[30]~95_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[38]~88_combout\);

-- Location: LCCOMB_X17_Y13_N24
\Mod0|auto_generated|divider|divider|StageOut[37]~72\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[37]~72_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[37]~72_combout\);

-- Location: LCCOMB_X14_Y13_N4
\Mod0|auto_generated|divider|divider|StageOut[37]~96\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[37]~96_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\credito_actual[3]~input_o\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \credito_actual[3]~input_o\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[37]~96_combout\);

-- Location: LCCOMB_X17_Y12_N0
\Mod0|auto_generated|divider|divider|StageOut[36]~73\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[36]~73_combout\ = (\credito_actual[2]~input_o\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \credito_actual[2]~input_o\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[36]~73_combout\);

-- Location: LCCOMB_X19_Y13_N16
\Mod0|auto_generated|divider|divider|StageOut[36]~74\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[36]~74_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[36]~74_combout\);

-- Location: LCCOMB_X14_Y12_N0
\Mod0|auto_generated|divider|divider|StageOut[35]~75\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[35]~75_combout\ = (\credito_actual[1]~input_o\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[1]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[35]~75_combout\);

-- Location: LCCOMB_X14_Y12_N10
\Mod0|auto_generated|divider|divider|StageOut[35]~76\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[35]~76_combout\ = (\credito_actual[1]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[1]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[35]~76_combout\);

-- Location: LCCOMB_X17_Y13_N10
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[35]~75_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[35]~76_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[35]~75_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[35]~76_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[35]~75_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[35]~76_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\);

-- Location: LCCOMB_X17_Y13_N12
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[36]~73_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[36]~74_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[36]~73_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[36]~74_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[36]~73_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[36]~74_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[36]~73_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[36]~74_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\);

-- Location: LCCOMB_X17_Y13_N14
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[37]~72_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[37]~96_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[37]~72_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[37]~96_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[37]~72_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[37]~96_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[37]~72_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[37]~96_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\);

-- Location: LCCOMB_X17_Y13_N16
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ & (((\Mod0|auto_generated|divider|divider|StageOut[38]~71_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[38]~88_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ & (!\Mod0|auto_generated|divider|divider|StageOut[38]~71_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[38]~88_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[38]~71_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[38]~88_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[38]~71_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[38]~88_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7\);

-- Location: LCCOMB_X17_Y13_N18
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ & ((((\Mod0|auto_generated|divider|divider|StageOut[39]~70_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[39]~87_combout\))))) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ & ((\Mod0|auto_generated|divider|divider|StageOut[39]~70_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|StageOut[39]~87_combout\) # (GND))))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~9\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[39]~70_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[39]~87_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[39]~70_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[39]~87_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~9\);

-- Location: LCCOMB_X17_Y13_N20
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~9\ & (((\Mod0|auto_generated|divider|divider|StageOut[40]~69_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[40]~86_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~9\ & (!\Mod0|auto_generated|divider|divider|StageOut[40]~69_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[40]~86_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~11\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[40]~69_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[40]~86_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[40]~69_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[40]~86_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~9\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~11\);

-- Location: LCCOMB_X17_Y13_N22
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ = \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~11\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~11\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\);

-- Location: LCCOMB_X17_Y13_N30
\Mod0|auto_generated|divider|divider|StageOut[48]~89\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[48]~89_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[40]~86_combout\) # 
-- ((!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[40]~86_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[48]~89_combout\);

-- Location: LCCOMB_X20_Y12_N24
\Mod0|auto_generated|divider|divider|StageOut[48]~77\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[48]~77_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[48]~77_combout\);

-- Location: LCCOMB_X20_Y12_N22
\Mod0|auto_generated|divider|divider|StageOut[47]~78\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[47]~78_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[47]~78_combout\);

-- Location: LCCOMB_X17_Y13_N28
\Mod0|auto_generated|divider|divider|StageOut[47]~90\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[47]~90_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[39]~87_combout\) # 
-- ((!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[39]~87_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[47]~90_combout\);

-- Location: LCCOMB_X17_Y12_N16
\Mod0|auto_generated|divider|divider|StageOut[46]~91\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[46]~91_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[38]~88_combout\) # 
-- ((!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[38]~88_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[46]~91_combout\);

-- Location: LCCOMB_X20_Y12_N16
\Mod0|auto_generated|divider|divider|StageOut[46]~79\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[46]~79_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[46]~79_combout\);

-- Location: LCCOMB_X20_Y12_N0
\Div1|auto_generated|divider|divider|op_1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_1~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[46]~91_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[46]~79_combout\)))
-- \Div1|auto_generated|divider|divider|op_1~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[46]~91_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[46]~79_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[46]~91_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[46]~79_combout\,
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|op_1~0_combout\,
	cout => \Div1|auto_generated|divider|divider|op_1~1\);

-- Location: LCCOMB_X20_Y12_N2
\Div1|auto_generated|divider|divider|op_1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_1~2_combout\ = (\Div1|auto_generated|divider|divider|op_1~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[47]~78_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[47]~90_combout\)))) # 
-- (!\Div1|auto_generated|divider|divider|op_1~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[47]~78_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[47]~90_combout\)))
-- \Div1|auto_generated|divider|divider|op_1~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[47]~78_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[47]~90_combout\ & !\Div1|auto_generated|divider|divider|op_1~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[47]~78_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[47]~90_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_1~1\,
	combout => \Div1|auto_generated|divider|divider|op_1~2_combout\,
	cout => \Div1|auto_generated|divider|divider|op_1~3\);

-- Location: LCCOMB_X20_Y12_N4
\Div1|auto_generated|divider|divider|op_1~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_1~4_combout\ = (\Div1|auto_generated|divider|divider|op_1~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[48]~89_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[48]~77_combout\)))) # 
-- (!\Div1|auto_generated|divider|divider|op_1~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[48]~89_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[48]~77_combout\)))))
-- \Div1|auto_generated|divider|divider|op_1~5\ = CARRY((!\Div1|auto_generated|divider|divider|op_1~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[48]~89_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[48]~77_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[48]~89_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[48]~77_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_1~3\,
	combout => \Div1|auto_generated|divider|divider|op_1~4_combout\,
	cout => \Div1|auto_generated|divider|divider|op_1~5\);

-- Location: LCCOMB_X20_Y12_N6
\Div1|auto_generated|divider|divider|op_1~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_1~6_combout\ = !\Div1|auto_generated|divider|divider|op_1~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|op_1~5\,
	combout => \Div1|auto_generated|divider|divider|op_1~6_combout\);

-- Location: LCCOMB_X20_Y12_N18
\Div1|auto_generated|divider|divider|StageOut[10]~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[10]~30_combout\ = (\Div1|auto_generated|divider|divider|op_1~4_combout\ & !\Div1|auto_generated|divider|divider|op_1~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|op_1~4_combout\,
	datad => \Div1|auto_generated|divider|divider|op_1~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[10]~30_combout\);

-- Location: LCCOMB_X20_Y12_N12
\Div1|auto_generated|divider|divider|StageOut[10]~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[10]~42_combout\ = (\Div1|auto_generated|divider|divider|op_1~6_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[48]~89_combout\) # 
-- ((!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[48]~89_combout\,
	datad => \Div1|auto_generated|divider|divider|op_1~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[10]~42_combout\);

-- Location: LCCOMB_X20_Y12_N30
\Div1|auto_generated|divider|divider|StageOut[9]~43\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[9]~43_combout\ = (\Div1|auto_generated|divider|divider|op_1~6_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[47]~90_combout\) # 
-- ((!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[47]~90_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|op_1~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[9]~43_combout\);

-- Location: LCCOMB_X20_Y12_N8
\Div1|auto_generated|divider|divider|StageOut[9]~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[9]~31_combout\ = (\Div1|auto_generated|divider|divider|op_1~2_combout\ & !\Div1|auto_generated|divider|divider|op_1~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|op_1~2_combout\,
	datad => \Div1|auto_generated|divider|divider|op_1~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[9]~31_combout\);

-- Location: LCCOMB_X20_Y12_N20
\Div1|auto_generated|divider|divider|StageOut[8]~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[8]~44_combout\ = (\Div1|auto_generated|divider|divider|op_1~6_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[46]~91_combout\) # 
-- ((!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[46]~91_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\,
	datad => \Div1|auto_generated|divider|divider|op_1~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[8]~44_combout\);

-- Location: LCCOMB_X20_Y12_N14
\Div1|auto_generated|divider|divider|StageOut[8]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[8]~32_combout\ = (!\Div1|auto_generated|divider|divider|op_1~6_combout\ & \Div1|auto_generated|divider|divider|op_1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|op_1~6_combout\,
	datad => \Div1|auto_generated|divider|divider|op_1~0_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[8]~32_combout\);

-- Location: LCCOMB_X17_Y12_N10
\Mod0|auto_generated|divider|divider|StageOut[45]~80\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[45]~80_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[45]~80_combout\);

-- Location: LCCOMB_X17_Y13_N2
\Mod0|auto_generated|divider|divider|StageOut[45]~92\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[45]~92_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[37]~96_combout\) # 
-- ((!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[37]~96_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[45]~92_combout\);

-- Location: LCCOMB_X19_Y12_N2
\Div1|auto_generated|divider|divider|op_2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_2~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[45]~80_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[45]~92_combout\)))
-- \Div1|auto_generated|divider|divider|op_2~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[45]~80_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[45]~92_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[45]~80_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[45]~92_combout\,
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|op_2~0_combout\,
	cout => \Div1|auto_generated|divider|divider|op_2~1\);

-- Location: LCCOMB_X19_Y12_N4
\Div1|auto_generated|divider|divider|op_2~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_2~2_combout\ = (\Div1|auto_generated|divider|divider|op_2~1\ & (((\Div1|auto_generated|divider|divider|StageOut[8]~44_combout\) # (\Div1|auto_generated|divider|divider|StageOut[8]~32_combout\)))) # 
-- (!\Div1|auto_generated|divider|divider|op_2~1\ & (!\Div1|auto_generated|divider|divider|StageOut[8]~44_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[8]~32_combout\)))
-- \Div1|auto_generated|divider|divider|op_2~3\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[8]~44_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[8]~32_combout\ & !\Div1|auto_generated|divider|divider|op_2~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[8]~44_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[8]~32_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_2~1\,
	combout => \Div1|auto_generated|divider|divider|op_2~2_combout\,
	cout => \Div1|auto_generated|divider|divider|op_2~3\);

-- Location: LCCOMB_X19_Y12_N6
\Div1|auto_generated|divider|divider|op_2~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_2~4_combout\ = (\Div1|auto_generated|divider|divider|op_2~3\ & (((\Div1|auto_generated|divider|divider|StageOut[9]~43_combout\) # (\Div1|auto_generated|divider|divider|StageOut[9]~31_combout\)))) # 
-- (!\Div1|auto_generated|divider|divider|op_2~3\ & ((((\Div1|auto_generated|divider|divider|StageOut[9]~43_combout\) # (\Div1|auto_generated|divider|divider|StageOut[9]~31_combout\)))))
-- \Div1|auto_generated|divider|divider|op_2~5\ = CARRY((!\Div1|auto_generated|divider|divider|op_2~3\ & ((\Div1|auto_generated|divider|divider|StageOut[9]~43_combout\) # (\Div1|auto_generated|divider|divider|StageOut[9]~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[9]~43_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[9]~31_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_2~3\,
	combout => \Div1|auto_generated|divider|divider|op_2~4_combout\,
	cout => \Div1|auto_generated|divider|divider|op_2~5\);

-- Location: LCCOMB_X19_Y12_N8
\Div1|auto_generated|divider|divider|op_2~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_2~7_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[10]~30_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[10]~42_combout\ & !\Div1|auto_generated|divider|divider|op_2~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[10]~30_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[10]~42_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_2~5\,
	cout => \Div1|auto_generated|divider|divider|op_2~7_cout\);

-- Location: LCCOMB_X19_Y12_N10
\Div1|auto_generated|divider|divider|op_2~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_2~8_combout\ = \Div1|auto_generated|divider|divider|op_2~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|op_2~7_cout\,
	combout => \Div1|auto_generated|divider|divider|op_2~8_combout\);

-- Location: LCCOMB_X19_Y12_N12
\Div1|auto_generated|divider|divider|StageOut[14]~33\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[14]~33_combout\ = (!\Div1|auto_generated|divider|divider|op_2~8_combout\ & \Div1|auto_generated|divider|divider|op_2~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|op_2~8_combout\,
	datad => \Div1|auto_generated|divider|divider|op_2~4_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[14]~33_combout\);

-- Location: LCCOMB_X20_Y12_N26
\Div1|auto_generated|divider|divider|StageOut[14]~45\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[14]~45_combout\ = (\Div1|auto_generated|divider|divider|op_2~8_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[9]~43_combout\) # ((\Div1|auto_generated|divider|divider|op_1~2_combout\ & 
-- !\Div1|auto_generated|divider|divider|op_1~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|op_2~8_combout\,
	datab => \Div1|auto_generated|divider|divider|op_1~2_combout\,
	datac => \Div1|auto_generated|divider|divider|StageOut[9]~43_combout\,
	datad => \Div1|auto_generated|divider|divider|op_1~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[14]~45_combout\);

-- Location: LCCOMB_X16_Y12_N12
\Div1|auto_generated|divider|divider|StageOut[13]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[13]~34_combout\ = (!\Div1|auto_generated|divider|divider|op_2~8_combout\ & \Div1|auto_generated|divider|divider|op_2~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|op_2~8_combout\,
	datac => \Div1|auto_generated|divider|divider|op_2~2_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[13]~34_combout\);

-- Location: LCCOMB_X20_Y12_N28
\Div1|auto_generated|divider|divider|StageOut[13]~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[13]~46_combout\ = (\Div1|auto_generated|divider|divider|op_2~8_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[8]~44_combout\) # ((!\Div1|auto_generated|divider|divider|op_1~6_combout\ & 
-- \Div1|auto_generated|divider|divider|op_1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|op_1~6_combout\,
	datab => \Div1|auto_generated|divider|divider|op_1~0_combout\,
	datac => \Div1|auto_generated|divider|divider|StageOut[8]~44_combout\,
	datad => \Div1|auto_generated|divider|divider|op_2~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[13]~46_combout\);

-- Location: LCCOMB_X16_Y12_N10
\Div1|auto_generated|divider|divider|StageOut[12]~35\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[12]~35_combout\ = (!\Div1|auto_generated|divider|divider|op_2~8_combout\ & \Div1|auto_generated|divider|divider|op_2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|op_2~8_combout\,
	datad => \Div1|auto_generated|divider|divider|op_2~0_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[12]~35_combout\);

-- Location: LCCOMB_X17_Y12_N14
\Div1|auto_generated|divider|divider|StageOut[12]~47\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[12]~47_combout\ = (\Div1|auto_generated|divider|divider|op_2~8_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[45]~92_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[45]~92_combout\,
	datad => \Div1|auto_generated|divider|divider|op_2~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[12]~47_combout\);

-- Location: LCCOMB_X14_Y12_N24
\Mod0|auto_generated|divider|divider|StageOut[44]~81\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[44]~81_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[44]~81_combout\);

-- Location: LCCOMB_X17_Y12_N28
\Mod0|auto_generated|divider|divider|StageOut[44]~97\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[44]~97_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (\credito_actual[2]~input_o\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \credito_actual[2]~input_o\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[44]~97_combout\);

-- Location: LCCOMB_X16_Y12_N16
\Div1|auto_generated|divider|divider|op_3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_3~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[44]~81_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[44]~97_combout\)))
-- \Div1|auto_generated|divider|divider|op_3~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[44]~81_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[44]~97_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[44]~81_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[44]~97_combout\,
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|op_3~0_combout\,
	cout => \Div1|auto_generated|divider|divider|op_3~1\);

-- Location: LCCOMB_X16_Y12_N18
\Div1|auto_generated|divider|divider|op_3~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_3~2_combout\ = (\Div1|auto_generated|divider|divider|op_3~1\ & (((\Div1|auto_generated|divider|divider|StageOut[12]~35_combout\) # (\Div1|auto_generated|divider|divider|StageOut[12]~47_combout\)))) # 
-- (!\Div1|auto_generated|divider|divider|op_3~1\ & (!\Div1|auto_generated|divider|divider|StageOut[12]~35_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[12]~47_combout\)))
-- \Div1|auto_generated|divider|divider|op_3~3\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[12]~35_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[12]~47_combout\ & !\Div1|auto_generated|divider|divider|op_3~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[12]~35_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[12]~47_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_3~1\,
	combout => \Div1|auto_generated|divider|divider|op_3~2_combout\,
	cout => \Div1|auto_generated|divider|divider|op_3~3\);

-- Location: LCCOMB_X16_Y12_N20
\Div1|auto_generated|divider|divider|op_3~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_3~4_combout\ = (\Div1|auto_generated|divider|divider|op_3~3\ & (((\Div1|auto_generated|divider|divider|StageOut[13]~34_combout\) # (\Div1|auto_generated|divider|divider|StageOut[13]~46_combout\)))) # 
-- (!\Div1|auto_generated|divider|divider|op_3~3\ & ((((\Div1|auto_generated|divider|divider|StageOut[13]~34_combout\) # (\Div1|auto_generated|divider|divider|StageOut[13]~46_combout\)))))
-- \Div1|auto_generated|divider|divider|op_3~5\ = CARRY((!\Div1|auto_generated|divider|divider|op_3~3\ & ((\Div1|auto_generated|divider|divider|StageOut[13]~34_combout\) # (\Div1|auto_generated|divider|divider|StageOut[13]~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[13]~34_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[13]~46_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_3~3\,
	combout => \Div1|auto_generated|divider|divider|op_3~4_combout\,
	cout => \Div1|auto_generated|divider|divider|op_3~5\);

-- Location: LCCOMB_X16_Y12_N22
\Div1|auto_generated|divider|divider|op_3~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_3~7_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[14]~33_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[14]~45_combout\ & !\Div1|auto_generated|divider|divider|op_3~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[14]~33_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[14]~45_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_3~5\,
	cout => \Div1|auto_generated|divider|divider|op_3~7_cout\);

-- Location: LCCOMB_X16_Y12_N24
\Div1|auto_generated|divider|divider|op_3~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_3~8_combout\ = \Div1|auto_generated|divider|divider|op_3~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|op_3~7_cout\,
	combout => \Div1|auto_generated|divider|divider|op_3~8_combout\);

-- Location: LCCOMB_X16_Y12_N4
\Div1|auto_generated|divider|divider|StageOut[17]~49\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[17]~49_combout\ = (\Div1|auto_generated|divider|divider|op_3~8_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[12]~47_combout\) # ((!\Div1|auto_generated|divider|divider|op_2~8_combout\ & 
-- \Div1|auto_generated|divider|divider|op_2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|op_2~8_combout\,
	datab => \Div1|auto_generated|divider|divider|op_3~8_combout\,
	datac => \Div1|auto_generated|divider|divider|StageOut[12]~47_combout\,
	datad => \Div1|auto_generated|divider|divider|op_2~0_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[17]~49_combout\);

-- Location: LCCOMB_X16_Y12_N14
\Div1|auto_generated|divider|divider|StageOut[17]~37\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[17]~37_combout\ = (!\Div1|auto_generated|divider|divider|op_3~8_combout\ & \Div1|auto_generated|divider|divider|op_3~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|op_3~8_combout\,
	datad => \Div1|auto_generated|divider|divider|op_3~2_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[17]~37_combout\);

-- Location: LCCOMB_X16_Y12_N6
\Div1|auto_generated|divider|divider|StageOut[16]~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[16]~50_combout\ = (\Div1|auto_generated|divider|divider|op_3~8_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[44]~97_combout\) # 
-- ((!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datab => \Div1|auto_generated|divider|divider|op_3~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[44]~97_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[16]~50_combout\);

-- Location: LCCOMB_X16_Y12_N8
\Div1|auto_generated|divider|divider|StageOut[16]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[16]~38_combout\ = (!\Div1|auto_generated|divider|divider|op_3~8_combout\ & \Div1|auto_generated|divider|divider|op_3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|op_3~8_combout\,
	datad => \Div1|auto_generated|divider|divider|op_3~0_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[16]~38_combout\);

-- Location: LCCOMB_X14_Y12_N14
\Mod0|auto_generated|divider|divider|StageOut[43]~82\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[43]~82_combout\ = (\credito_actual[1]~input_o\ & \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[1]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[43]~82_combout\);

-- Location: LCCOMB_X15_Y12_N28
\Mod0|auto_generated|divider|divider|StageOut[43]~83\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[43]~83_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[43]~83_combout\);

-- Location: LCCOMB_X15_Y12_N10
\Div1|auto_generated|divider|divider|op_4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_4~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[43]~82_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[43]~83_combout\)))
-- \Div1|auto_generated|divider|divider|op_4~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[43]~82_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[43]~83_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[43]~82_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[43]~83_combout\,
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|op_4~0_combout\,
	cout => \Div1|auto_generated|divider|divider|op_4~1\);

-- Location: LCCOMB_X15_Y12_N12
\Div1|auto_generated|divider|divider|op_4~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_4~2_combout\ = (\Div1|auto_generated|divider|divider|op_4~1\ & (((\Div1|auto_generated|divider|divider|StageOut[16]~50_combout\) # (\Div1|auto_generated|divider|divider|StageOut[16]~38_combout\)))) # 
-- (!\Div1|auto_generated|divider|divider|op_4~1\ & (!\Div1|auto_generated|divider|divider|StageOut[16]~50_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[16]~38_combout\)))
-- \Div1|auto_generated|divider|divider|op_4~3\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[16]~50_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[16]~38_combout\ & !\Div1|auto_generated|divider|divider|op_4~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[16]~50_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[16]~38_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_4~1\,
	combout => \Div1|auto_generated|divider|divider|op_4~2_combout\,
	cout => \Div1|auto_generated|divider|divider|op_4~3\);

-- Location: LCCOMB_X15_Y12_N14
\Div1|auto_generated|divider|divider|op_4~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_4~4_combout\ = (\Div1|auto_generated|divider|divider|op_4~3\ & (((\Div1|auto_generated|divider|divider|StageOut[17]~49_combout\) # (\Div1|auto_generated|divider|divider|StageOut[17]~37_combout\)))) # 
-- (!\Div1|auto_generated|divider|divider|op_4~3\ & ((((\Div1|auto_generated|divider|divider|StageOut[17]~49_combout\) # (\Div1|auto_generated|divider|divider|StageOut[17]~37_combout\)))))
-- \Div1|auto_generated|divider|divider|op_4~5\ = CARRY((!\Div1|auto_generated|divider|divider|op_4~3\ & ((\Div1|auto_generated|divider|divider|StageOut[17]~49_combout\) # (\Div1|auto_generated|divider|divider|StageOut[17]~37_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[17]~49_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[17]~37_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_4~3\,
	combout => \Div1|auto_generated|divider|divider|op_4~4_combout\,
	cout => \Div1|auto_generated|divider|divider|op_4~5\);

-- Location: LCCOMB_X16_Y12_N2
\Div1|auto_generated|divider|divider|StageOut[18]~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[18]~48_combout\ = (\Div1|auto_generated|divider|divider|op_3~8_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[13]~46_combout\) # ((!\Div1|auto_generated|divider|divider|op_2~8_combout\ & 
-- \Div1|auto_generated|divider|divider|op_2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|op_2~8_combout\,
	datab => \Div1|auto_generated|divider|divider|op_3~8_combout\,
	datac => \Div1|auto_generated|divider|divider|op_2~2_combout\,
	datad => \Div1|auto_generated|divider|divider|StageOut[13]~46_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[18]~48_combout\);

-- Location: LCCOMB_X16_Y12_N0
\Div1|auto_generated|divider|divider|StageOut[18]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[18]~36_combout\ = (!\Div1|auto_generated|divider|divider|op_3~8_combout\ & \Div1|auto_generated|divider|divider|op_3~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|op_3~8_combout\,
	datad => \Div1|auto_generated|divider|divider|op_3~4_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[18]~36_combout\);

-- Location: LCCOMB_X15_Y12_N16
\Div1|auto_generated|divider|divider|op_4~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_4~7_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[18]~48_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[18]~36_combout\ & !\Div1|auto_generated|divider|divider|op_4~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[18]~48_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[18]~36_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_4~5\,
	cout => \Div1|auto_generated|divider|divider|op_4~7_cout\);

-- Location: LCCOMB_X15_Y12_N18
\Div1|auto_generated|divider|divider|op_4~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_4~8_combout\ = \Div1|auto_generated|divider|divider|op_4~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|op_4~7_cout\,
	combout => \Div1|auto_generated|divider|divider|op_4~8_combout\);

-- Location: LCCOMB_X15_Y12_N26
\Div1|auto_generated|divider|divider|StageOut[22]~39\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[22]~39_combout\ = (\Div1|auto_generated|divider|divider|op_4~4_combout\ & !\Div1|auto_generated|divider|divider|op_4~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|op_4~4_combout\,
	datad => \Div1|auto_generated|divider|divider|op_4~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[22]~39_combout\);

-- Location: LCCOMB_X16_Y12_N26
\Div1|auto_generated|divider|divider|StageOut[22]~51\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[22]~51_combout\ = (\Div1|auto_generated|divider|divider|op_4~8_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[17]~49_combout\) # ((!\Div1|auto_generated|divider|divider|op_3~8_combout\ & 
-- \Div1|auto_generated|divider|divider|op_3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|op_4~8_combout\,
	datab => \Div1|auto_generated|divider|divider|op_3~8_combout\,
	datac => \Div1|auto_generated|divider|divider|StageOut[17]~49_combout\,
	datad => \Div1|auto_generated|divider|divider|op_3~2_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[22]~51_combout\);

-- Location: LCCOMB_X15_Y12_N24
\Div1|auto_generated|divider|divider|StageOut[21]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[21]~40_combout\ = (!\Div1|auto_generated|divider|divider|op_4~8_combout\ & \Div1|auto_generated|divider|divider|op_4~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|op_4~8_combout\,
	datad => \Div1|auto_generated|divider|divider|op_4~2_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[21]~40_combout\);

-- Location: LCCOMB_X16_Y12_N28
\Div1|auto_generated|divider|divider|StageOut[21]~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[21]~52_combout\ = (\Div1|auto_generated|divider|divider|op_4~8_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[16]~50_combout\) # ((!\Div1|auto_generated|divider|divider|op_3~8_combout\ & 
-- \Div1|auto_generated|divider|divider|op_3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[16]~50_combout\,
	datab => \Div1|auto_generated|divider|divider|op_3~8_combout\,
	datac => \Div1|auto_generated|divider|divider|op_4~8_combout\,
	datad => \Div1|auto_generated|divider|divider|op_3~0_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[21]~52_combout\);

-- Location: LCCOMB_X15_Y12_N30
\Div1|auto_generated|divider|divider|StageOut[20]~41\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[20]~41_combout\ = (!\Div1|auto_generated|divider|divider|op_4~8_combout\ & \Div1|auto_generated|divider|divider|op_4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|op_4~8_combout\,
	datad => \Div1|auto_generated|divider|divider|op_4~0_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[20]~41_combout\);

-- Location: LCCOMB_X14_Y12_N4
\Div1|auto_generated|divider|divider|StageOut[20]~53\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[20]~53_combout\ = (\Div1|auto_generated|divider|divider|op_4~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((\credito_actual[1]~input_o\))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datab => \Div1|auto_generated|divider|divider|op_4~8_combout\,
	datac => \credito_actual[1]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[20]~53_combout\);

-- Location: IOIBUF_X0_Y11_N22
\credito_actual[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_actual(0),
	o => \credito_actual[0]~input_o\);

-- Location: LCCOMB_X14_Y12_N16
\Mod0|auto_generated|divider|divider|StageOut[42]~84\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[42]~84_combout\ = (\credito_actual[0]~input_o\ & \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[0]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[42]~84_combout\);

-- Location: LCCOMB_X14_Y12_N22
\Mod0|auto_generated|divider|divider|StageOut[42]~85\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[42]~85_combout\ = (\credito_actual[0]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \credito_actual[0]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[42]~85_combout\);

-- Location: LCCOMB_X15_Y12_N0
\Div1|auto_generated|divider|divider|op_5~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_5~1_cout\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[42]~84_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[42]~85_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[42]~84_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[42]~85_combout\,
	datad => VCC,
	cout => \Div1|auto_generated|divider|divider|op_5~1_cout\);

-- Location: LCCOMB_X15_Y12_N2
\Div1|auto_generated|divider|divider|op_5~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_5~3_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[20]~41_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[20]~53_combout\ & !\Div1|auto_generated|divider|divider|op_5~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[20]~41_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[20]~53_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_5~1_cout\,
	cout => \Div1|auto_generated|divider|divider|op_5~3_cout\);

-- Location: LCCOMB_X15_Y12_N4
\Div1|auto_generated|divider|divider|op_5~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_5~5_cout\ = CARRY((!\Div1|auto_generated|divider|divider|op_5~3_cout\ & ((\Div1|auto_generated|divider|divider|StageOut[21]~40_combout\) # (\Div1|auto_generated|divider|divider|StageOut[21]~52_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[21]~40_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[21]~52_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_5~3_cout\,
	cout => \Div1|auto_generated|divider|divider|op_5~5_cout\);

-- Location: LCCOMB_X15_Y12_N6
\Div1|auto_generated|divider|divider|op_5~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_5~7_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[22]~39_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[22]~51_combout\ & !\Div1|auto_generated|divider|divider|op_5~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[22]~39_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[22]~51_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|op_5~5_cout\,
	cout => \Div1|auto_generated|divider|divider|op_5~7_cout\);

-- Location: LCCOMB_X15_Y12_N8
\Div1|auto_generated|divider|divider|op_5~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_5~8_combout\ = \Div1|auto_generated|divider|divider|op_5~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|op_5~7_cout\,
	combout => \Div1|auto_generated|divider|divider|op_5~8_combout\);

-- Location: LCCOMB_X12_Y11_N28
\Div1|auto_generated|divider|divider|op_5~8_wirecell\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|op_5~8_wirecell_combout\ = !\Div1|auto_generated|divider|divider|op_5~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Div1|auto_generated|divider|divider|op_5~8_combout\,
	combout => \Div1|auto_generated|divider|divider|op_5~8_wirecell_combout\);

-- Location: LCCOMB_X12_Y11_N14
\monedas_5_restantes[0]~_wirecell\ : cycloneiii_lcell_comb
-- Equation(s):
-- \monedas_5_restantes[0]~_wirecell_combout\ = !monedas_5_restantes(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => monedas_5_restantes(0),
	combout => \monedas_5_restantes[0]~_wirecell_combout\);

-- Location: LCCOMB_X11_Y8_N24
\Selector1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\activar_devolucion_reg~q\ & ((\LessThan6~5_combout\) # ((!\estado_devolucion.FIN_DEVOLUCION~q\)))) # (!\activar_devolucion_reg~q\ & (\estado_devolucion.REPOSO~q\ & ((\LessThan6~5_combout\) # 
-- (!\estado_devolucion.FIN_DEVOLUCION~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \activar_devolucion_reg~q\,
	datab => \LessThan6~5_combout\,
	datac => \estado_devolucion.REPOSO~q\,
	datad => \estado_devolucion.FIN_DEVOLUCION~q\,
	combout => \Selector1~0_combout\);

-- Location: FF_X11_Y8_N25
\estado_devolucion.REPOSO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector1~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_devolucion.REPOSO~q\);

-- Location: IOIBUF_X41_Y8_N1
\activar_devolucion~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_activar_devolucion,
	o => \activar_devolucion~input_o\);

-- Location: LCCOMB_X11_Y8_N22
\activar_devolucion_reg~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \activar_devolucion_reg~0_combout\ = (\activar_devolucion~input_o\) # ((!\estado_devolucion.REPOSO~q\ & \activar_devolucion_reg~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \estado_devolucion.REPOSO~q\,
	datac => \activar_devolucion_reg~q\,
	datad => \activar_devolucion~input_o\,
	combout => \activar_devolucion_reg~0_combout\);

-- Location: FF_X11_Y8_N23
activar_devolucion_reg : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \activar_devolucion_reg~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \activar_devolucion_reg~q\);

-- Location: LCCOMB_X11_Y8_N4
\Selector2~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector2~2_combout\ = (\activar_devolucion_reg~q\ & (!\estado_devolucion.REPOSO~q\ & ((\LessThan6~5_combout\) # (!\estado_devolucion.FIN_DEVOLUCION~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \activar_devolucion_reg~q\,
	datab => \estado_devolucion.REPOSO~q\,
	datac => \LessThan6~5_combout\,
	datad => \estado_devolucion.FIN_DEVOLUCION~q\,
	combout => \Selector2~2_combout\);

-- Location: FF_X11_Y8_N5
\estado_devolucion.CALCULAR_MONEDAS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector2~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_devolucion.CALCULAR_MONEDAS~q\);

-- Location: LCCOMB_X12_Y11_N16
\credito_restante_int[0]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_restante_int[0]~6_combout\ = (\estado_devolucion.ESPERAR_190_5~q\ & ((!\LessThan4~6_combout\))) # (!\estado_devolucion.ESPERAR_190_5~q\ & (\estado_devolucion.CALCULAR_MONEDAS~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_190_5~q\,
	datac => \estado_devolucion.CALCULAR_MONEDAS~q\,
	datad => \LessThan4~6_combout\,
	combout => \credito_restante_int[0]~6_combout\);

-- Location: FF_X12_Y11_N29
\monedas_5_restantes[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Div1|auto_generated|divider|divider|op_5~8_wirecell_combout\,
	asdata => \monedas_5_restantes[0]~_wirecell_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \estado_devolucion.ESPERAR_190_5~q\,
	ena => \credito_restante_int[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => monedas_5_restantes(0));

-- Location: LCCOMB_X12_Y11_N22
\Selector44~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector44~0_combout\ = (\estado_devolucion.ESPERAR_190_5~q\ & ((monedas_5_restantes(0) $ (!monedas_5_restantes(1))))) # (!\estado_devolucion.ESPERAR_190_5~q\ & (!\Div1|auto_generated|divider|divider|op_4~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|op_4~8_combout\,
	datab => monedas_5_restantes(0),
	datac => monedas_5_restantes(1),
	datad => \estado_devolucion.ESPERAR_190_5~q\,
	combout => \Selector44~0_combout\);

-- Location: FF_X12_Y11_N23
\monedas_5_restantes[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector44~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \credito_restante_int[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => monedas_5_restantes(1));

-- Location: LCCOMB_X12_Y11_N20
\Selector43~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector43~0_combout\ = (\estado_devolucion.ESPERAR_190_5~q\ & (monedas_5_restantes(2) $ (((monedas_5_restantes(0)) # (monedas_5_restantes(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_190_5~q\,
	datab => monedas_5_restantes(0),
	datac => monedas_5_restantes(1),
	datad => monedas_5_restantes(2),
	combout => \Selector43~0_combout\);

-- Location: LCCOMB_X12_Y11_N12
\Selector43~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector43~1_combout\ = (!\Selector43~0_combout\ & ((\estado_devolucion.ESPERAR_190_5~q\) # (!\Div1|auto_generated|divider|divider|op_3~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_190_5~q\,
	datac => \Div1|auto_generated|divider|divider|op_3~8_combout\,
	datad => \Selector43~0_combout\,
	combout => \Selector43~1_combout\);

-- Location: FF_X12_Y11_N13
\monedas_5_restantes[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector43~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \credito_restante_int[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => monedas_5_restantes(2));

-- Location: LCCOMB_X12_Y11_N18
\Add4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~0_combout\ = monedas_5_restantes(3) $ (((monedas_5_restantes(2)) # ((monedas_5_restantes(0)) # (monedas_5_restantes(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => monedas_5_restantes(2),
	datab => monedas_5_restantes(0),
	datac => monedas_5_restantes(1),
	datad => monedas_5_restantes(3),
	combout => \Add4~0_combout\);

-- Location: LCCOMB_X12_Y11_N10
\Selector42~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector42~0_combout\ = (\estado_devolucion.ESPERAR_190_5~q\ & ((!\Add4~0_combout\))) # (!\estado_devolucion.ESPERAR_190_5~q\ & (!\Div1|auto_generated|divider|divider|op_2~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_190_5~q\,
	datac => \Div1|auto_generated|divider|divider|op_2~8_combout\,
	datad => \Add4~0_combout\,
	combout => \Selector42~0_combout\);

-- Location: FF_X12_Y11_N11
\monedas_5_restantes[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector42~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \credito_restante_int[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => monedas_5_restantes(3));

-- Location: LCCOMB_X12_Y11_N24
\LessThan5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan5~0_combout\ = (monedas_5_restantes(2)) # ((monedas_5_restantes(0)) # ((monedas_5_restantes(1)) # (monedas_5_restantes(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => monedas_5_restantes(2),
	datab => monedas_5_restantes(0),
	datac => monedas_5_restantes(1),
	datad => monedas_5_restantes(3),
	combout => \LessThan5~0_combout\);

-- Location: LCCOMB_X12_Y8_N0
\Selector4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\LessThan4~6_combout\ & (((\estado_devolucion.ESPERAR_190_5~q\)))) # (!\LessThan4~6_combout\ & (\estado_devolucion.MOVER_190_5~q\ & (\LessThan5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.MOVER_190_5~q\,
	datab => \LessThan5~0_combout\,
	datac => \estado_devolucion.ESPERAR_190_5~q\,
	datad => \LessThan4~6_combout\,
	combout => \Selector4~0_combout\);

-- Location: FF_X12_Y8_N1
\estado_devolucion.ESPERAR_190_5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector4~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_devolucion.ESPERAR_190_5~q\);

-- Location: LCCOMB_X11_Y8_N8
\estado_devolucion.VOLVER_0_5~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \estado_devolucion.VOLVER_0_5~feeder_combout\ = \estado_devolucion.ESPERAR_190_5~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \estado_devolucion.ESPERAR_190_5~q\,
	combout => \estado_devolucion.VOLVER_0_5~feeder_combout\);

-- Location: FF_X11_Y8_N9
\estado_devolucion.VOLVER_0_5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \estado_devolucion.VOLVER_0_5~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \ALT_INV_LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_devolucion.VOLVER_0_5~q\);

-- Location: FF_X11_Y8_N1
\estado_devolucion.ESPERAR_0_5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \estado_devolucion.VOLVER_0_5~q\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_devolucion.ESPERAR_0_5~q\);

-- Location: LCCOMB_X12_Y8_N30
\Selector11~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (\estado_devolucion.MOVER_190_5~q\) # ((\estado_devolucion.CALCULAR_MONEDAS~q\ & !\LessThan3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.MOVER_190_5~q\,
	datab => \estado_devolucion.CALCULAR_MONEDAS~q\,
	datac => \LessThan3~0_combout\,
	combout => \Selector11~0_combout\);

-- Location: LCCOMB_X12_Y8_N4
\Selector11~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector11~1_combout\ = (!\LessThan5~0_combout\ & ((\Selector11~0_combout\) # ((\estado_devolucion.ESPERAR_0_5~q\ & !\LessThan4~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_0_5~q\,
	datab => \LessThan5~0_combout\,
	datac => \Selector11~0_combout\,
	datad => \LessThan4~6_combout\,
	combout => \Selector11~1_combout\);

-- Location: LCCOMB_X11_Y8_N26
\Selector11~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector11~2_combout\ = (\Selector11~1_combout\) # ((\LessThan6~5_combout\ & \estado_devolucion.FIN_DEVOLUCION~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan6~5_combout\,
	datac => \estado_devolucion.FIN_DEVOLUCION~q\,
	datad => \Selector11~1_combout\,
	combout => \Selector11~2_combout\);

-- Location: FF_X11_Y8_N27
\estado_devolucion.FIN_DEVOLUCION\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector11~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_devolucion.FIN_DEVOLUCION~q\);

-- Location: LCCOMB_X11_Y8_N30
\contador_1seg[13]~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[13]~42_combout\ = ((\estado_devolucion.FIN_DEVOLUCION~q\ & ((!\LessThan6~5_combout\))) # (!\estado_devolucion.FIN_DEVOLUCION~q\ & (!\LessThan4~6_combout\))) # (!\estado_devolucion.REPOSO~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.FIN_DEVOLUCION~q\,
	datab => \estado_devolucion.REPOSO~q\,
	datac => \LessThan4~6_combout\,
	datad => \LessThan6~5_combout\,
	combout => \contador_1seg[13]~42_combout\);

-- Location: LCCOMB_X12_Y8_N14
\contador_1seg[13]~43\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[13]~43_combout\ = (\estado_devolucion.MOVER_190_5~q\ & (((!\LessThan5~0_combout\)))) # (!\estado_devolucion.MOVER_190_5~q\ & (\estado_devolucion.MOVER_190_10~q\ & (!\LessThan3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.MOVER_190_5~q\,
	datab => \estado_devolucion.MOVER_190_10~q\,
	datac => \LessThan3~0_combout\,
	datad => \LessThan5~0_combout\,
	combout => \contador_1seg[13]~43_combout\);

-- Location: LCCOMB_X9_Y8_N8
\contador_1seg[13]~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[13]~44_combout\ = (!\estado_devolucion.CALCULAR_MONEDAS~q\ & (!\contador_1seg[13]~43_combout\ & ((\activar_devolucion_reg~q\) # (\estado_devolucion.REPOSO~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \activar_devolucion_reg~q\,
	datab => \estado_devolucion.CALCULAR_MONEDAS~q\,
	datac => \estado_devolucion.REPOSO~q\,
	datad => \contador_1seg[13]~43_combout\,
	combout => \contador_1seg[13]~44_combout\);

-- Location: FF_X10_Y8_N7
\contador_1seg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[0]~26_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(0));

-- Location: LCCOMB_X10_Y8_N8
\contador_1seg[1]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[1]~28_combout\ = (contador_1seg(1) & (!\contador_1seg[0]~27\)) # (!contador_1seg(1) & ((\contador_1seg[0]~27\) # (GND)))
-- \contador_1seg[1]~29\ = CARRY((!\contador_1seg[0]~27\) # (!contador_1seg(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(1),
	datad => VCC,
	cin => \contador_1seg[0]~27\,
	combout => \contador_1seg[1]~28_combout\,
	cout => \contador_1seg[1]~29\);

-- Location: FF_X10_Y8_N9
\contador_1seg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[1]~28_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(1));

-- Location: LCCOMB_X10_Y8_N10
\contador_1seg[2]~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[2]~30_combout\ = (contador_1seg(2) & (\contador_1seg[1]~29\ $ (GND))) # (!contador_1seg(2) & (!\contador_1seg[1]~29\ & VCC))
-- \contador_1seg[2]~31\ = CARRY((contador_1seg(2) & !\contador_1seg[1]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(2),
	datad => VCC,
	cin => \contador_1seg[1]~29\,
	combout => \contador_1seg[2]~30_combout\,
	cout => \contador_1seg[2]~31\);

-- Location: FF_X10_Y8_N11
\contador_1seg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[2]~30_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(2));

-- Location: LCCOMB_X10_Y8_N12
\contador_1seg[3]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[3]~32_combout\ = (contador_1seg(3) & (!\contador_1seg[2]~31\)) # (!contador_1seg(3) & ((\contador_1seg[2]~31\) # (GND)))
-- \contador_1seg[3]~33\ = CARRY((!\contador_1seg[2]~31\) # (!contador_1seg(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(3),
	datad => VCC,
	cin => \contador_1seg[2]~31\,
	combout => \contador_1seg[3]~32_combout\,
	cout => \contador_1seg[3]~33\);

-- Location: FF_X10_Y8_N13
\contador_1seg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[3]~32_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(3));

-- Location: LCCOMB_X10_Y8_N14
\contador_1seg[4]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[4]~34_combout\ = (contador_1seg(4) & (\contador_1seg[3]~33\ $ (GND))) # (!contador_1seg(4) & (!\contador_1seg[3]~33\ & VCC))
-- \contador_1seg[4]~35\ = CARRY((contador_1seg(4) & !\contador_1seg[3]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(4),
	datad => VCC,
	cin => \contador_1seg[3]~33\,
	combout => \contador_1seg[4]~34_combout\,
	cout => \contador_1seg[4]~35\);

-- Location: FF_X10_Y8_N15
\contador_1seg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[4]~34_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(4));

-- Location: LCCOMB_X10_Y8_N16
\contador_1seg[5]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[5]~36_combout\ = (contador_1seg(5) & (!\contador_1seg[4]~35\)) # (!contador_1seg(5) & ((\contador_1seg[4]~35\) # (GND)))
-- \contador_1seg[5]~37\ = CARRY((!\contador_1seg[4]~35\) # (!contador_1seg(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(5),
	datad => VCC,
	cin => \contador_1seg[4]~35\,
	combout => \contador_1seg[5]~36_combout\,
	cout => \contador_1seg[5]~37\);

-- Location: FF_X10_Y8_N17
\contador_1seg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[5]~36_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(5));

-- Location: LCCOMB_X10_Y8_N18
\contador_1seg[6]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[6]~38_combout\ = (contador_1seg(6) & (\contador_1seg[5]~37\ $ (GND))) # (!contador_1seg(6) & (!\contador_1seg[5]~37\ & VCC))
-- \contador_1seg[6]~39\ = CARRY((contador_1seg(6) & !\contador_1seg[5]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(6),
	datad => VCC,
	cin => \contador_1seg[5]~37\,
	combout => \contador_1seg[6]~38_combout\,
	cout => \contador_1seg[6]~39\);

-- Location: FF_X10_Y8_N19
\contador_1seg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[6]~38_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(6));

-- Location: LCCOMB_X10_Y8_N20
\contador_1seg[7]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[7]~40_combout\ = (contador_1seg(7) & (!\contador_1seg[6]~39\)) # (!contador_1seg(7) & ((\contador_1seg[6]~39\) # (GND)))
-- \contador_1seg[7]~41\ = CARRY((!\contador_1seg[6]~39\) # (!contador_1seg(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(7),
	datad => VCC,
	cin => \contador_1seg[6]~39\,
	combout => \contador_1seg[7]~40_combout\,
	cout => \contador_1seg[7]~41\);

-- Location: FF_X10_Y8_N21
\contador_1seg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[7]~40_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(7));

-- Location: LCCOMB_X10_Y8_N22
\contador_1seg[8]~45\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[8]~45_combout\ = (contador_1seg(8) & (\contador_1seg[7]~41\ $ (GND))) # (!contador_1seg(8) & (!\contador_1seg[7]~41\ & VCC))
-- \contador_1seg[8]~46\ = CARRY((contador_1seg(8) & !\contador_1seg[7]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(8),
	datad => VCC,
	cin => \contador_1seg[7]~41\,
	combout => \contador_1seg[8]~45_combout\,
	cout => \contador_1seg[8]~46\);

-- Location: FF_X10_Y8_N23
\contador_1seg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[8]~45_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(8));

-- Location: LCCOMB_X10_Y8_N24
\contador_1seg[9]~47\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[9]~47_combout\ = (contador_1seg(9) & (!\contador_1seg[8]~46\)) # (!contador_1seg(9) & ((\contador_1seg[8]~46\) # (GND)))
-- \contador_1seg[9]~48\ = CARRY((!\contador_1seg[8]~46\) # (!contador_1seg(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(9),
	datad => VCC,
	cin => \contador_1seg[8]~46\,
	combout => \contador_1seg[9]~47_combout\,
	cout => \contador_1seg[9]~48\);

-- Location: FF_X10_Y8_N25
\contador_1seg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[9]~47_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(9));

-- Location: LCCOMB_X10_Y8_N26
\contador_1seg[10]~49\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[10]~49_combout\ = (contador_1seg(10) & (\contador_1seg[9]~48\ $ (GND))) # (!contador_1seg(10) & (!\contador_1seg[9]~48\ & VCC))
-- \contador_1seg[10]~50\ = CARRY((contador_1seg(10) & !\contador_1seg[9]~48\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(10),
	datad => VCC,
	cin => \contador_1seg[9]~48\,
	combout => \contador_1seg[10]~49_combout\,
	cout => \contador_1seg[10]~50\);

-- Location: FF_X10_Y8_N27
\contador_1seg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[10]~49_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(10));

-- Location: LCCOMB_X10_Y8_N28
\contador_1seg[11]~51\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[11]~51_combout\ = (contador_1seg(11) & (!\contador_1seg[10]~50\)) # (!contador_1seg(11) & ((\contador_1seg[10]~50\) # (GND)))
-- \contador_1seg[11]~52\ = CARRY((!\contador_1seg[10]~50\) # (!contador_1seg(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(11),
	datad => VCC,
	cin => \contador_1seg[10]~50\,
	combout => \contador_1seg[11]~51_combout\,
	cout => \contador_1seg[11]~52\);

-- Location: FF_X10_Y8_N29
\contador_1seg[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[11]~51_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(11));

-- Location: LCCOMB_X10_Y8_N30
\contador_1seg[12]~53\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[12]~53_combout\ = (contador_1seg(12) & (\contador_1seg[11]~52\ $ (GND))) # (!contador_1seg(12) & (!\contador_1seg[11]~52\ & VCC))
-- \contador_1seg[12]~54\ = CARRY((contador_1seg(12) & !\contador_1seg[11]~52\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(12),
	datad => VCC,
	cin => \contador_1seg[11]~52\,
	combout => \contador_1seg[12]~53_combout\,
	cout => \contador_1seg[12]~54\);

-- Location: FF_X10_Y8_N31
\contador_1seg[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[12]~53_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(12));

-- Location: LCCOMB_X10_Y7_N0
\contador_1seg[13]~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[13]~55_combout\ = (contador_1seg(13) & (!\contador_1seg[12]~54\)) # (!contador_1seg(13) & ((\contador_1seg[12]~54\) # (GND)))
-- \contador_1seg[13]~56\ = CARRY((!\contador_1seg[12]~54\) # (!contador_1seg(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(13),
	datad => VCC,
	cin => \contador_1seg[12]~54\,
	combout => \contador_1seg[13]~55_combout\,
	cout => \contador_1seg[13]~56\);

-- Location: FF_X10_Y7_N1
\contador_1seg[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[13]~55_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(13));

-- Location: LCCOMB_X10_Y7_N2
\contador_1seg[14]~57\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[14]~57_combout\ = (contador_1seg(14) & (\contador_1seg[13]~56\ $ (GND))) # (!contador_1seg(14) & (!\contador_1seg[13]~56\ & VCC))
-- \contador_1seg[14]~58\ = CARRY((contador_1seg(14) & !\contador_1seg[13]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(14),
	datad => VCC,
	cin => \contador_1seg[13]~56\,
	combout => \contador_1seg[14]~57_combout\,
	cout => \contador_1seg[14]~58\);

-- Location: FF_X10_Y7_N3
\contador_1seg[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[14]~57_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(14));

-- Location: LCCOMB_X10_Y7_N4
\contador_1seg[15]~59\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[15]~59_combout\ = (contador_1seg(15) & (!\contador_1seg[14]~58\)) # (!contador_1seg(15) & ((\contador_1seg[14]~58\) # (GND)))
-- \contador_1seg[15]~60\ = CARRY((!\contador_1seg[14]~58\) # (!contador_1seg(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(15),
	datad => VCC,
	cin => \contador_1seg[14]~58\,
	combout => \contador_1seg[15]~59_combout\,
	cout => \contador_1seg[15]~60\);

-- Location: FF_X10_Y7_N5
\contador_1seg[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[15]~59_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(15));

-- Location: LCCOMB_X10_Y7_N6
\contador_1seg[16]~61\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[16]~61_combout\ = (contador_1seg(16) & (\contador_1seg[15]~60\ $ (GND))) # (!contador_1seg(16) & (!\contador_1seg[15]~60\ & VCC))
-- \contador_1seg[16]~62\ = CARRY((contador_1seg(16) & !\contador_1seg[15]~60\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(16),
	datad => VCC,
	cin => \contador_1seg[15]~60\,
	combout => \contador_1seg[16]~61_combout\,
	cout => \contador_1seg[16]~62\);

-- Location: FF_X10_Y7_N7
\contador_1seg[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[16]~61_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(16));

-- Location: LCCOMB_X10_Y7_N8
\contador_1seg[17]~63\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[17]~63_combout\ = (contador_1seg(17) & (!\contador_1seg[16]~62\)) # (!contador_1seg(17) & ((\contador_1seg[16]~62\) # (GND)))
-- \contador_1seg[17]~64\ = CARRY((!\contador_1seg[16]~62\) # (!contador_1seg(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(17),
	datad => VCC,
	cin => \contador_1seg[16]~62\,
	combout => \contador_1seg[17]~63_combout\,
	cout => \contador_1seg[17]~64\);

-- Location: FF_X9_Y8_N29
\contador_1seg[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \contador_1seg[17]~63_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	sload => VCC,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(17));

-- Location: LCCOMB_X10_Y7_N10
\contador_1seg[18]~65\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[18]~65_combout\ = (contador_1seg(18) & (\contador_1seg[17]~64\ $ (GND))) # (!contador_1seg(18) & (!\contador_1seg[17]~64\ & VCC))
-- \contador_1seg[18]~66\ = CARRY((contador_1seg(18) & !\contador_1seg[17]~64\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(18),
	datad => VCC,
	cin => \contador_1seg[17]~64\,
	combout => \contador_1seg[18]~65_combout\,
	cout => \contador_1seg[18]~66\);

-- Location: FF_X9_Y8_N23
\contador_1seg[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \contador_1seg[18]~65_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	sload => VCC,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(18));

-- Location: LCCOMB_X10_Y7_N12
\contador_1seg[19]~67\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[19]~67_combout\ = (contador_1seg(19) & (!\contador_1seg[18]~66\)) # (!contador_1seg(19) & ((\contador_1seg[18]~66\) # (GND)))
-- \contador_1seg[19]~68\ = CARRY((!\contador_1seg[18]~66\) # (!contador_1seg(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(19),
	datad => VCC,
	cin => \contador_1seg[18]~66\,
	combout => \contador_1seg[19]~67_combout\,
	cout => \contador_1seg[19]~68\);

-- Location: FF_X10_Y7_N13
\contador_1seg[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[19]~67_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(19));

-- Location: LCCOMB_X10_Y7_N14
\contador_1seg[20]~69\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[20]~69_combout\ = (contador_1seg(20) & (\contador_1seg[19]~68\ $ (GND))) # (!contador_1seg(20) & (!\contador_1seg[19]~68\ & VCC))
-- \contador_1seg[20]~70\ = CARRY((contador_1seg(20) & !\contador_1seg[19]~68\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(20),
	datad => VCC,
	cin => \contador_1seg[19]~68\,
	combout => \contador_1seg[20]~69_combout\,
	cout => \contador_1seg[20]~70\);

-- Location: FF_X10_Y7_N15
\contador_1seg[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[20]~69_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(20));

-- Location: LCCOMB_X10_Y7_N16
\contador_1seg[21]~71\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[21]~71_combout\ = (contador_1seg(21) & (!\contador_1seg[20]~70\)) # (!contador_1seg(21) & ((\contador_1seg[20]~70\) # (GND)))
-- \contador_1seg[21]~72\ = CARRY((!\contador_1seg[20]~70\) # (!contador_1seg(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(21),
	datad => VCC,
	cin => \contador_1seg[20]~70\,
	combout => \contador_1seg[21]~71_combout\,
	cout => \contador_1seg[21]~72\);

-- Location: FF_X10_Y7_N17
\contador_1seg[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[21]~71_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(21));

-- Location: LCCOMB_X10_Y7_N18
\contador_1seg[22]~73\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[22]~73_combout\ = (contador_1seg(22) & (\contador_1seg[21]~72\ $ (GND))) # (!contador_1seg(22) & (!\contador_1seg[21]~72\ & VCC))
-- \contador_1seg[22]~74\ = CARRY((contador_1seg(22) & !\contador_1seg[21]~72\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(22),
	datad => VCC,
	cin => \contador_1seg[21]~72\,
	combout => \contador_1seg[22]~73_combout\,
	cout => \contador_1seg[22]~74\);

-- Location: FF_X10_Y7_N19
\contador_1seg[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[22]~73_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(22));

-- Location: LCCOMB_X10_Y7_N20
\contador_1seg[23]~75\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[23]~75_combout\ = (contador_1seg(23) & (!\contador_1seg[22]~74\)) # (!contador_1seg(23) & ((\contador_1seg[22]~74\) # (GND)))
-- \contador_1seg[23]~76\ = CARRY((!\contador_1seg[22]~74\) # (!contador_1seg(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_1seg(23),
	datad => VCC,
	cin => \contador_1seg[22]~74\,
	combout => \contador_1seg[23]~75_combout\,
	cout => \contador_1seg[23]~76\);

-- Location: FF_X10_Y7_N21
\contador_1seg[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[23]~75_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(23));

-- Location: LCCOMB_X10_Y7_N22
\contador_1seg[24]~77\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[24]~77_combout\ = (contador_1seg(24) & (\contador_1seg[23]~76\ $ (GND))) # (!contador_1seg(24) & (!\contador_1seg[23]~76\ & VCC))
-- \contador_1seg[24]~78\ = CARRY((contador_1seg(24) & !\contador_1seg[23]~76\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(24),
	datad => VCC,
	cin => \contador_1seg[23]~76\,
	combout => \contador_1seg[24]~77_combout\,
	cout => \contador_1seg[24]~78\);

-- Location: FF_X10_Y7_N23
\contador_1seg[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[24]~77_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(24));

-- Location: LCCOMB_X10_Y7_N24
\contador_1seg[25]~79\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_1seg[25]~79_combout\ = \contador_1seg[24]~78\ $ (contador_1seg(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => contador_1seg(25),
	cin => \contador_1seg[24]~78\,
	combout => \contador_1seg[25]~79_combout\);

-- Location: FF_X10_Y7_N25
\contador_1seg[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_1seg[25]~79_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_1seg[13]~42_combout\,
	ena => \contador_1seg[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_1seg(25));

-- Location: LCCOMB_X10_Y7_N28
\LessThan4~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan4~5_combout\ = (((!contador_1seg(21)) # (!\LessThan4~0_combout\)) # (!contador_1seg(23))) # (!contador_1seg(22))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(22),
	datab => contador_1seg(23),
	datac => \LessThan4~0_combout\,
	datad => contador_1seg(21),
	combout => \LessThan4~5_combout\);

-- Location: LCCOMB_X10_Y8_N4
\LessThan4~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan4~2_combout\ = (!contador_1seg(8) & (!contador_1seg(9) & (!contador_1seg(10) & !contador_1seg(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(8),
	datab => contador_1seg(9),
	datac => contador_1seg(10),
	datad => contador_1seg(7),
	combout => \LessThan4~2_combout\);

-- Location: LCCOMB_X11_Y8_N12
\LessThan4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan4~1_combout\ = (((!contador_1seg(12)) # (!contador_1seg(14))) # (!contador_1seg(15))) # (!contador_1seg(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(13),
	datab => contador_1seg(15),
	datac => contador_1seg(14),
	datad => contador_1seg(12),
	combout => \LessThan4~1_combout\);

-- Location: LCCOMB_X11_Y8_N18
\LessThan4~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan4~3_combout\ = (!contador_1seg(16) & ((\LessThan4~1_combout\) # ((!contador_1seg(11) & \LessThan4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(11),
	datab => contador_1seg(16),
	datac => \LessThan4~2_combout\,
	datad => \LessThan4~1_combout\,
	combout => \LessThan4~3_combout\);

-- Location: LCCOMB_X11_Y8_N0
\LessThan4~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan4~4_combout\ = (!contador_1seg(18) & ((\LessThan4~3_combout\) # (!contador_1seg(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(17),
	datab => contador_1seg(18),
	datad => \LessThan4~3_combout\,
	combout => \LessThan4~4_combout\);

-- Location: LCCOMB_X11_Y8_N14
\LessThan4~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan4~6_combout\ = ((!contador_1seg(24) & ((\LessThan4~5_combout\) # (\LessThan4~4_combout\)))) # (!contador_1seg(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_1seg(25),
	datab => contador_1seg(24),
	datac => \LessThan4~5_combout\,
	datad => \LessThan4~4_combout\,
	combout => \LessThan4~6_combout\);

-- Location: FF_X12_Y8_N29
\estado_devolucion.VOLVER_0_10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \estado_devolucion.VOLVER_0_10~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \ALT_INV_LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_devolucion.VOLVER_0_10~q\);

-- Location: LCCOMB_X12_Y8_N10
\estado_devolucion.ESPERAR_0_10~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \estado_devolucion.ESPERAR_0_10~feeder_combout\ = \estado_devolucion.VOLVER_0_10~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \estado_devolucion.VOLVER_0_10~q\,
	combout => \estado_devolucion.ESPERAR_0_10~feeder_combout\);

-- Location: FF_X12_Y8_N11
\estado_devolucion.ESPERAR_0_10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \estado_devolucion.ESPERAR_0_10~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \ALT_INV_LessThan4~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_devolucion.ESPERAR_0_10~q\);

-- Location: LCCOMB_X12_Y8_N8
\Selector7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\estado_devolucion.CALCULAR_MONEDAS~q\) # ((\LessThan4~6_combout\ & ((\estado_devolucion.MOVER_190_10~q\))) # (!\LessThan4~6_combout\ & (\estado_devolucion.ESPERAR_0_10~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_0_10~q\,
	datab => \estado_devolucion.MOVER_190_10~q\,
	datac => \estado_devolucion.CALCULAR_MONEDAS~q\,
	datad => \LessThan4~6_combout\,
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X12_Y8_N24
\Selector7~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector7~1_combout\ = (\Selector7~0_combout\ & \LessThan3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Selector7~0_combout\,
	datad => \LessThan3~0_combout\,
	combout => \Selector7~1_combout\);

-- Location: FF_X12_Y8_N25
\estado_devolucion.MOVER_190_10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector7~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_devolucion.MOVER_190_10~q\);

-- Location: LCCOMB_X12_Y8_N6
\Selector8~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (\LessThan4~6_combout\ & (((\estado_devolucion.ESPERAR_190_10~q\)))) # (!\LessThan4~6_combout\ & (\LessThan3~0_combout\ & (\estado_devolucion.MOVER_190_10~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~0_combout\,
	datab => \estado_devolucion.MOVER_190_10~q\,
	datac => \estado_devolucion.ESPERAR_190_10~q\,
	datad => \LessThan4~6_combout\,
	combout => \Selector8~0_combout\);

-- Location: FF_X12_Y8_N7
\estado_devolucion.ESPERAR_190_10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector8~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_devolucion.ESPERAR_190_10~q\);

-- Location: LCCOMB_X11_Y9_N8
\Selector41~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector41~0_combout\ = (\estado_devolucion.ESPERAR_190_10~q\ & ((!monedas_10_restantes(0)))) # (!\estado_devolucion.ESPERAR_190_10~q\ & (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => monedas_10_restantes(0),
	datad => \estado_devolucion.ESPERAR_190_10~q\,
	combout => \Selector41~0_combout\);

-- Location: LCCOMB_X11_Y9_N28
\monedas_10_restantes[2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \monedas_10_restantes[2]~0_combout\ = (\estado_devolucion.ESPERAR_190_10~q\ & ((!\LessThan4~6_combout\))) # (!\estado_devolucion.ESPERAR_190_10~q\ & (\estado_devolucion.CALCULAR_MONEDAS~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_190_10~q\,
	datab => \estado_devolucion.CALCULAR_MONEDAS~q\,
	datad => \LessThan4~6_combout\,
	combout => \monedas_10_restantes[2]~0_combout\);

-- Location: FF_X11_Y9_N9
\monedas_10_restantes[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector41~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \monedas_10_restantes[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => monedas_10_restantes(0));

-- Location: LCCOMB_X11_Y9_N10
\Selector40~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector40~0_combout\ = (\estado_devolucion.ESPERAR_190_10~q\ & ((monedas_10_restantes(0) $ (!monedas_10_restantes(1))))) # (!\estado_devolucion.ESPERAR_190_10~q\ & (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => monedas_10_restantes(0),
	datac => monedas_10_restantes(1),
	datad => \estado_devolucion.ESPERAR_190_10~q\,
	combout => \Selector40~0_combout\);

-- Location: FF_X11_Y9_N11
\monedas_10_restantes[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector40~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \monedas_10_restantes[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => monedas_10_restantes(1));

-- Location: LCCOMB_X12_Y9_N28
\Selector39~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector39~0_combout\ = (\estado_devolucion.ESPERAR_190_10~q\ & (monedas_10_restantes(2) $ (((monedas_10_restantes(0)) # (monedas_10_restantes(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => monedas_10_restantes(0),
	datab => monedas_10_restantes(2),
	datac => monedas_10_restantes(1),
	datad => \estado_devolucion.ESPERAR_190_10~q\,
	combout => \Selector39~0_combout\);

-- Location: LCCOMB_X11_Y9_N20
\Selector39~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector39~1_combout\ = (!\Selector39~0_combout\ & ((\estado_devolucion.ESPERAR_190_10~q\) # (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_190_10~q\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Selector39~0_combout\,
	combout => \Selector39~1_combout\);

-- Location: FF_X11_Y9_N21
\monedas_10_restantes[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector39~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \monedas_10_restantes[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => monedas_10_restantes(2));

-- Location: LCCOMB_X12_Y9_N14
\Add2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = monedas_10_restantes(3) $ (((monedas_10_restantes(2)) # ((monedas_10_restantes(1)) # (monedas_10_restantes(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => monedas_10_restantes(3),
	datab => monedas_10_restantes(2),
	datac => monedas_10_restantes(1),
	datad => monedas_10_restantes(0),
	combout => \Add2~0_combout\);

-- Location: LCCOMB_X11_Y9_N14
\Selector38~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector38~0_combout\ = (\estado_devolucion.ESPERAR_190_10~q\ & (!\Add2~0_combout\)) # (!\estado_devolucion.ESPERAR_190_10~q\ & ((!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_190_10~q\,
	datac => \Add2~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Selector38~0_combout\);

-- Location: FF_X11_Y9_N15
\monedas_10_restantes[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector38~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \monedas_10_restantes[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => monedas_10_restantes(3));

-- Location: LCCOMB_X11_Y9_N30
\LessThan3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (monedas_10_restantes(1)) # ((monedas_10_restantes(0)) # ((monedas_10_restantes(3)) # (monedas_10_restantes(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => monedas_10_restantes(1),
	datab => monedas_10_restantes(0),
	datac => monedas_10_restantes(3),
	datad => monedas_10_restantes(2),
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X12_Y8_N16
\Selector3~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\estado_devolucion.ESPERAR_0_10~q\ & !\LessThan4~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_0_10~q\,
	datad => \LessThan4~6_combout\,
	combout => \Selector3~1_combout\);

-- Location: LCCOMB_X12_Y8_N26
\Selector3~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = (\estado_devolucion.MOVER_190_10~q\) # ((\estado_devolucion.CALCULAR_MONEDAS~q\ & \LessThan5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \estado_devolucion.MOVER_190_10~q\,
	datac => \estado_devolucion.CALCULAR_MONEDAS~q\,
	datad => \LessThan5~0_combout\,
	combout => \Selector3~2_combout\);

-- Location: LCCOMB_X12_Y8_N12
\Selector3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\LessThan5~0_combout\ & ((\LessThan4~6_combout\ & (\estado_devolucion.MOVER_190_5~q\)) # (!\LessThan4~6_combout\ & ((\estado_devolucion.ESPERAR_0_5~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.MOVER_190_5~q\,
	datab => \LessThan5~0_combout\,
	datac => \estado_devolucion.ESPERAR_0_5~q\,
	datad => \LessThan4~6_combout\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X12_Y8_N22
\Selector3~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector3~3_combout\ = (\Selector3~0_combout\) # ((!\LessThan3~0_combout\ & ((\Selector3~1_combout\) # (\Selector3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~0_combout\,
	datab => \Selector3~1_combout\,
	datac => \Selector3~2_combout\,
	datad => \Selector3~0_combout\,
	combout => \Selector3~3_combout\);

-- Location: FF_X12_Y8_N23
\estado_devolucion.MOVER_190_5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector3~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_devolucion.MOVER_190_5~q\);

-- Location: LCCOMB_X8_Y9_N8
\LessThan1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (!contador_pwm(7) & (((!contador_pwm(5) & !contador_pwm(4))) # (!contador_pwm(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(7),
	datab => contador_pwm(6),
	datac => contador_pwm(5),
	datad => contador_pwm(4),
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X9_Y8_N4
\LessThan1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = (\LessThan1~0_combout\ & (((\LessThan1~1_combout\) # (!contador_pwm(8))) # (!contador_pwm(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(9),
	datab => contador_pwm(8),
	datac => \LessThan1~1_combout\,
	datad => \LessThan1~0_combout\,
	combout => \LessThan1~2_combout\);

-- Location: LCCOMB_X9_Y8_N26
\LessThan1~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = (!contador_pwm(16) & (((\LessThan1~2_combout\) # (!contador_pwm(14))) # (!contador_pwm(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(16),
	datab => contador_pwm(15),
	datac => \LessThan1~2_combout\,
	datad => contador_pwm(14),
	combout => \LessThan1~3_combout\);

-- Location: LCCOMB_X8_Y9_N4
\LessThan2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (((!contador_pwm(0) & !contador_pwm(1))) # (!contador_pwm(2))) # (!contador_pwm(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(0),
	datab => contador_pwm(3),
	datac => contador_pwm(1),
	datad => contador_pwm(2),
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X8_Y9_N2
\LessThan2~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = (\LessThan0~0_combout\ & (((!contador_pwm(4) & \LessThan2~0_combout\)) # (!contador_pwm(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(5),
	datab => contador_pwm(4),
	datac => \LessThan2~0_combout\,
	datad => \LessThan0~0_combout\,
	combout => \LessThan2~1_combout\);

-- Location: LCCOMB_X8_Y9_N0
\LessThan2~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~2_combout\ = (((\LessThan2~1_combout\) # (!contador_pwm(9))) # (!contador_pwm(8))) # (!contador_pwm(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(10),
	datab => contador_pwm(8),
	datac => contador_pwm(9),
	datad => \LessThan2~1_combout\,
	combout => \LessThan2~2_combout\);

-- Location: LCCOMB_X8_Y8_N24
\LessThan2~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~3_combout\ = ((!contador_pwm(11) & (!contador_pwm(12) & \LessThan2~2_combout\))) # (!contador_pwm(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(13),
	datab => contador_pwm(11),
	datac => contador_pwm(12),
	datad => \LessThan2~2_combout\,
	combout => \LessThan2~3_combout\);

-- Location: LCCOMB_X8_Y8_N22
\LessThan2~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~4_combout\ = (((!contador_pwm(14) & \LessThan2~3_combout\)) # (!contador_pwm(16))) # (!contador_pwm(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(15),
	datab => contador_pwm(16),
	datac => contador_pwm(14),
	datad => \LessThan2~3_combout\,
	combout => \LessThan2~4_combout\);

-- Location: LCCOMB_X12_Y8_N18
\pwm_5_monedas~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pwm_5_monedas~0_combout\ = (\estado_devolucion.MOVER_190_5~q\ & (((\LessThan1~3_combout\)))) # (!\estado_devolucion.MOVER_190_5~q\ & ((\estado_devolucion.ESPERAR_190_5~q\ & (\LessThan1~3_combout\)) # (!\estado_devolucion.ESPERAR_190_5~q\ & 
-- ((\LessThan2~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.MOVER_190_5~q\,
	datab => \estado_devolucion.ESPERAR_190_5~q\,
	datac => \LessThan1~3_combout\,
	datad => \LessThan2~4_combout\,
	combout => \pwm_5_monedas~0_combout\);

-- Location: LCCOMB_X12_Y8_N20
\pwm_5_monedas~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pwm_5_monedas~1_combout\ = (!contador_pwm(19) & (!contador_pwm(18) & (!contador_pwm(17) & \pwm_5_monedas~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(19),
	datab => contador_pwm(18),
	datac => contador_pwm(17),
	datad => \pwm_5_monedas~0_combout\,
	combout => \pwm_5_monedas~1_combout\);

-- Location: FF_X12_Y8_N21
pwm_5_monedas : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pwm_5_monedas~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pwm_5_monedas~q\);

-- Location: LCCOMB_X8_Y8_N28
\pwm_10_monedas~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pwm_10_monedas~0_combout\ = (\estado_devolucion.MOVER_190_10~q\ & (((\LessThan1~3_combout\)))) # (!\estado_devolucion.MOVER_190_10~q\ & ((\estado_devolucion.ESPERAR_190_10~q\ & ((\LessThan1~3_combout\))) # (!\estado_devolucion.ESPERAR_190_10~q\ & 
-- (\LessThan2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.MOVER_190_10~q\,
	datab => \estado_devolucion.ESPERAR_190_10~q\,
	datac => \LessThan2~4_combout\,
	datad => \LessThan1~3_combout\,
	combout => \pwm_10_monedas~0_combout\);

-- Location: LCCOMB_X8_Y8_N20
\pwm_10_monedas~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pwm_10_monedas~1_combout\ = (!contador_pwm(19) & (!contador_pwm(18) & (!contador_pwm(17) & \pwm_10_monedas~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_pwm(19),
	datab => contador_pwm(18),
	datac => contador_pwm(17),
	datad => \pwm_10_monedas~0_combout\,
	combout => \pwm_10_monedas~1_combout\);

-- Location: FF_X8_Y8_N21
pwm_10_monedas : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pwm_10_monedas~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pwm_10_monedas~q\);

-- Location: IOIBUF_X21_Y0_N8
\entrega_completada~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entrega_completada,
	o => \entrega_completada~input_o\);

-- Location: LCCOMB_X20_Y10_N24
\Selector55~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector55~0_combout\ = (\estado_motor_02.MOTOR_ESPERANDO~q\) # ((\entrega_completada~input_o\ & \estado_motor_02.MOTOR_GIRANDO~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \entrega_completada~input_o\,
	datac => \estado_motor_02.MOTOR_GIRANDO~q\,
	datad => \estado_motor_02.MOTOR_ESPERANDO~q\,
	combout => \Selector55~0_combout\);

-- Location: LCCOMB_X17_Y10_N26
\Add6~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~54_combout\ = (\estado_motor_02.MOTOR_GIRANDO~q\ & \Selector111~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \estado_motor_02.MOTOR_GIRANDO~q\,
	datad => \Selector111~0_combout\,
	combout => \Add6~54_combout\);

-- Location: LCCOMB_X19_Y9_N4
\Add6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~0_combout\ = contador_4seg_02(0) $ (VCC)
-- \Add6~1\ = CARRY(contador_4seg_02(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_02(0),
	datad => VCC,
	combout => \Add6~0_combout\,
	cout => \Add6~1\);

-- Location: LCCOMB_X19_Y9_N2
\Selector80~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector80~0_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(0)) # ((\Add6~0_combout\ & \Add6~54_combout\)))) # (!\Selector55~0_combout\ & (\Add6~0_combout\ & ((\Add6~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~0_combout\,
	datac => contador_4seg_02(0),
	datad => \Add6~54_combout\,
	combout => \Selector80~0_combout\);

-- Location: FF_X19_Y9_N3
\contador_4seg_02[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector80~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(0));

-- Location: LCCOMB_X19_Y9_N6
\Add6~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~2_combout\ = (contador_4seg_02(1) & (!\Add6~1\)) # (!contador_4seg_02(1) & ((\Add6~1\) # (GND)))
-- \Add6~3\ = CARRY((!\Add6~1\) # (!contador_4seg_02(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(1),
	datad => VCC,
	cin => \Add6~1\,
	combout => \Add6~2_combout\,
	cout => \Add6~3\);

-- Location: LCCOMB_X17_Y9_N30
\Selector79~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector79~0_combout\ = (\Add6~2_combout\ & ((\Add6~54_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(1))))) # (!\Add6~2_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~2_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(1),
	datad => \Add6~54_combout\,
	combout => \Selector79~0_combout\);

-- Location: FF_X17_Y9_N31
\contador_4seg_02[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector79~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(1));

-- Location: LCCOMB_X19_Y9_N8
\Add6~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~4_combout\ = (contador_4seg_02(2) & (\Add6~3\ $ (GND))) # (!contador_4seg_02(2) & (!\Add6~3\ & VCC))
-- \Add6~5\ = CARRY((contador_4seg_02(2) & !\Add6~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_02(2),
	datad => VCC,
	cin => \Add6~3\,
	combout => \Add6~4_combout\,
	cout => \Add6~5\);

-- Location: LCCOMB_X19_Y9_N0
\Selector78~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector78~0_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(2)) # ((\Add6~4_combout\ & \Add6~54_combout\)))) # (!\Selector55~0_combout\ & (\Add6~4_combout\ & ((\Add6~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~4_combout\,
	datac => contador_4seg_02(2),
	datad => \Add6~54_combout\,
	combout => \Selector78~0_combout\);

-- Location: FF_X19_Y9_N1
\contador_4seg_02[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector78~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(2));

-- Location: LCCOMB_X19_Y9_N10
\Add6~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~6_combout\ = (contador_4seg_02(3) & (!\Add6~5\)) # (!contador_4seg_02(3) & ((\Add6~5\) # (GND)))
-- \Add6~7\ = CARRY((!\Add6~5\) # (!contador_4seg_02(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_02(3),
	datad => VCC,
	cin => \Add6~5\,
	combout => \Add6~6_combout\,
	cout => \Add6~7\);

-- Location: LCCOMB_X20_Y9_N8
\Selector77~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector77~0_combout\ = (\Add6~6_combout\ & ((\Add6~54_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(3))))) # (!\Add6~6_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~6_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(3),
	datad => \Add6~54_combout\,
	combout => \Selector77~0_combout\);

-- Location: FF_X20_Y9_N9
\contador_4seg_02[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector77~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(3));

-- Location: LCCOMB_X19_Y9_N12
\Add6~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~8_combout\ = (contador_4seg_02(4) & (\Add6~7\ $ (GND))) # (!contador_4seg_02(4) & (!\Add6~7\ & VCC))
-- \Add6~9\ = CARRY((contador_4seg_02(4) & !\Add6~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(4),
	datad => VCC,
	cin => \Add6~7\,
	combout => \Add6~8_combout\,
	cout => \Add6~9\);

-- Location: LCCOMB_X17_Y9_N24
\Selector76~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector76~0_combout\ = (\Add6~8_combout\ & ((\Add6~54_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(4))))) # (!\Add6~8_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~8_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(4),
	datad => \Add6~54_combout\,
	combout => \Selector76~0_combout\);

-- Location: FF_X17_Y9_N25
\contador_4seg_02[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector76~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(4));

-- Location: LCCOMB_X19_Y9_N14
\Add6~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~10_combout\ = (contador_4seg_02(5) & (!\Add6~9\)) # (!contador_4seg_02(5) & ((\Add6~9\) # (GND)))
-- \Add6~11\ = CARRY((!\Add6~9\) # (!contador_4seg_02(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(5),
	datad => VCC,
	cin => \Add6~9\,
	combout => \Add6~10_combout\,
	cout => \Add6~11\);

-- Location: LCCOMB_X17_Y10_N0
\Selector75~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector75~0_combout\ = (\Add6~54_combout\ & ((\Add6~10_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(5))))) # (!\Add6~54_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~54_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(5),
	datad => \Add6~10_combout\,
	combout => \Selector75~0_combout\);

-- Location: FF_X17_Y10_N1
\contador_4seg_02[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector75~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(5));

-- Location: LCCOMB_X19_Y9_N16
\Add6~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~12_combout\ = (contador_4seg_02(6) & (\Add6~11\ $ (GND))) # (!contador_4seg_02(6) & (!\Add6~11\ & VCC))
-- \Add6~13\ = CARRY((contador_4seg_02(6) & !\Add6~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_02(6),
	datad => VCC,
	cin => \Add6~11\,
	combout => \Add6~12_combout\,
	cout => \Add6~13\);

-- Location: LCCOMB_X17_Y10_N30
\Selector74~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector74~0_combout\ = (\Add6~54_combout\ & ((\Add6~12_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(6))))) # (!\Add6~54_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~54_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(6),
	datad => \Add6~12_combout\,
	combout => \Selector74~0_combout\);

-- Location: FF_X17_Y10_N31
\contador_4seg_02[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector74~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(6));

-- Location: LCCOMB_X19_Y9_N18
\Add6~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~14_combout\ = (contador_4seg_02(7) & (!\Add6~13\)) # (!contador_4seg_02(7) & ((\Add6~13\) # (GND)))
-- \Add6~15\ = CARRY((!\Add6~13\) # (!contador_4seg_02(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(7),
	datad => VCC,
	cin => \Add6~13\,
	combout => \Add6~14_combout\,
	cout => \Add6~15\);

-- Location: LCCOMB_X17_Y9_N18
\Selector73~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector73~0_combout\ = (\Add6~14_combout\ & ((\Add6~54_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(7))))) # (!\Add6~14_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~14_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(7),
	datad => \Add6~54_combout\,
	combout => \Selector73~0_combout\);

-- Location: FF_X17_Y9_N19
\contador_4seg_02[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector73~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(7));

-- Location: LCCOMB_X19_Y9_N20
\Add6~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~16_combout\ = (contador_4seg_02(8) & (\Add6~15\ $ (GND))) # (!contador_4seg_02(8) & (!\Add6~15\ & VCC))
-- \Add6~17\ = CARRY((contador_4seg_02(8) & !\Add6~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_02(8),
	datad => VCC,
	cin => \Add6~15\,
	combout => \Add6~16_combout\,
	cout => \Add6~17\);

-- Location: LCCOMB_X19_Y10_N28
\Selector72~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector72~0_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(8)) # ((\Add6~16_combout\ & \Add6~54_combout\)))) # (!\Selector55~0_combout\ & (\Add6~16_combout\ & ((\Add6~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~16_combout\,
	datac => contador_4seg_02(8),
	datad => \Add6~54_combout\,
	combout => \Selector72~0_combout\);

-- Location: FF_X19_Y10_N29
\contador_4seg_02[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector72~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(8));

-- Location: LCCOMB_X19_Y9_N22
\Add6~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~18_combout\ = (contador_4seg_02(9) & (!\Add6~17\)) # (!contador_4seg_02(9) & ((\Add6~17\) # (GND)))
-- \Add6~19\ = CARRY((!\Add6~17\) # (!contador_4seg_02(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_02(9),
	datad => VCC,
	cin => \Add6~17\,
	combout => \Add6~18_combout\,
	cout => \Add6~19\);

-- Location: LCCOMB_X20_Y10_N8
\Selector71~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector71~0_combout\ = (\Add6~18_combout\ & ((\Add6~54_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(9))))) # (!\Add6~18_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~18_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(9),
	datad => \Add6~54_combout\,
	combout => \Selector71~0_combout\);

-- Location: FF_X20_Y10_N9
\contador_4seg_02[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector71~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(9));

-- Location: LCCOMB_X19_Y9_N24
\Add6~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~20_combout\ = (contador_4seg_02(10) & (\Add6~19\ $ (GND))) # (!contador_4seg_02(10) & (!\Add6~19\ & VCC))
-- \Add6~21\ = CARRY((contador_4seg_02(10) & !\Add6~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_02(10),
	datad => VCC,
	cin => \Add6~19\,
	combout => \Add6~20_combout\,
	cout => \Add6~21\);

-- Location: LCCOMB_X20_Y10_N18
\Selector70~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector70~0_combout\ = (\Add6~20_combout\ & ((\Add6~54_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(10))))) # (!\Add6~20_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~20_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(10),
	datad => \Add6~54_combout\,
	combout => \Selector70~0_combout\);

-- Location: FF_X20_Y10_N19
\contador_4seg_02[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector70~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(10));

-- Location: LCCOMB_X19_Y9_N26
\Add6~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~22_combout\ = (contador_4seg_02(11) & (!\Add6~21\)) # (!contador_4seg_02(11) & ((\Add6~21\) # (GND)))
-- \Add6~23\ = CARRY((!\Add6~21\) # (!contador_4seg_02(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_02(11),
	datad => VCC,
	cin => \Add6~21\,
	combout => \Add6~22_combout\,
	cout => \Add6~23\);

-- Location: LCCOMB_X20_Y10_N4
\Selector69~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector69~0_combout\ = (\Add6~22_combout\ & ((\Add6~54_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(11))))) # (!\Add6~22_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~22_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(11),
	datad => \Add6~54_combout\,
	combout => \Selector69~0_combout\);

-- Location: FF_X20_Y10_N5
\contador_4seg_02[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector69~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(11));

-- Location: LCCOMB_X19_Y9_N28
\Add6~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~24_combout\ = (contador_4seg_02(12) & (\Add6~23\ $ (GND))) # (!contador_4seg_02(12) & (!\Add6~23\ & VCC))
-- \Add6~25\ = CARRY((contador_4seg_02(12) & !\Add6~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(12),
	datad => VCC,
	cin => \Add6~23\,
	combout => \Add6~24_combout\,
	cout => \Add6~25\);

-- Location: LCCOMB_X20_Y10_N26
\Selector68~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector68~0_combout\ = (\Add6~24_combout\ & ((\Add6~54_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(12))))) # (!\Add6~24_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~24_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(12),
	datad => \Add6~54_combout\,
	combout => \Selector68~0_combout\);

-- Location: FF_X20_Y10_N27
\contador_4seg_02[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector68~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(12));

-- Location: LCCOMB_X19_Y9_N30
\Add6~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~26_combout\ = (contador_4seg_02(13) & (!\Add6~25\)) # (!contador_4seg_02(13) & ((\Add6~25\) # (GND)))
-- \Add6~27\ = CARRY((!\Add6~25\) # (!contador_4seg_02(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(13),
	datad => VCC,
	cin => \Add6~25\,
	combout => \Add6~26_combout\,
	cout => \Add6~27\);

-- Location: LCCOMB_X20_Y10_N14
\Selector67~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector67~0_combout\ = (\Add6~26_combout\ & ((\Add6~54_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(13))))) # (!\Add6~26_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~26_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(13),
	datad => \Add6~54_combout\,
	combout => \Selector67~0_combout\);

-- Location: FF_X20_Y10_N15
\contador_4seg_02[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector67~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(13));

-- Location: LCCOMB_X19_Y8_N0
\Add6~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~28_combout\ = (contador_4seg_02(14) & (\Add6~27\ $ (GND))) # (!contador_4seg_02(14) & (!\Add6~27\ & VCC))
-- \Add6~29\ = CARRY((contador_4seg_02(14) & !\Add6~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_02(14),
	datad => VCC,
	cin => \Add6~27\,
	combout => \Add6~28_combout\,
	cout => \Add6~29\);

-- Location: LCCOMB_X20_Y10_N28
\Selector66~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector66~0_combout\ = (\Add6~28_combout\ & ((\Add6~54_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(14))))) # (!\Add6~28_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~28_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(14),
	datad => \Add6~54_combout\,
	combout => \Selector66~0_combout\);

-- Location: FF_X20_Y10_N29
\contador_4seg_02[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector66~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(14));

-- Location: LCCOMB_X19_Y8_N2
\Add6~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~30_combout\ = (contador_4seg_02(15) & (!\Add6~29\)) # (!contador_4seg_02(15) & ((\Add6~29\) # (GND)))
-- \Add6~31\ = CARRY((!\Add6~29\) # (!contador_4seg_02(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(15),
	datad => VCC,
	cin => \Add6~29\,
	combout => \Add6~30_combout\,
	cout => \Add6~31\);

-- Location: LCCOMB_X20_Y10_N30
\Selector65~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector65~0_combout\ = (\Add6~54_combout\ & ((\Add6~30_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(15))))) # (!\Add6~54_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~54_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(15),
	datad => \Add6~30_combout\,
	combout => \Selector65~0_combout\);

-- Location: FF_X20_Y10_N31
\contador_4seg_02[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector65~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(15));

-- Location: LCCOMB_X19_Y8_N4
\Add6~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~32_combout\ = (contador_4seg_02(16) & (\Add6~31\ $ (GND))) # (!contador_4seg_02(16) & (!\Add6~31\ & VCC))
-- \Add6~33\ = CARRY((contador_4seg_02(16) & !\Add6~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_02(16),
	datad => VCC,
	cin => \Add6~31\,
	combout => \Add6~32_combout\,
	cout => \Add6~33\);

-- Location: LCCOMB_X20_Y10_N16
\Selector64~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector64~0_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(16)) # ((\Add6~32_combout\ & \Add6~54_combout\)))) # (!\Selector55~0_combout\ & (\Add6~32_combout\ & ((\Add6~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~32_combout\,
	datac => contador_4seg_02(16),
	datad => \Add6~54_combout\,
	combout => \Selector64~0_combout\);

-- Location: FF_X20_Y10_N17
\contador_4seg_02[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector64~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(16));

-- Location: LCCOMB_X19_Y8_N6
\Add6~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~34_combout\ = (contador_4seg_02(17) & (!\Add6~33\)) # (!contador_4seg_02(17) & ((\Add6~33\) # (GND)))
-- \Add6~35\ = CARRY((!\Add6~33\) # (!contador_4seg_02(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(17),
	datad => VCC,
	cin => \Add6~33\,
	combout => \Add6~34_combout\,
	cout => \Add6~35\);

-- Location: LCCOMB_X19_Y10_N22
\Selector63~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector63~0_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(17)) # ((\Add6~54_combout\ & \Add6~34_combout\)))) # (!\Selector55~0_combout\ & (\Add6~54_combout\ & ((\Add6~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~54_combout\,
	datac => contador_4seg_02(17),
	datad => \Add6~34_combout\,
	combout => \Selector63~0_combout\);

-- Location: FF_X19_Y10_N23
\contador_4seg_02[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector63~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(17));

-- Location: LCCOMB_X19_Y8_N8
\Add6~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~36_combout\ = (contador_4seg_02(18) & (\Add6~35\ $ (GND))) # (!contador_4seg_02(18) & (!\Add6~35\ & VCC))
-- \Add6~37\ = CARRY((contador_4seg_02(18) & !\Add6~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(18),
	datad => VCC,
	cin => \Add6~35\,
	combout => \Add6~36_combout\,
	cout => \Add6~37\);

-- Location: LCCOMB_X19_Y10_N4
\Selector62~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector62~0_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(18)) # ((\Add6~54_combout\ & \Add6~36_combout\)))) # (!\Selector55~0_combout\ & (\Add6~54_combout\ & ((\Add6~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~54_combout\,
	datac => contador_4seg_02(18),
	datad => \Add6~36_combout\,
	combout => \Selector62~0_combout\);

-- Location: FF_X19_Y10_N5
\contador_4seg_02[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector62~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(18));

-- Location: LCCOMB_X19_Y8_N10
\Add6~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~38_combout\ = (contador_4seg_02(19) & (!\Add6~37\)) # (!contador_4seg_02(19) & ((\Add6~37\) # (GND)))
-- \Add6~39\ = CARRY((!\Add6~37\) # (!contador_4seg_02(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_02(19),
	datad => VCC,
	cin => \Add6~37\,
	combout => \Add6~38_combout\,
	cout => \Add6~39\);

-- Location: LCCOMB_X19_Y10_N14
\Selector61~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector61~0_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(19)) # ((\Add6~38_combout\ & \Add6~54_combout\)))) # (!\Selector55~0_combout\ & (\Add6~38_combout\ & ((\Add6~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~38_combout\,
	datac => contador_4seg_02(19),
	datad => \Add6~54_combout\,
	combout => \Selector61~0_combout\);

-- Location: FF_X19_Y10_N15
\contador_4seg_02[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector61~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(19));

-- Location: LCCOMB_X19_Y8_N12
\Add6~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~40_combout\ = (contador_4seg_02(20) & (\Add6~39\ $ (GND))) # (!contador_4seg_02(20) & (!\Add6~39\ & VCC))
-- \Add6~41\ = CARRY((contador_4seg_02(20) & !\Add6~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(20),
	datad => VCC,
	cin => \Add6~39\,
	combout => \Add6~40_combout\,
	cout => \Add6~41\);

-- Location: LCCOMB_X19_Y10_N26
\Selector60~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector60~0_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(20)) # ((\Add6~40_combout\ & \Add6~54_combout\)))) # (!\Selector55~0_combout\ & (\Add6~40_combout\ & ((\Add6~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~40_combout\,
	datac => contador_4seg_02(20),
	datad => \Add6~54_combout\,
	combout => \Selector60~0_combout\);

-- Location: FF_X19_Y10_N27
\contador_4seg_02[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector60~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(20));

-- Location: LCCOMB_X19_Y8_N14
\Add6~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~42_combout\ = (contador_4seg_02(21) & (!\Add6~41\)) # (!contador_4seg_02(21) & ((\Add6~41\) # (GND)))
-- \Add6~43\ = CARRY((!\Add6~41\) # (!contador_4seg_02(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(21),
	datad => VCC,
	cin => \Add6~41\,
	combout => \Add6~42_combout\,
	cout => \Add6~43\);

-- Location: LCCOMB_X19_Y10_N30
\Selector59~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector59~0_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(21)) # ((\Add6~42_combout\ & \Add6~54_combout\)))) # (!\Selector55~0_combout\ & (\Add6~42_combout\ & ((\Add6~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~42_combout\,
	datac => contador_4seg_02(21),
	datad => \Add6~54_combout\,
	combout => \Selector59~0_combout\);

-- Location: FF_X19_Y10_N31
\contador_4seg_02[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector59~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(21));

-- Location: LCCOMB_X19_Y8_N16
\Add6~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~44_combout\ = (contador_4seg_02(22) & (\Add6~43\ $ (GND))) # (!contador_4seg_02(22) & (!\Add6~43\ & VCC))
-- \Add6~45\ = CARRY((contador_4seg_02(22) & !\Add6~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(22),
	datad => VCC,
	cin => \Add6~43\,
	combout => \Add6~44_combout\,
	cout => \Add6~45\);

-- Location: LCCOMB_X19_Y10_N20
\Selector58~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector58~0_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(22)) # ((\Add6~54_combout\ & \Add6~44_combout\)))) # (!\Selector55~0_combout\ & (\Add6~54_combout\ & ((\Add6~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~54_combout\,
	datac => contador_4seg_02(22),
	datad => \Add6~44_combout\,
	combout => \Selector58~0_combout\);

-- Location: FF_X19_Y10_N21
\contador_4seg_02[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector58~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(22));

-- Location: LCCOMB_X19_Y8_N18
\Add6~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~46_combout\ = (contador_4seg_02(23) & (!\Add6~45\)) # (!contador_4seg_02(23) & ((\Add6~45\) # (GND)))
-- \Add6~47\ = CARRY((!\Add6~45\) # (!contador_4seg_02(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(23),
	datad => VCC,
	cin => \Add6~45\,
	combout => \Add6~46_combout\,
	cout => \Add6~47\);

-- Location: LCCOMB_X19_Y10_N6
\Selector57~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector57~0_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(23)) # ((\Add6~54_combout\ & \Add6~46_combout\)))) # (!\Selector55~0_combout\ & (\Add6~54_combout\ & ((\Add6~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~54_combout\,
	datac => contador_4seg_02(23),
	datad => \Add6~46_combout\,
	combout => \Selector57~0_combout\);

-- Location: FF_X19_Y10_N7
\contador_4seg_02[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector57~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(23));

-- Location: LCCOMB_X19_Y8_N20
\Add6~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~48_combout\ = (contador_4seg_02(24) & (\Add6~47\ $ (GND))) # (!contador_4seg_02(24) & (!\Add6~47\ & VCC))
-- \Add6~49\ = CARRY((contador_4seg_02(24) & !\Add6~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(24),
	datad => VCC,
	cin => \Add6~47\,
	combout => \Add6~48_combout\,
	cout => \Add6~49\);

-- Location: LCCOMB_X19_Y10_N16
\Selector56~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector56~0_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(24)) # ((\Add6~48_combout\ & \Add6~54_combout\)))) # (!\Selector55~0_combout\ & (\Add6~48_combout\ & ((\Add6~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~48_combout\,
	datac => contador_4seg_02(24),
	datad => \Add6~54_combout\,
	combout => \Selector56~0_combout\);

-- Location: FF_X19_Y10_N17
\contador_4seg_02[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector56~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(24));

-- Location: LCCOMB_X19_Y8_N22
\Add6~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~50_combout\ = (contador_4seg_02(25) & (!\Add6~49\)) # (!contador_4seg_02(25) & ((\Add6~49\) # (GND)))
-- \Add6~51\ = CARRY((!\Add6~49\) # (!contador_4seg_02(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(25),
	datad => VCC,
	cin => \Add6~49\,
	combout => \Add6~50_combout\,
	cout => \Add6~51\);

-- Location: LCCOMB_X19_Y10_N12
\Selector55~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector55~1_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(25)) # ((\Add6~54_combout\ & \Add6~50_combout\)))) # (!\Selector55~0_combout\ & (\Add6~54_combout\ & ((\Add6~50_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~54_combout\,
	datac => contador_4seg_02(25),
	datad => \Add6~50_combout\,
	combout => \Selector55~1_combout\);

-- Location: FF_X19_Y10_N13
\contador_4seg_02[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector55~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(25));

-- Location: LCCOMB_X19_Y8_N24
\Add6~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~52_combout\ = (contador_4seg_02(26) & (\Add6~51\ $ (GND))) # (!contador_4seg_02(26) & (!\Add6~51\ & VCC))
-- \Add6~53\ = CARRY((contador_4seg_02(26) & !\Add6~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_02(26),
	datad => VCC,
	cin => \Add6~51\,
	combout => \Add6~52_combout\,
	cout => \Add6~53\);

-- Location: LCCOMB_X19_Y8_N28
\Selector54~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector54~0_combout\ = (\Selector55~0_combout\ & ((contador_4seg_02(26)) # ((\Add6~52_combout\ & \Add6~54_combout\)))) # (!\Selector55~0_combout\ & (\Add6~52_combout\ & ((\Add6~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector55~0_combout\,
	datab => \Add6~52_combout\,
	datac => contador_4seg_02(26),
	datad => \Add6~54_combout\,
	combout => \Selector54~0_combout\);

-- Location: FF_X19_Y8_N29
\contador_4seg_02[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector54~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(26));

-- Location: LCCOMB_X19_Y8_N26
\Add6~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add6~55_combout\ = contador_4seg_02(27) $ (\Add6~53\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(27),
	cin => \Add6~53\,
	combout => \Add6~55_combout\);

-- Location: LCCOMB_X19_Y8_N30
\Selector53~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector53~0_combout\ = (\Add6~55_combout\ & ((\Add6~54_combout\) # ((\Selector55~0_combout\ & contador_4seg_02(27))))) # (!\Add6~55_combout\ & (\Selector55~0_combout\ & (contador_4seg_02(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~55_combout\,
	datab => \Selector55~0_combout\,
	datac => contador_4seg_02(27),
	datad => \Add6~54_combout\,
	combout => \Selector53~0_combout\);

-- Location: FF_X19_Y8_N31
\contador_4seg_02[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector53~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_02(27));

-- Location: LCCOMB_X19_Y10_N8
\LessThan7~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan7~4_combout\ = (contador_4seg_02(23) & (contador_4seg_02(24) & (contador_4seg_02(21) & contador_4seg_02(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(23),
	datab => contador_4seg_02(24),
	datac => contador_4seg_02(21),
	datad => contador_4seg_02(22),
	combout => \LessThan7~4_combout\);

-- Location: LCCOMB_X20_Y10_N12
\LessThan7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan7~0_combout\ = (contador_4seg_02(15) & (contador_4seg_02(14) & (contador_4seg_02(13) & contador_4seg_02(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(15),
	datab => contador_4seg_02(14),
	datac => contador_4seg_02(13),
	datad => contador_4seg_02(16),
	combout => \LessThan7~0_combout\);

-- Location: LCCOMB_X20_Y10_N6
\LessThan7~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan7~1_combout\ = (contador_4seg_02(12)) # ((contador_4seg_02(11)) # ((contador_4seg_02(9)) # (contador_4seg_02(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(12),
	datab => contador_4seg_02(11),
	datac => contador_4seg_02(9),
	datad => contador_4seg_02(10),
	combout => \LessThan7~1_combout\);

-- Location: LCCOMB_X19_Y10_N10
\LessThan7~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan7~2_combout\ = (contador_4seg_02(17)) # ((\LessThan7~0_combout\ & ((contador_4seg_02(8)) # (\LessThan7~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(17),
	datab => contador_4seg_02(8),
	datac => \LessThan7~0_combout\,
	datad => \LessThan7~1_combout\,
	combout => \LessThan7~2_combout\);

-- Location: LCCOMB_X19_Y10_N24
\LessThan7~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan7~3_combout\ = (contador_4seg_02(19)) # ((contador_4seg_02(18) & \LessThan7~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_02(18),
	datac => contador_4seg_02(19),
	datad => \LessThan7~2_combout\,
	combout => \LessThan7~3_combout\);

-- Location: LCCOMB_X19_Y10_N18
\LessThan7~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan7~5_combout\ = (contador_4seg_02(25)) # ((\LessThan7~4_combout\ & (contador_4seg_02(20) & \LessThan7~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_02(25),
	datab => \LessThan7~4_combout\,
	datac => contador_4seg_02(20),
	datad => \LessThan7~3_combout\,
	combout => \LessThan7~5_combout\);

-- Location: LCCOMB_X17_Y10_N20
\Selector111~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector111~0_combout\ = (!\entrega_completada~input_o\ & (!contador_4seg_02(27) & ((!\LessThan7~5_combout\) # (!contador_4seg_02(26)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrega_completada~input_o\,
	datab => contador_4seg_02(27),
	datac => contador_4seg_02(26),
	datad => \LessThan7~5_combout\,
	combout => \Selector111~0_combout\);

-- Location: LCCOMB_X17_Y10_N2
\Selector111~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector111~1_combout\ = (\estado_motor_02.MOTOR_GIRANDO~q\ & !\Selector111~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \estado_motor_02.MOTOR_GIRANDO~q\,
	datad => \Selector111~0_combout\,
	combout => \Selector111~1_combout\);

-- Location: LCCOMB_X17_Y10_N4
\Selector111~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector111~3_combout\ = ((\estado_motor_02.MOTOR_ESPERANDO~q\ & ((\LessThan8~6_combout\) # (\entrega_completada~input_o\)))) # (!\Selector111~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan8~6_combout\,
	datab => \estado_motor_02.MOTOR_ESPERANDO~q\,
	datac => \entrega_completada~input_o\,
	datad => \Selector111~2_combout\,
	combout => \Selector111~3_combout\);

-- Location: LCCOMB_X17_Y10_N24
\Selector109~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector109~1_combout\ = (\entrega_completada~input_o\ & ((\Selector109~0_combout\ & ((\Selector111~3_combout\))) # (!\Selector109~0_combout\ & (\estado_motor_02.MOTOR_GIRANDO~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrega_completada~input_o\,
	datab => \estado_motor_02.MOTOR_GIRANDO~q\,
	datac => \Selector111~3_combout\,
	datad => \Selector109~0_combout\,
	combout => \Selector109~1_combout\);

-- Location: LCCOMB_X17_Y10_N22
\Selector109~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector109~2_combout\ = (!\Selector109~1_combout\ & (((\Selector111~3_combout\) # (\estado_motor_02.MOTOR_APAGADO~q\)) # (!\Selector109~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector109~0_combout\,
	datab => \Selector111~3_combout\,
	datac => \estado_motor_02.MOTOR_APAGADO~q\,
	datad => \Selector109~1_combout\,
	combout => \Selector109~2_combout\);

-- Location: FF_X17_Y10_N23
\estado_motor_02.MOTOR_APAGADO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector109~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_motor_02.MOTOR_APAGADO~q\);

-- Location: IOIBUF_X21_Y0_N1
\activar_motor_02~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_activar_motor_02,
	o => \activar_motor_02~input_o\);

-- Location: LCCOMB_X17_Y10_N28
\Selector111~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector111~2_combout\ = (!\Selector111~1_combout\ & ((\estado_motor_02.MOTOR_APAGADO~q\) # ((\entrega_completada~input_o\) # (!\activar_motor_02~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_motor_02.MOTOR_APAGADO~q\,
	datab => \activar_motor_02~input_o\,
	datac => \entrega_completada~input_o\,
	datad => \Selector111~1_combout\,
	combout => \Selector111~2_combout\);

-- Location: LCCOMB_X17_Y10_N8
\Selector111~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector111~4_combout\ = (!\LessThan8~6_combout\ & (\estado_motor_02.MOTOR_ESPERANDO~q\ & (!\entrega_completada~input_o\ & \Selector111~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan8~6_combout\,
	datab => \estado_motor_02.MOTOR_ESPERANDO~q\,
	datac => \entrega_completada~input_o\,
	datad => \Selector111~2_combout\,
	combout => \Selector111~4_combout\);

-- Location: LCCOMB_X17_Y10_N18
\Selector111~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector111~5_combout\ = (\Selector111~4_combout\) # ((!\entrega_completada~input_o\ & (\Selector111~1_combout\ & !\Selector109~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrega_completada~input_o\,
	datab => \Selector111~1_combout\,
	datac => \Selector111~4_combout\,
	datad => \Selector109~0_combout\,
	combout => \Selector111~5_combout\);

-- Location: FF_X17_Y10_N19
\estado_motor_02.MOTOR_ESPERANDO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector111~5_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_motor_02.MOTOR_ESPERANDO~q\);

-- Location: LCCOMB_X20_Y10_N10
\Selector82~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector82~0_combout\ = (\estado_motor_02.MOTOR_GIRANDO~q\) # ((\entrega_completada~input_o\ & \estado_motor_02.MOTOR_ESPERANDO~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \entrega_completada~input_o\,
	datac => \estado_motor_02.MOTOR_GIRANDO~q\,
	datad => \estado_motor_02.MOTOR_ESPERANDO~q\,
	combout => \Selector82~0_combout\);

-- Location: LCCOMB_X17_Y10_N14
\Add7~56\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~56_combout\ = (\estado_motor_02.MOTOR_ESPERANDO~q\ & (!\entrega_completada~input_o\ & !\LessThan8~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \estado_motor_02.MOTOR_ESPERANDO~q\,
	datac => \entrega_completada~input_o\,
	datad => \LessThan8~6_combout\,
	combout => \Add7~56_combout\);

-- Location: LCCOMB_X16_Y10_N4
\Add7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~0_combout\ = contador_3seg_02(0) $ (VCC)
-- \Add7~1\ = CARRY(contador_3seg_02(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(0),
	datad => VCC,
	combout => \Add7~0_combout\,
	cout => \Add7~1\);

-- Location: LCCOMB_X15_Y10_N4
\Selector108~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector108~0_combout\ = (\Add7~0_combout\ & ((\Add7~56_combout\) # ((contador_3seg_02(0) & \Selector82~0_combout\)))) # (!\Add7~0_combout\ & (contador_3seg_02(0) & (\Selector82~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~0_combout\,
	datab => contador_3seg_02(0),
	datac => \Selector82~0_combout\,
	datad => \Add7~56_combout\,
	combout => \Selector108~0_combout\);

-- Location: FF_X16_Y10_N19
\contador_3seg_02[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Selector108~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(0));

-- Location: LCCOMB_X16_Y10_N6
\Add7~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~2_combout\ = (contador_3seg_02(1) & (!\Add7~1\)) # (!contador_3seg_02(1) & ((\Add7~1\) # (GND)))
-- \Add7~3\ = CARRY((!\Add7~1\) # (!contador_3seg_02(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(1),
	datad => VCC,
	cin => \Add7~1\,
	combout => \Add7~2_combout\,
	cout => \Add7~3\);

-- Location: LCCOMB_X16_Y10_N2
\Selector107~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector107~0_combout\ = (\Add7~2_combout\ & ((\Add7~56_combout\) # ((\Selector82~0_combout\ & contador_3seg_02(1))))) # (!\Add7~2_combout\ & (\Selector82~0_combout\ & (contador_3seg_02(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~2_combout\,
	datab => \Selector82~0_combout\,
	datac => contador_3seg_02(1),
	datad => \Add7~56_combout\,
	combout => \Selector107~0_combout\);

-- Location: FF_X16_Y10_N3
\contador_3seg_02[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector107~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(1));

-- Location: LCCOMB_X16_Y10_N8
\Add7~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~4_combout\ = (contador_3seg_02(2) & (\Add7~3\ $ (GND))) # (!contador_3seg_02(2) & (!\Add7~3\ & VCC))
-- \Add7~5\ = CARRY((contador_3seg_02(2) & !\Add7~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(2),
	datad => VCC,
	cin => \Add7~3\,
	combout => \Add7~4_combout\,
	cout => \Add7~5\);

-- Location: LCCOMB_X15_Y10_N10
\Selector106~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector106~0_combout\ = (\Add7~4_combout\ & ((\Add7~56_combout\) # ((\Selector82~0_combout\ & contador_3seg_02(2))))) # (!\Add7~4_combout\ & (\Selector82~0_combout\ & (contador_3seg_02(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~4_combout\,
	datab => \Selector82~0_combout\,
	datac => contador_3seg_02(2),
	datad => \Add7~56_combout\,
	combout => \Selector106~0_combout\);

-- Location: FF_X15_Y10_N11
\contador_3seg_02[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector106~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(2));

-- Location: LCCOMB_X16_Y10_N10
\Add7~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~6_combout\ = (contador_3seg_02(3) & (!\Add7~5\)) # (!contador_3seg_02(3) & ((\Add7~5\) # (GND)))
-- \Add7~7\ = CARRY((!\Add7~5\) # (!contador_3seg_02(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(3),
	datad => VCC,
	cin => \Add7~5\,
	combout => \Add7~6_combout\,
	cout => \Add7~7\);

-- Location: LCCOMB_X15_Y10_N8
\Selector105~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector105~0_combout\ = (\Add7~6_combout\ & ((\Add7~56_combout\) # ((\Selector82~0_combout\ & contador_3seg_02(3))))) # (!\Add7~6_combout\ & (\Selector82~0_combout\ & (contador_3seg_02(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~6_combout\,
	datab => \Selector82~0_combout\,
	datac => contador_3seg_02(3),
	datad => \Add7~56_combout\,
	combout => \Selector105~0_combout\);

-- Location: FF_X15_Y10_N9
\contador_3seg_02[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector105~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(3));

-- Location: LCCOMB_X16_Y10_N12
\Add7~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~8_combout\ = (contador_3seg_02(4) & (\Add7~7\ $ (GND))) # (!contador_3seg_02(4) & (!\Add7~7\ & VCC))
-- \Add7~9\ = CARRY((contador_3seg_02(4) & !\Add7~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(4),
	datad => VCC,
	cin => \Add7~7\,
	combout => \Add7~8_combout\,
	cout => \Add7~9\);

-- Location: LCCOMB_X15_Y10_N6
\Selector104~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector104~0_combout\ = (\Add7~8_combout\ & ((\Add7~56_combout\) # ((\Selector82~0_combout\ & contador_3seg_02(4))))) # (!\Add7~8_combout\ & (\Selector82~0_combout\ & (contador_3seg_02(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~8_combout\,
	datab => \Selector82~0_combout\,
	datac => contador_3seg_02(4),
	datad => \Add7~56_combout\,
	combout => \Selector104~0_combout\);

-- Location: FF_X15_Y10_N7
\contador_3seg_02[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector104~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(4));

-- Location: LCCOMB_X16_Y10_N14
\Add7~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~10_combout\ = (contador_3seg_02(5) & (!\Add7~9\)) # (!contador_3seg_02(5) & ((\Add7~9\) # (GND)))
-- \Add7~11\ = CARRY((!\Add7~9\) # (!contador_3seg_02(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(5),
	datad => VCC,
	cin => \Add7~9\,
	combout => \Add7~10_combout\,
	cout => \Add7~11\);

-- Location: LCCOMB_X16_Y10_N0
\Selector103~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector103~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(5)) # ((\Add7~10_combout\ & \Add7~56_combout\)))) # (!\Selector82~0_combout\ & (\Add7~10_combout\ & ((\Add7~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~10_combout\,
	datac => contador_3seg_02(5),
	datad => \Add7~56_combout\,
	combout => \Selector103~0_combout\);

-- Location: FF_X16_Y10_N1
\contador_3seg_02[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector103~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(5));

-- Location: LCCOMB_X16_Y10_N16
\Add7~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~12_combout\ = (contador_3seg_02(6) & (\Add7~11\ $ (GND))) # (!contador_3seg_02(6) & (!\Add7~11\ & VCC))
-- \Add7~13\ = CARRY((contador_3seg_02(6) & !\Add7~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(6),
	datad => VCC,
	cin => \Add7~11\,
	combout => \Add7~12_combout\,
	cout => \Add7~13\);

-- Location: LCCOMB_X15_Y10_N16
\Selector102~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector102~0_combout\ = (\Add7~56_combout\ & ((\Add7~12_combout\) # ((\Selector82~0_combout\ & contador_3seg_02(6))))) # (!\Add7~56_combout\ & (\Selector82~0_combout\ & (contador_3seg_02(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~56_combout\,
	datab => \Selector82~0_combout\,
	datac => contador_3seg_02(6),
	datad => \Add7~12_combout\,
	combout => \Selector102~0_combout\);

-- Location: FF_X15_Y10_N17
\contador_3seg_02[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector102~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(6));

-- Location: LCCOMB_X16_Y10_N18
\Add7~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~14_combout\ = (contador_3seg_02(7) & (!\Add7~13\)) # (!contador_3seg_02(7) & ((\Add7~13\) # (GND)))
-- \Add7~15\ = CARRY((!\Add7~13\) # (!contador_3seg_02(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(7),
	datad => VCC,
	cin => \Add7~13\,
	combout => \Add7~14_combout\,
	cout => \Add7~15\);

-- Location: LCCOMB_X16_Y11_N14
\Selector101~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector101~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(7)) # ((\Add7~14_combout\ & \Add7~56_combout\)))) # (!\Selector82~0_combout\ & (\Add7~14_combout\ & ((\Add7~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~14_combout\,
	datac => contador_3seg_02(7),
	datad => \Add7~56_combout\,
	combout => \Selector101~0_combout\);

-- Location: FF_X16_Y11_N15
\contador_3seg_02[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector101~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(7));

-- Location: LCCOMB_X16_Y10_N20
\Add7~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~16_combout\ = (contador_3seg_02(8) & (\Add7~15\ $ (GND))) # (!contador_3seg_02(8) & (!\Add7~15\ & VCC))
-- \Add7~17\ = CARRY((contador_3seg_02(8) & !\Add7~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(8),
	datad => VCC,
	cin => \Add7~15\,
	combout => \Add7~16_combout\,
	cout => \Add7~17\);

-- Location: LCCOMB_X16_Y11_N28
\Selector100~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector100~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(8)) # ((\Add7~16_combout\ & \Add7~56_combout\)))) # (!\Selector82~0_combout\ & (\Add7~16_combout\ & ((\Add7~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~16_combout\,
	datac => contador_3seg_02(8),
	datad => \Add7~56_combout\,
	combout => \Selector100~0_combout\);

-- Location: FF_X16_Y11_N29
\contador_3seg_02[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector100~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(8));

-- Location: LCCOMB_X16_Y10_N22
\Add7~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~18_combout\ = (contador_3seg_02(9) & (!\Add7~17\)) # (!contador_3seg_02(9) & ((\Add7~17\) # (GND)))
-- \Add7~19\ = CARRY((!\Add7~17\) # (!contador_3seg_02(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(9),
	datad => VCC,
	cin => \Add7~17\,
	combout => \Add7~18_combout\,
	cout => \Add7~19\);

-- Location: LCCOMB_X16_Y11_N22
\Selector99~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector99~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(9)) # ((\Add7~18_combout\ & \Add7~56_combout\)))) # (!\Selector82~0_combout\ & (\Add7~18_combout\ & ((\Add7~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~18_combout\,
	datac => contador_3seg_02(9),
	datad => \Add7~56_combout\,
	combout => \Selector99~0_combout\);

-- Location: FF_X16_Y11_N23
\contador_3seg_02[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector99~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(9));

-- Location: LCCOMB_X16_Y10_N24
\Add7~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~20_combout\ = (contador_3seg_02(10) & (\Add7~19\ $ (GND))) # (!contador_3seg_02(10) & (!\Add7~19\ & VCC))
-- \Add7~21\ = CARRY((contador_3seg_02(10) & !\Add7~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(10),
	datad => VCC,
	cin => \Add7~19\,
	combout => \Add7~20_combout\,
	cout => \Add7~21\);

-- Location: LCCOMB_X16_Y11_N26
\Selector98~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector98~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(10)) # ((\Add7~20_combout\ & \Add7~56_combout\)))) # (!\Selector82~0_combout\ & (\Add7~20_combout\ & ((\Add7~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~20_combout\,
	datac => contador_3seg_02(10),
	datad => \Add7~56_combout\,
	combout => \Selector98~0_combout\);

-- Location: FF_X16_Y11_N27
\contador_3seg_02[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector98~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(10));

-- Location: LCCOMB_X16_Y10_N26
\Add7~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~22_combout\ = (contador_3seg_02(11) & (!\Add7~21\)) # (!contador_3seg_02(11) & ((\Add7~21\) # (GND)))
-- \Add7~23\ = CARRY((!\Add7~21\) # (!contador_3seg_02(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(11),
	datad => VCC,
	cin => \Add7~21\,
	combout => \Add7~22_combout\,
	cout => \Add7~23\);

-- Location: LCCOMB_X16_Y11_N12
\Selector97~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector97~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(11)) # ((\Add7~22_combout\ & \Add7~56_combout\)))) # (!\Selector82~0_combout\ & (\Add7~22_combout\ & ((\Add7~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~22_combout\,
	datac => contador_3seg_02(11),
	datad => \Add7~56_combout\,
	combout => \Selector97~0_combout\);

-- Location: FF_X16_Y11_N13
\contador_3seg_02[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector97~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(11));

-- Location: LCCOMB_X16_Y10_N28
\Add7~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~24_combout\ = (contador_3seg_02(12) & (\Add7~23\ $ (GND))) # (!contador_3seg_02(12) & (!\Add7~23\ & VCC))
-- \Add7~25\ = CARRY((contador_3seg_02(12) & !\Add7~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(12),
	datad => VCC,
	cin => \Add7~23\,
	combout => \Add7~24_combout\,
	cout => \Add7~25\);

-- Location: LCCOMB_X16_Y11_N24
\Selector96~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector96~0_combout\ = (\Add7~56_combout\ & ((\Add7~24_combout\) # ((\Selector82~0_combout\ & contador_3seg_02(12))))) # (!\Add7~56_combout\ & (\Selector82~0_combout\ & (contador_3seg_02(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~56_combout\,
	datab => \Selector82~0_combout\,
	datac => contador_3seg_02(12),
	datad => \Add7~24_combout\,
	combout => \Selector96~0_combout\);

-- Location: FF_X16_Y11_N25
\contador_3seg_02[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector96~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(12));

-- Location: LCCOMB_X16_Y10_N30
\Add7~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~26_combout\ = (contador_3seg_02(13) & (!\Add7~25\)) # (!contador_3seg_02(13) & ((\Add7~25\) # (GND)))
-- \Add7~27\ = CARRY((!\Add7~25\) # (!contador_3seg_02(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(13),
	datad => VCC,
	cin => \Add7~25\,
	combout => \Add7~26_combout\,
	cout => \Add7~27\);

-- Location: LCCOMB_X16_Y11_N10
\Selector95~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector95~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(13)) # ((\Add7~26_combout\ & \Add7~56_combout\)))) # (!\Selector82~0_combout\ & (\Add7~26_combout\ & ((\Add7~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~26_combout\,
	datac => contador_3seg_02(13),
	datad => \Add7~56_combout\,
	combout => \Selector95~0_combout\);

-- Location: FF_X16_Y11_N11
\contador_3seg_02[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector95~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(13));

-- Location: LCCOMB_X16_Y9_N0
\Add7~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~28_combout\ = (contador_3seg_02(14) & (\Add7~27\ $ (GND))) # (!contador_3seg_02(14) & (!\Add7~27\ & VCC))
-- \Add7~29\ = CARRY((contador_3seg_02(14) & !\Add7~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(14),
	datad => VCC,
	cin => \Add7~27\,
	combout => \Add7~28_combout\,
	cout => \Add7~29\);

-- Location: LCCOMB_X16_Y11_N8
\Selector94~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector94~0_combout\ = (\Add7~56_combout\ & ((\Add7~28_combout\) # ((\Selector82~0_combout\ & contador_3seg_02(14))))) # (!\Add7~56_combout\ & (\Selector82~0_combout\ & (contador_3seg_02(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~56_combout\,
	datab => \Selector82~0_combout\,
	datac => contador_3seg_02(14),
	datad => \Add7~28_combout\,
	combout => \Selector94~0_combout\);

-- Location: FF_X16_Y11_N9
\contador_3seg_02[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector94~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(14));

-- Location: LCCOMB_X16_Y9_N2
\Add7~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~30_combout\ = (contador_3seg_02(15) & (!\Add7~29\)) # (!contador_3seg_02(15) & ((\Add7~29\) # (GND)))
-- \Add7~31\ = CARRY((!\Add7~29\) # (!contador_3seg_02(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(15),
	datad => VCC,
	cin => \Add7~29\,
	combout => \Add7~30_combout\,
	cout => \Add7~31\);

-- Location: LCCOMB_X16_Y11_N18
\Selector93~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector93~0_combout\ = (\Add7~30_combout\ & ((\Add7~56_combout\) # ((\Selector82~0_combout\ & contador_3seg_02(15))))) # (!\Add7~30_combout\ & (\Selector82~0_combout\ & (contador_3seg_02(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~30_combout\,
	datab => \Selector82~0_combout\,
	datac => contador_3seg_02(15),
	datad => \Add7~56_combout\,
	combout => \Selector93~0_combout\);

-- Location: FF_X16_Y11_N19
\contador_3seg_02[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector93~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(15));

-- Location: LCCOMB_X16_Y9_N4
\Add7~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~32_combout\ = (contador_3seg_02(16) & (\Add7~31\ $ (GND))) # (!contador_3seg_02(16) & (!\Add7~31\ & VCC))
-- \Add7~33\ = CARRY((contador_3seg_02(16) & !\Add7~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(16),
	datad => VCC,
	cin => \Add7~31\,
	combout => \Add7~32_combout\,
	cout => \Add7~33\);

-- Location: LCCOMB_X17_Y9_N22
\Selector92~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector92~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(16)) # ((\Add7~32_combout\ & \Add7~56_combout\)))) # (!\Selector82~0_combout\ & (\Add7~32_combout\ & ((\Add7~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~32_combout\,
	datac => contador_3seg_02(16),
	datad => \Add7~56_combout\,
	combout => \Selector92~0_combout\);

-- Location: FF_X17_Y9_N23
\contador_3seg_02[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector92~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(16));

-- Location: LCCOMB_X16_Y9_N6
\Add7~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~34_combout\ = (contador_3seg_02(17) & (!\Add7~33\)) # (!contador_3seg_02(17) & ((\Add7~33\) # (GND)))
-- \Add7~35\ = CARRY((!\Add7~33\) # (!contador_3seg_02(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(17),
	datad => VCC,
	cin => \Add7~33\,
	combout => \Add7~34_combout\,
	cout => \Add7~35\);

-- Location: LCCOMB_X17_Y9_N4
\Selector91~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector91~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(17)) # ((\Add7~34_combout\ & \Add7~56_combout\)))) # (!\Selector82~0_combout\ & (\Add7~34_combout\ & ((\Add7~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~34_combout\,
	datac => contador_3seg_02(17),
	datad => \Add7~56_combout\,
	combout => \Selector91~0_combout\);

-- Location: FF_X17_Y9_N5
\contador_3seg_02[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector91~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(17));

-- Location: LCCOMB_X16_Y9_N8
\Add7~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~36_combout\ = (contador_3seg_02(18) & (\Add7~35\ $ (GND))) # (!contador_3seg_02(18) & (!\Add7~35\ & VCC))
-- \Add7~37\ = CARRY((contador_3seg_02(18) & !\Add7~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(18),
	datad => VCC,
	cin => \Add7~35\,
	combout => \Add7~36_combout\,
	cout => \Add7~37\);

-- Location: LCCOMB_X17_Y9_N6
\Selector90~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector90~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(18)) # ((\Add7~56_combout\ & \Add7~36_combout\)))) # (!\Selector82~0_combout\ & (\Add7~56_combout\ & ((\Add7~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~56_combout\,
	datac => contador_3seg_02(18),
	datad => \Add7~36_combout\,
	combout => \Selector90~0_combout\);

-- Location: FF_X17_Y9_N7
\contador_3seg_02[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector90~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(18));

-- Location: LCCOMB_X16_Y9_N10
\Add7~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~38_combout\ = (contador_3seg_02(19) & (!\Add7~37\)) # (!contador_3seg_02(19) & ((\Add7~37\) # (GND)))
-- \Add7~39\ = CARRY((!\Add7~37\) # (!contador_3seg_02(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(19),
	datad => VCC,
	cin => \Add7~37\,
	combout => \Add7~38_combout\,
	cout => \Add7~39\);

-- Location: LCCOMB_X17_Y9_N20
\Selector89~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector89~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(19)) # ((\Add7~56_combout\ & \Add7~38_combout\)))) # (!\Selector82~0_combout\ & (\Add7~56_combout\ & ((\Add7~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~56_combout\,
	datac => contador_3seg_02(19),
	datad => \Add7~38_combout\,
	combout => \Selector89~0_combout\);

-- Location: FF_X17_Y9_N21
\contador_3seg_02[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector89~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(19));

-- Location: LCCOMB_X16_Y9_N12
\Add7~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~40_combout\ = (contador_3seg_02(20) & (\Add7~39\ $ (GND))) # (!contador_3seg_02(20) & (!\Add7~39\ & VCC))
-- \Add7~41\ = CARRY((contador_3seg_02(20) & !\Add7~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(20),
	datad => VCC,
	cin => \Add7~39\,
	combout => \Add7~40_combout\,
	cout => \Add7~41\);

-- Location: LCCOMB_X17_Y9_N28
\Selector88~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector88~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(20)) # ((\Add7~56_combout\ & \Add7~40_combout\)))) # (!\Selector82~0_combout\ & (\Add7~56_combout\ & ((\Add7~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~56_combout\,
	datac => contador_3seg_02(20),
	datad => \Add7~40_combout\,
	combout => \Selector88~0_combout\);

-- Location: FF_X17_Y9_N29
\contador_3seg_02[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector88~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(20));

-- Location: LCCOMB_X16_Y9_N14
\Add7~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~42_combout\ = (contador_3seg_02(21) & (!\Add7~41\)) # (!contador_3seg_02(21) & ((\Add7~41\) # (GND)))
-- \Add7~43\ = CARRY((!\Add7~41\) # (!contador_3seg_02(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(21),
	datad => VCC,
	cin => \Add7~41\,
	combout => \Add7~42_combout\,
	cout => \Add7~43\);

-- Location: LCCOMB_X17_Y9_N2
\Selector87~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector87~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(21)) # ((\Add7~56_combout\ & \Add7~42_combout\)))) # (!\Selector82~0_combout\ & (\Add7~56_combout\ & ((\Add7~42_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~56_combout\,
	datac => contador_3seg_02(21),
	datad => \Add7~42_combout\,
	combout => \Selector87~0_combout\);

-- Location: FF_X17_Y9_N3
\contador_3seg_02[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector87~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(21));

-- Location: LCCOMB_X16_Y9_N16
\Add7~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~44_combout\ = (contador_3seg_02(22) & (\Add7~43\ $ (GND))) # (!contador_3seg_02(22) & (!\Add7~43\ & VCC))
-- \Add7~45\ = CARRY((contador_3seg_02(22) & !\Add7~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(22),
	datad => VCC,
	cin => \Add7~43\,
	combout => \Add7~44_combout\,
	cout => \Add7~45\);

-- Location: LCCOMB_X17_Y9_N12
\Selector86~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector86~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(22)) # ((\Add7~56_combout\ & \Add7~44_combout\)))) # (!\Selector82~0_combout\ & (\Add7~56_combout\ & ((\Add7~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~56_combout\,
	datac => contador_3seg_02(22),
	datad => \Add7~44_combout\,
	combout => \Selector86~0_combout\);

-- Location: FF_X17_Y9_N13
\contador_3seg_02[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector86~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(22));

-- Location: LCCOMB_X16_Y9_N18
\Add7~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~46_combout\ = (contador_3seg_02(23) & (!\Add7~45\)) # (!contador_3seg_02(23) & ((\Add7~45\) # (GND)))
-- \Add7~47\ = CARRY((!\Add7~45\) # (!contador_3seg_02(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(23),
	datad => VCC,
	cin => \Add7~45\,
	combout => \Add7~46_combout\,
	cout => \Add7~47\);

-- Location: LCCOMB_X17_Y9_N26
\Selector85~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector85~0_combout\ = (\Add7~46_combout\ & ((\Add7~56_combout\) # ((contador_3seg_02(23) & \Selector82~0_combout\)))) # (!\Add7~46_combout\ & (((contador_3seg_02(23) & \Selector82~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~46_combout\,
	datab => \Add7~56_combout\,
	datac => contador_3seg_02(23),
	datad => \Selector82~0_combout\,
	combout => \Selector85~0_combout\);

-- Location: FF_X17_Y9_N27
\contador_3seg_02[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector85~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(23));

-- Location: LCCOMB_X16_Y9_N20
\Add7~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~48_combout\ = (contador_3seg_02(24) & (\Add7~47\ $ (GND))) # (!contador_3seg_02(24) & (!\Add7~47\ & VCC))
-- \Add7~49\ = CARRY((contador_3seg_02(24) & !\Add7~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(24),
	datad => VCC,
	cin => \Add7~47\,
	combout => \Add7~48_combout\,
	cout => \Add7~49\);

-- Location: LCCOMB_X17_Y9_N10
\Selector84~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector84~0_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(24)) # ((\Add7~56_combout\ & \Add7~48_combout\)))) # (!\Selector82~0_combout\ & (\Add7~56_combout\ & ((\Add7~48_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~56_combout\,
	datac => contador_3seg_02(24),
	datad => \Add7~48_combout\,
	combout => \Selector84~0_combout\);

-- Location: FF_X17_Y9_N11
\contador_3seg_02[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector84~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(24));

-- Location: LCCOMB_X16_Y9_N22
\Add7~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~50_combout\ = (contador_3seg_02(25) & (!\Add7~49\)) # (!contador_3seg_02(25) & ((\Add7~49\) # (GND)))
-- \Add7~51\ = CARRY((!\Add7~49\) # (!contador_3seg_02(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(25),
	datad => VCC,
	cin => \Add7~49\,
	combout => \Add7~50_combout\,
	cout => \Add7~51\);

-- Location: LCCOMB_X16_Y9_N30
\Selector83~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector83~0_combout\ = (\Add7~50_combout\ & ((\Add7~56_combout\) # ((\Selector82~0_combout\ & contador_3seg_02(25))))) # (!\Add7~50_combout\ & (\Selector82~0_combout\ & (contador_3seg_02(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~50_combout\,
	datab => \Selector82~0_combout\,
	datac => contador_3seg_02(25),
	datad => \Add7~56_combout\,
	combout => \Selector83~0_combout\);

-- Location: FF_X16_Y9_N31
\contador_3seg_02[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector83~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(25));

-- Location: LCCOMB_X16_Y9_N24
\Add7~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~52_combout\ = (contador_3seg_02(26) & (\Add7~51\ $ (GND))) # (!contador_3seg_02(26) & (!\Add7~51\ & VCC))
-- \Add7~53\ = CARRY((contador_3seg_02(26) & !\Add7~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_02(26),
	datad => VCC,
	cin => \Add7~51\,
	combout => \Add7~52_combout\,
	cout => \Add7~53\);

-- Location: LCCOMB_X17_Y9_N8
\Selector82~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector82~1_combout\ = (\Selector82~0_combout\ & ((contador_3seg_02(26)) # ((\Add7~56_combout\ & \Add7~52_combout\)))) # (!\Selector82~0_combout\ & (\Add7~56_combout\ & ((\Add7~52_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector82~0_combout\,
	datab => \Add7~56_combout\,
	datac => contador_3seg_02(26),
	datad => \Add7~52_combout\,
	combout => \Selector82~1_combout\);

-- Location: FF_X17_Y9_N9
\contador_3seg_02[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector82~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(26));

-- Location: LCCOMB_X16_Y9_N26
\Add7~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add7~54_combout\ = \Add7~53\ $ (contador_3seg_02(27))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => contador_3seg_02(27),
	cin => \Add7~53\,
	combout => \Add7~54_combout\);

-- Location: LCCOMB_X16_Y9_N28
\Selector81~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector81~0_combout\ = (\Add7~54_combout\ & ((\Add7~56_combout\) # ((\Selector82~0_combout\ & contador_3seg_02(27))))) # (!\Add7~54_combout\ & (\Selector82~0_combout\ & (contador_3seg_02(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~54_combout\,
	datab => \Selector82~0_combout\,
	datac => contador_3seg_02(27),
	datad => \Add7~56_combout\,
	combout => \Selector81~0_combout\);

-- Location: FF_X16_Y9_N29
\contador_3seg_02[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector81~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_02(27));

-- Location: LCCOMB_X17_Y9_N0
\LessThan8~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan8~0_combout\ = (contador_3seg_02(24)) # ((contador_3seg_02(26)) # (contador_3seg_02(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(24),
	datab => contador_3seg_02(26),
	datad => contador_3seg_02(25),
	combout => \LessThan8~0_combout\);

-- Location: LCCOMB_X17_Y9_N14
\LessThan8~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan8~1_combout\ = (contador_3seg_02(23) & (contador_3seg_02(20) & (contador_3seg_02(21) & contador_3seg_02(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(23),
	datab => contador_3seg_02(20),
	datac => contador_3seg_02(21),
	datad => contador_3seg_02(22),
	combout => \LessThan8~1_combout\);

-- Location: LCCOMB_X16_Y11_N16
\LessThan8~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan8~3_combout\ = (!contador_3seg_02(10) & (!contador_3seg_02(11) & ((!contador_3seg_02(7)) # (!contador_3seg_02(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(10),
	datab => contador_3seg_02(8),
	datac => contador_3seg_02(7),
	datad => contador_3seg_02(11),
	combout => \LessThan8~3_combout\);

-- Location: LCCOMB_X16_Y11_N4
\LessThan8~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan8~4_combout\ = (!contador_3seg_02(13) & (((!contador_3seg_02(9) & \LessThan8~3_combout\)) # (!contador_3seg_02(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(13),
	datab => contador_3seg_02(12),
	datac => contador_3seg_02(9),
	datad => \LessThan8~3_combout\,
	combout => \LessThan8~4_combout\);

-- Location: LCCOMB_X17_Y9_N16
\LessThan8~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan8~2_combout\ = (!contador_3seg_02(18) & (!contador_3seg_02(17) & (!contador_3seg_02(16) & !contador_3seg_02(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(18),
	datab => contador_3seg_02(17),
	datac => contador_3seg_02(16),
	datad => contador_3seg_02(19),
	combout => \LessThan8~2_combout\);

-- Location: LCCOMB_X16_Y11_N30
\LessThan8~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan8~5_combout\ = (\LessThan8~2_combout\ & (((\LessThan8~4_combout\) # (!contador_3seg_02(15))) # (!contador_3seg_02(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(14),
	datab => contador_3seg_02(15),
	datac => \LessThan8~4_combout\,
	datad => \LessThan8~2_combout\,
	combout => \LessThan8~5_combout\);

-- Location: LCCOMB_X17_Y10_N12
\LessThan8~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan8~6_combout\ = (contador_3seg_02(27) & ((\LessThan8~0_combout\) # ((\LessThan8~1_combout\ & !\LessThan8~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_02(27),
	datab => \LessThan8~0_combout\,
	datac => \LessThan8~1_combout\,
	datad => \LessThan8~5_combout\,
	combout => \LessThan8~6_combout\);

-- Location: LCCOMB_X17_Y10_N10
\Selector109~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector109~0_combout\ = (\Selector111~2_combout\) # ((\estado_motor_02.MOTOR_ESPERANDO~q\ & ((\LessThan8~6_combout\) # (\entrega_completada~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan8~6_combout\,
	datab => \estado_motor_02.MOTOR_ESPERANDO~q\,
	datac => \entrega_completada~input_o\,
	datad => \Selector111~2_combout\,
	combout => \Selector109~0_combout\);

-- Location: LCCOMB_X17_Y10_N6
\Selector110~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector110~2_combout\ = (\Selector109~0_combout\ & ((\Selector111~3_combout\ & (!\entrega_completada~input_o\)) # (!\Selector111~3_combout\ & ((\estado_motor_02.MOTOR_GIRANDO~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrega_completada~input_o\,
	datab => \estado_motor_02.MOTOR_GIRANDO~q\,
	datac => \Selector111~3_combout\,
	datad => \Selector109~0_combout\,
	combout => \Selector110~2_combout\);

-- Location: LCCOMB_X17_Y10_N16
\Selector110~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector110~3_combout\ = (\Selector110~2_combout\) # ((!\Selector109~0_combout\ & ((\Selector111~0_combout\) # (!\estado_motor_02.MOTOR_GIRANDO~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector109~0_combout\,
	datab => \Selector111~0_combout\,
	datac => \estado_motor_02.MOTOR_GIRANDO~q\,
	datad => \Selector110~2_combout\,
	combout => \Selector110~3_combout\);

-- Location: FF_X17_Y10_N17
\estado_motor_02.MOTOR_GIRANDO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector110~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_motor_02.MOTOR_GIRANDO~q\);

-- Location: LCCOMB_X11_Y12_N12
\U_MOTOR_PWM|counter[0]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[0]~20_combout\ = \U_MOTOR_PWM|counter\(0) $ (VCC)
-- \U_MOTOR_PWM|counter[0]~21\ = CARRY(\U_MOTOR_PWM|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(0),
	datad => VCC,
	combout => \U_MOTOR_PWM|counter[0]~20_combout\,
	cout => \U_MOTOR_PWM|counter[0]~21\);

-- Location: LCCOMB_X11_Y11_N24
\U_MOTOR_PWM|counter[8]~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[8]~54_combout\ = (((!\U_MOTOR_PWM|counter\(18)) # (!\U_MOTOR_PWM|counter\(17))) # (!\U_MOTOR_PWM|counter\(19))) # (!\U_MOTOR_PWM|counter\(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(16),
	datab => \U_MOTOR_PWM|counter\(19),
	datac => \U_MOTOR_PWM|counter\(17),
	datad => \U_MOTOR_PWM|counter\(18),
	combout => \U_MOTOR_PWM|counter[8]~54_combout\);

-- Location: LCCOMB_X11_Y11_N26
\U_MOTOR_PWM|counter[8]~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[8]~55_combout\ = (!\U_MOTOR_PWM|counter\(13) & (!\U_MOTOR_PWM|counter\(10) & (!\U_MOTOR_PWM|counter\(12) & !\U_MOTOR_PWM|counter\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(13),
	datab => \U_MOTOR_PWM|counter\(10),
	datac => \U_MOTOR_PWM|counter\(12),
	datad => \U_MOTOR_PWM|counter\(11),
	combout => \U_MOTOR_PWM|counter[8]~55_combout\);

-- Location: LCCOMB_X11_Y12_N0
\U_MOTOR_PWM|counter[8]~56\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[8]~56_combout\ = (!\U_MOTOR_PWM|counter\(6) & (!\U_MOTOR_PWM|counter\(7) & !\U_MOTOR_PWM|counter\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|counter\(6),
	datac => \U_MOTOR_PWM|counter\(7),
	datad => \U_MOTOR_PWM|counter\(8),
	combout => \U_MOTOR_PWM|counter[8]~56_combout\);

-- Location: LCCOMB_X11_Y12_N2
\U_MOTOR_PWM|LessThan0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan0~0_combout\ = (((!\U_MOTOR_PWM|counter\(0)) # (!\U_MOTOR_PWM|counter\(3))) # (!\U_MOTOR_PWM|counter\(2))) # (!\U_MOTOR_PWM|counter\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(1),
	datab => \U_MOTOR_PWM|counter\(2),
	datac => \U_MOTOR_PWM|counter\(3),
	datad => \U_MOTOR_PWM|counter\(0),
	combout => \U_MOTOR_PWM|LessThan0~0_combout\);

-- Location: LCCOMB_X11_Y12_N4
\U_MOTOR_PWM|counter[8]~57\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[8]~57_combout\ = (\U_MOTOR_PWM|counter[8]~56_combout\ & (((\U_MOTOR_PWM|LessThan0~0_combout\) # (!\U_MOTOR_PWM|counter\(4))) # (!\U_MOTOR_PWM|counter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(5),
	datab => \U_MOTOR_PWM|counter\(4),
	datac => \U_MOTOR_PWM|counter[8]~56_combout\,
	datad => \U_MOTOR_PWM|LessThan0~0_combout\,
	combout => \U_MOTOR_PWM|counter[8]~57_combout\);

-- Location: LCCOMB_X11_Y11_N28
\U_MOTOR_PWM|counter[8]~58\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[8]~58_combout\ = ((\U_MOTOR_PWM|counter[8]~55_combout\ & ((\U_MOTOR_PWM|counter[8]~57_combout\) # (!\U_MOTOR_PWM|counter\(9))))) # (!\U_MOTOR_PWM|counter\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter[8]~55_combout\,
	datab => \U_MOTOR_PWM|counter\(14),
	datac => \U_MOTOR_PWM|counter\(9),
	datad => \U_MOTOR_PWM|counter[8]~57_combout\,
	combout => \U_MOTOR_PWM|counter[8]~58_combout\);

-- Location: LCCOMB_X11_Y11_N22
\U_MOTOR_PWM|counter[8]~59\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[8]~59_combout\ = (\reset~input_o\) # ((!\U_MOTOR_PWM|counter[8]~54_combout\ & ((\U_MOTOR_PWM|counter\(15)) # (!\U_MOTOR_PWM|counter[8]~58_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(15),
	datab => \U_MOTOR_PWM|counter[8]~54_combout\,
	datac => \reset~input_o\,
	datad => \U_MOTOR_PWM|counter[8]~58_combout\,
	combout => \U_MOTOR_PWM|counter[8]~59_combout\);

-- Location: FF_X11_Y12_N13
\U_MOTOR_PWM|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[0]~20_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(0));

-- Location: LCCOMB_X11_Y12_N14
\U_MOTOR_PWM|counter[1]~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[1]~22_combout\ = (\U_MOTOR_PWM|counter\(1) & (!\U_MOTOR_PWM|counter[0]~21\)) # (!\U_MOTOR_PWM|counter\(1) & ((\U_MOTOR_PWM|counter[0]~21\) # (GND)))
-- \U_MOTOR_PWM|counter[1]~23\ = CARRY((!\U_MOTOR_PWM|counter[0]~21\) # (!\U_MOTOR_PWM|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(1),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[0]~21\,
	combout => \U_MOTOR_PWM|counter[1]~22_combout\,
	cout => \U_MOTOR_PWM|counter[1]~23\);

-- Location: FF_X11_Y12_N15
\U_MOTOR_PWM|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[1]~22_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(1));

-- Location: LCCOMB_X11_Y12_N16
\U_MOTOR_PWM|counter[2]~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[2]~24_combout\ = (\U_MOTOR_PWM|counter\(2) & (\U_MOTOR_PWM|counter[1]~23\ $ (GND))) # (!\U_MOTOR_PWM|counter\(2) & (!\U_MOTOR_PWM|counter[1]~23\ & VCC))
-- \U_MOTOR_PWM|counter[2]~25\ = CARRY((\U_MOTOR_PWM|counter\(2) & !\U_MOTOR_PWM|counter[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|counter\(2),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[1]~23\,
	combout => \U_MOTOR_PWM|counter[2]~24_combout\,
	cout => \U_MOTOR_PWM|counter[2]~25\);

-- Location: FF_X11_Y12_N17
\U_MOTOR_PWM|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[2]~24_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(2));

-- Location: LCCOMB_X11_Y12_N18
\U_MOTOR_PWM|counter[3]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[3]~26_combout\ = (\U_MOTOR_PWM|counter\(3) & (!\U_MOTOR_PWM|counter[2]~25\)) # (!\U_MOTOR_PWM|counter\(3) & ((\U_MOTOR_PWM|counter[2]~25\) # (GND)))
-- \U_MOTOR_PWM|counter[3]~27\ = CARRY((!\U_MOTOR_PWM|counter[2]~25\) # (!\U_MOTOR_PWM|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(3),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[2]~25\,
	combout => \U_MOTOR_PWM|counter[3]~26_combout\,
	cout => \U_MOTOR_PWM|counter[3]~27\);

-- Location: FF_X11_Y12_N19
\U_MOTOR_PWM|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[3]~26_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(3));

-- Location: LCCOMB_X11_Y12_N20
\U_MOTOR_PWM|counter[4]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[4]~28_combout\ = (\U_MOTOR_PWM|counter\(4) & (\U_MOTOR_PWM|counter[3]~27\ $ (GND))) # (!\U_MOTOR_PWM|counter\(4) & (!\U_MOTOR_PWM|counter[3]~27\ & VCC))
-- \U_MOTOR_PWM|counter[4]~29\ = CARRY((\U_MOTOR_PWM|counter\(4) & !\U_MOTOR_PWM|counter[3]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|counter\(4),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[3]~27\,
	combout => \U_MOTOR_PWM|counter[4]~28_combout\,
	cout => \U_MOTOR_PWM|counter[4]~29\);

-- Location: FF_X11_Y12_N21
\U_MOTOR_PWM|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[4]~28_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(4));

-- Location: LCCOMB_X11_Y12_N22
\U_MOTOR_PWM|counter[5]~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[5]~30_combout\ = (\U_MOTOR_PWM|counter\(5) & (!\U_MOTOR_PWM|counter[4]~29\)) # (!\U_MOTOR_PWM|counter\(5) & ((\U_MOTOR_PWM|counter[4]~29\) # (GND)))
-- \U_MOTOR_PWM|counter[5]~31\ = CARRY((!\U_MOTOR_PWM|counter[4]~29\) # (!\U_MOTOR_PWM|counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(5),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[4]~29\,
	combout => \U_MOTOR_PWM|counter[5]~30_combout\,
	cout => \U_MOTOR_PWM|counter[5]~31\);

-- Location: FF_X11_Y12_N23
\U_MOTOR_PWM|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[5]~30_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(5));

-- Location: LCCOMB_X11_Y12_N24
\U_MOTOR_PWM|counter[6]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[6]~32_combout\ = (\U_MOTOR_PWM|counter\(6) & (\U_MOTOR_PWM|counter[5]~31\ $ (GND))) # (!\U_MOTOR_PWM|counter\(6) & (!\U_MOTOR_PWM|counter[5]~31\ & VCC))
-- \U_MOTOR_PWM|counter[6]~33\ = CARRY((\U_MOTOR_PWM|counter\(6) & !\U_MOTOR_PWM|counter[5]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(6),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[5]~31\,
	combout => \U_MOTOR_PWM|counter[6]~32_combout\,
	cout => \U_MOTOR_PWM|counter[6]~33\);

-- Location: FF_X11_Y12_N25
\U_MOTOR_PWM|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[6]~32_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(6));

-- Location: LCCOMB_X11_Y12_N26
\U_MOTOR_PWM|counter[7]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[7]~34_combout\ = (\U_MOTOR_PWM|counter\(7) & (!\U_MOTOR_PWM|counter[6]~33\)) # (!\U_MOTOR_PWM|counter\(7) & ((\U_MOTOR_PWM|counter[6]~33\) # (GND)))
-- \U_MOTOR_PWM|counter[7]~35\ = CARRY((!\U_MOTOR_PWM|counter[6]~33\) # (!\U_MOTOR_PWM|counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|counter\(7),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[6]~33\,
	combout => \U_MOTOR_PWM|counter[7]~34_combout\,
	cout => \U_MOTOR_PWM|counter[7]~35\);

-- Location: FF_X11_Y12_N27
\U_MOTOR_PWM|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[7]~34_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(7));

-- Location: LCCOMB_X11_Y12_N28
\U_MOTOR_PWM|counter[8]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[8]~36_combout\ = (\U_MOTOR_PWM|counter\(8) & (\U_MOTOR_PWM|counter[7]~35\ $ (GND))) # (!\U_MOTOR_PWM|counter\(8) & (!\U_MOTOR_PWM|counter[7]~35\ & VCC))
-- \U_MOTOR_PWM|counter[8]~37\ = CARRY((\U_MOTOR_PWM|counter\(8) & !\U_MOTOR_PWM|counter[7]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(8),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[7]~35\,
	combout => \U_MOTOR_PWM|counter[8]~36_combout\,
	cout => \U_MOTOR_PWM|counter[8]~37\);

-- Location: FF_X11_Y12_N29
\U_MOTOR_PWM|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[8]~36_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(8));

-- Location: LCCOMB_X11_Y12_N30
\U_MOTOR_PWM|counter[9]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[9]~38_combout\ = (\U_MOTOR_PWM|counter\(9) & (!\U_MOTOR_PWM|counter[8]~37\)) # (!\U_MOTOR_PWM|counter\(9) & ((\U_MOTOR_PWM|counter[8]~37\) # (GND)))
-- \U_MOTOR_PWM|counter[9]~39\ = CARRY((!\U_MOTOR_PWM|counter[8]~37\) # (!\U_MOTOR_PWM|counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|counter\(9),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[8]~37\,
	combout => \U_MOTOR_PWM|counter[9]~38_combout\,
	cout => \U_MOTOR_PWM|counter[9]~39\);

-- Location: FF_X11_Y12_N31
\U_MOTOR_PWM|counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[9]~38_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(9));

-- Location: LCCOMB_X11_Y11_N0
\U_MOTOR_PWM|counter[10]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[10]~40_combout\ = (\U_MOTOR_PWM|counter\(10) & (\U_MOTOR_PWM|counter[9]~39\ $ (GND))) # (!\U_MOTOR_PWM|counter\(10) & (!\U_MOTOR_PWM|counter[9]~39\ & VCC))
-- \U_MOTOR_PWM|counter[10]~41\ = CARRY((\U_MOTOR_PWM|counter\(10) & !\U_MOTOR_PWM|counter[9]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|counter\(10),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[9]~39\,
	combout => \U_MOTOR_PWM|counter[10]~40_combout\,
	cout => \U_MOTOR_PWM|counter[10]~41\);

-- Location: FF_X11_Y11_N1
\U_MOTOR_PWM|counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[10]~40_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(10));

-- Location: LCCOMB_X11_Y11_N2
\U_MOTOR_PWM|counter[11]~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[11]~42_combout\ = (\U_MOTOR_PWM|counter\(11) & (!\U_MOTOR_PWM|counter[10]~41\)) # (!\U_MOTOR_PWM|counter\(11) & ((\U_MOTOR_PWM|counter[10]~41\) # (GND)))
-- \U_MOTOR_PWM|counter[11]~43\ = CARRY((!\U_MOTOR_PWM|counter[10]~41\) # (!\U_MOTOR_PWM|counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|counter\(11),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[10]~41\,
	combout => \U_MOTOR_PWM|counter[11]~42_combout\,
	cout => \U_MOTOR_PWM|counter[11]~43\);

-- Location: FF_X11_Y11_N3
\U_MOTOR_PWM|counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[11]~42_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(11));

-- Location: LCCOMB_X11_Y11_N4
\U_MOTOR_PWM|counter[12]~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[12]~44_combout\ = (\U_MOTOR_PWM|counter\(12) & (\U_MOTOR_PWM|counter[11]~43\ $ (GND))) # (!\U_MOTOR_PWM|counter\(12) & (!\U_MOTOR_PWM|counter[11]~43\ & VCC))
-- \U_MOTOR_PWM|counter[12]~45\ = CARRY((\U_MOTOR_PWM|counter\(12) & !\U_MOTOR_PWM|counter[11]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|counter\(12),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[11]~43\,
	combout => \U_MOTOR_PWM|counter[12]~44_combout\,
	cout => \U_MOTOR_PWM|counter[12]~45\);

-- Location: FF_X11_Y11_N5
\U_MOTOR_PWM|counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[12]~44_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(12));

-- Location: LCCOMB_X11_Y11_N6
\U_MOTOR_PWM|counter[13]~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[13]~46_combout\ = (\U_MOTOR_PWM|counter\(13) & (!\U_MOTOR_PWM|counter[12]~45\)) # (!\U_MOTOR_PWM|counter\(13) & ((\U_MOTOR_PWM|counter[12]~45\) # (GND)))
-- \U_MOTOR_PWM|counter[13]~47\ = CARRY((!\U_MOTOR_PWM|counter[12]~45\) # (!\U_MOTOR_PWM|counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(13),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[12]~45\,
	combout => \U_MOTOR_PWM|counter[13]~46_combout\,
	cout => \U_MOTOR_PWM|counter[13]~47\);

-- Location: FF_X11_Y11_N7
\U_MOTOR_PWM|counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[13]~46_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(13));

-- Location: LCCOMB_X11_Y11_N8
\U_MOTOR_PWM|counter[14]~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[14]~48_combout\ = (\U_MOTOR_PWM|counter\(14) & (\U_MOTOR_PWM|counter[13]~47\ $ (GND))) # (!\U_MOTOR_PWM|counter\(14) & (!\U_MOTOR_PWM|counter[13]~47\ & VCC))
-- \U_MOTOR_PWM|counter[14]~49\ = CARRY((\U_MOTOR_PWM|counter\(14) & !\U_MOTOR_PWM|counter[13]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|counter\(14),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[13]~47\,
	combout => \U_MOTOR_PWM|counter[14]~48_combout\,
	cout => \U_MOTOR_PWM|counter[14]~49\);

-- Location: FF_X11_Y11_N9
\U_MOTOR_PWM|counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[14]~48_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(14));

-- Location: LCCOMB_X11_Y11_N10
\U_MOTOR_PWM|counter[15]~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[15]~50_combout\ = (\U_MOTOR_PWM|counter\(15) & (!\U_MOTOR_PWM|counter[14]~49\)) # (!\U_MOTOR_PWM|counter\(15) & ((\U_MOTOR_PWM|counter[14]~49\) # (GND)))
-- \U_MOTOR_PWM|counter[15]~51\ = CARRY((!\U_MOTOR_PWM|counter[14]~49\) # (!\U_MOTOR_PWM|counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(15),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[14]~49\,
	combout => \U_MOTOR_PWM|counter[15]~50_combout\,
	cout => \U_MOTOR_PWM|counter[15]~51\);

-- Location: FF_X11_Y11_N11
\U_MOTOR_PWM|counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[15]~50_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(15));

-- Location: LCCOMB_X11_Y11_N12
\U_MOTOR_PWM|counter[16]~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[16]~52_combout\ = (\U_MOTOR_PWM|counter\(16) & (\U_MOTOR_PWM|counter[15]~51\ $ (GND))) # (!\U_MOTOR_PWM|counter\(16) & (!\U_MOTOR_PWM|counter[15]~51\ & VCC))
-- \U_MOTOR_PWM|counter[16]~53\ = CARRY((\U_MOTOR_PWM|counter\(16) & !\U_MOTOR_PWM|counter[15]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(16),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[15]~51\,
	combout => \U_MOTOR_PWM|counter[16]~52_combout\,
	cout => \U_MOTOR_PWM|counter[16]~53\);

-- Location: FF_X11_Y11_N13
\U_MOTOR_PWM|counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[16]~52_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(16));

-- Location: LCCOMB_X11_Y11_N14
\U_MOTOR_PWM|counter[17]~60\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[17]~60_combout\ = (\U_MOTOR_PWM|counter\(17) & (!\U_MOTOR_PWM|counter[16]~53\)) # (!\U_MOTOR_PWM|counter\(17) & ((\U_MOTOR_PWM|counter[16]~53\) # (GND)))
-- \U_MOTOR_PWM|counter[17]~61\ = CARRY((!\U_MOTOR_PWM|counter[16]~53\) # (!\U_MOTOR_PWM|counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|counter\(17),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[16]~53\,
	combout => \U_MOTOR_PWM|counter[17]~60_combout\,
	cout => \U_MOTOR_PWM|counter[17]~61\);

-- Location: FF_X11_Y11_N15
\U_MOTOR_PWM|counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[17]~60_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(17));

-- Location: LCCOMB_X11_Y11_N16
\U_MOTOR_PWM|counter[18]~62\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[18]~62_combout\ = (\U_MOTOR_PWM|counter\(18) & (\U_MOTOR_PWM|counter[17]~61\ $ (GND))) # (!\U_MOTOR_PWM|counter\(18) & (!\U_MOTOR_PWM|counter[17]~61\ & VCC))
-- \U_MOTOR_PWM|counter[18]~63\ = CARRY((\U_MOTOR_PWM|counter\(18) & !\U_MOTOR_PWM|counter[17]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|counter\(18),
	datad => VCC,
	cin => \U_MOTOR_PWM|counter[17]~61\,
	combout => \U_MOTOR_PWM|counter[18]~62_combout\,
	cout => \U_MOTOR_PWM|counter[18]~63\);

-- Location: FF_X11_Y11_N17
\U_MOTOR_PWM|counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[18]~62_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(18));

-- Location: LCCOMB_X11_Y11_N18
\U_MOTOR_PWM|counter[19]~64\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|counter[19]~64_combout\ = \U_MOTOR_PWM|counter[18]~63\ $ (\U_MOTOR_PWM|counter\(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \U_MOTOR_PWM|counter\(19),
	cin => \U_MOTOR_PWM|counter[18]~63\,
	combout => \U_MOTOR_PWM|counter[19]~64_combout\);

-- Location: FF_X11_Y11_N19
\U_MOTOR_PWM|counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|counter[19]~64_combout\,
	sclr => \U_MOTOR_PWM|counter[8]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|counter\(19));

-- Location: IOIBUF_X9_Y0_N22
\SW_motor[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW_motor(2),
	o => \SW_motor[2]~input_o\);

-- Location: IOIBUF_X0_Y11_N1
\SW_motor[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW_motor(1),
	o => \SW_motor[1]~input_o\);

-- Location: IOIBUF_X7_Y0_N22
\SW_motor[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW_motor(3),
	o => \SW_motor[3]~input_o\);

-- Location: LCCOMB_X8_Y11_N4
\U_MOTOR_PWM|Mult0|mult_core|romout[0][16]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][16]~combout\ = (\SW_motor[2]~input_o\ & (\SW_motor[1]~input_o\ & !\SW_motor[3]~input_o\)) # (!\SW_motor[2]~input_o\ & ((\SW_motor[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][16]~combout\);

-- Location: IOIBUF_X9_Y29_N29
\SW_motor[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW_motor(0),
	o => \SW_motor[0]~input_o\);

-- Location: LCCOMB_X8_Y11_N14
\U_MOTOR_PWM|Mult0|mult_core|romout[0][15]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][15]~combout\ = (\SW_motor[2]~input_o\ & (\SW_motor[1]~input_o\ $ ((!\SW_motor[3]~input_o\)))) # (!\SW_motor[2]~input_o\ & ((\SW_motor[1]~input_o\ & ((\SW_motor[3]~input_o\) # (\SW_motor[0]~input_o\))) # 
-- (!\SW_motor[1]~input_o\ & (\SW_motor[3]~input_o\ & \SW_motor[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101011011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][15]~combout\);

-- Location: LCCOMB_X8_Y11_N12
\U_MOTOR_PWM|Mult0|mult_core|romout[0][14]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][14]~0_combout\ = (\SW_motor[0]~input_o\ & (\SW_motor[2]~input_o\ $ (((\SW_motor[1]~input_o\ & \SW_motor[3]~input_o\))))) # (!\SW_motor[0]~input_o\ & (!\SW_motor[2]~input_o\ & ((\SW_motor[1]~input_o\) # 
-- (\SW_motor[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][14]~0_combout\);

-- Location: LCCOMB_X8_Y11_N6
\U_MOTOR_PWM|Mult0|mult_core|romout[0][13]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][13]~1_combout\ = (\SW_motor[1]~input_o\ & (((\SW_motor[3]~input_o\ & \SW_motor[0]~input_o\)))) # (!\SW_motor[1]~input_o\ & ((\SW_motor[2]~input_o\ & ((!\SW_motor[0]~input_o\) # (!\SW_motor[3]~input_o\))) # 
-- (!\SW_motor[2]~input_o\ & ((\SW_motor[3]~input_o\) # (\SW_motor[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][13]~1_combout\);

-- Location: LCCOMB_X8_Y11_N16
\U_MOTOR_PWM|Mult0|mult_core|romout[0][12]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][12]~2_combout\ = (\SW_motor[3]~input_o\ & (\SW_motor[0]~input_o\ $ (((!\SW_motor[2]~input_o\ & !\SW_motor[1]~input_o\))))) # (!\SW_motor[3]~input_o\ & (!\SW_motor[0]~input_o\ & ((\SW_motor[2]~input_o\) # 
-- (\SW_motor[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][12]~2_combout\);

-- Location: LCCOMB_X8_Y11_N22
\U_MOTOR_PWM|Mult0|mult_core|romout[0][11]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][11]~3_combout\ = (\SW_motor[1]~input_o\ & (((\SW_motor[3]~input_o\ & !\SW_motor[0]~input_o\)) # (!\SW_motor[2]~input_o\))) # (!\SW_motor[1]~input_o\ & (\SW_motor[2]~input_o\ $ (((!\SW_motor[3]~input_o\ & 
-- \SW_motor[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010111100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][11]~3_combout\);

-- Location: LCCOMB_X8_Y11_N0
\U_MOTOR_PWM|Mult0|mult_core|romout[0][10]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][10]~combout\ = (\SW_motor[3]~input_o\ & (\SW_motor[1]~input_o\ $ (((\SW_motor[2]~input_o\ & !\SW_motor[0]~input_o\))))) # (!\SW_motor[3]~input_o\ & ((\SW_motor[1]~input_o\ & ((\SW_motor[2]~input_o\) # 
-- (!\SW_motor[0]~input_o\))) # (!\SW_motor[1]~input_o\ & ((\SW_motor[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101101101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][10]~combout\);

-- Location: LCCOMB_X8_Y11_N26
\U_MOTOR_PWM|Mult0|mult_core|romout[0][9]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][9]~4_combout\ = (\SW_motor[2]~input_o\ & (\SW_motor[0]~input_o\ $ (((\SW_motor[1]~input_o\ & !\SW_motor[3]~input_o\))))) # (!\SW_motor[2]~input_o\ & ((\SW_motor[3]~input_o\ & ((\SW_motor[1]~input_o\) # 
-- (!\SW_motor[0]~input_o\))) # (!\SW_motor[3]~input_o\ & ((\SW_motor[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011101011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][9]~4_combout\);

-- Location: LCCOMB_X8_Y11_N28
\U_MOTOR_PWM|Mult0|mult_core|romout[0][8]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~combout\ = (\SW_motor[2]~input_o\ & ((\SW_motor[1]~input_o\ & (\SW_motor[3]~input_o\)) # (!\SW_motor[1]~input_o\ & ((\SW_motor[0]~input_o\) # (!\SW_motor[3]~input_o\))))) # (!\SW_motor[2]~input_o\ & 
-- (\SW_motor[3]~input_o\ $ (((\SW_motor[1]~input_o\ & \SW_motor[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011011011010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~combout\);

-- Location: LCCOMB_X8_Y11_N2
\U_MOTOR_PWM|Mult0|mult_core|romout[0][7]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][7]~5_combout\ = (\SW_motor[1]~input_o\ & (\SW_motor[2]~input_o\ $ (((\SW_motor[0]~input_o\))))) # (!\SW_motor[1]~input_o\ & (((\SW_motor[3]~input_o\ & \SW_motor[0]~input_o\)) # (!\SW_motor[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010110011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][7]~5_combout\);

-- Location: LCCOMB_X8_Y11_N24
\U_MOTOR_PWM|Mult0|mult_core|romout[0][6]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][6]~6_combout\ = (\SW_motor[1]~input_o\ & (((\SW_motor[3]~input_o\) # (!\SW_motor[0]~input_o\)))) # (!\SW_motor[1]~input_o\ & (\SW_motor[0]~input_o\ & ((!\SW_motor[3]~input_o\) # (!\SW_motor[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][6]~6_combout\);

-- Location: LCCOMB_X8_Y11_N10
\U_MOTOR_PWM|Mult0|mult_core|romout[0][5]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][5]~7_combout\ = (\SW_motor[2]~input_o\ & ((\SW_motor[3]~input_o\ $ (\SW_motor[0]~input_o\)))) # (!\SW_motor[2]~input_o\ & (\SW_motor[0]~input_o\ & ((!\SW_motor[3]~input_o\) # (!\SW_motor[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][5]~7_combout\);

-- Location: LCCOMB_X8_Y11_N8
\U_MOTOR_PWM|Mult0|mult_core|romout[0][16]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][16]~8_combout\ = (\SW_motor[2]~input_o\ & (((\SW_motor[3]~input_o\)) # (!\SW_motor[1]~input_o\))) # (!\SW_motor[2]~input_o\ & (((\SW_motor[1]~input_o\ & \SW_motor[0]~input_o\)) # (!\SW_motor[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011110100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][16]~8_combout\);

-- Location: LCCOMB_X8_Y11_N18
\U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~9_combout\ = \SW_motor[3]~input_o\ $ (((\SW_motor[2]~input_o\ & (\SW_motor[1]~input_o\)) # (!\SW_motor[2]~input_o\ & ((!\SW_motor[0]~input_o\) # (!\SW_motor[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datab => \SW_motor[1]~input_o\,
	datac => \SW_motor[3]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~9_combout\);

-- Location: LCCOMB_X9_Y12_N0
\U_MOTOR_PWM|duty_cycle[3]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[3]~14_combout\ = \U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~9_combout\ $ (GND)
-- \U_MOTOR_PWM|duty_cycle[3]~15\ = CARRY(!\U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~9_combout\,
	datad => VCC,
	combout => \U_MOTOR_PWM|duty_cycle[3]~14_combout\,
	cout => \U_MOTOR_PWM|duty_cycle[3]~15\);

-- Location: LCCOMB_X9_Y12_N2
\U_MOTOR_PWM|duty_cycle[4]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[4]~16_combout\ = (\U_MOTOR_PWM|Mult0|mult_core|romout[0][16]~8_combout\ & ((\U_MOTOR_PWM|duty_cycle[3]~15\) # (GND))) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][16]~8_combout\ & (!\U_MOTOR_PWM|duty_cycle[3]~15\))
-- \U_MOTOR_PWM|duty_cycle[4]~17\ = CARRY((\U_MOTOR_PWM|Mult0|mult_core|romout[0][16]~8_combout\) # (!\U_MOTOR_PWM|duty_cycle[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|Mult0|mult_core|romout[0][16]~8_combout\,
	datad => VCC,
	cin => \U_MOTOR_PWM|duty_cycle[3]~15\,
	combout => \U_MOTOR_PWM|duty_cycle[4]~16_combout\,
	cout => \U_MOTOR_PWM|duty_cycle[4]~17\);

-- Location: LCCOMB_X9_Y12_N4
\U_MOTOR_PWM|duty_cycle[5]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[5]~18_combout\ = (\U_MOTOR_PWM|Mult0|mult_core|romout[0][5]~7_combout\ & ((GND) # (!\U_MOTOR_PWM|duty_cycle[4]~17\))) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][5]~7_combout\ & (\U_MOTOR_PWM|duty_cycle[4]~17\ $ (GND)))
-- \U_MOTOR_PWM|duty_cycle[5]~19\ = CARRY((\U_MOTOR_PWM|Mult0|mult_core|romout[0][5]~7_combout\) # (!\U_MOTOR_PWM|duty_cycle[4]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|Mult0|mult_core|romout[0][5]~7_combout\,
	datad => VCC,
	cin => \U_MOTOR_PWM|duty_cycle[4]~17\,
	combout => \U_MOTOR_PWM|duty_cycle[5]~18_combout\,
	cout => \U_MOTOR_PWM|duty_cycle[5]~19\);

-- Location: LCCOMB_X9_Y12_N6
\U_MOTOR_PWM|duty_cycle[6]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[6]~20_combout\ = (\U_MOTOR_PWM|Mult0|mult_core|romout[0][6]~6_combout\ & (!\U_MOTOR_PWM|duty_cycle[5]~19\)) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][6]~6_combout\ & ((\U_MOTOR_PWM|duty_cycle[5]~19\) # (GND)))
-- \U_MOTOR_PWM|duty_cycle[6]~21\ = CARRY((!\U_MOTOR_PWM|duty_cycle[5]~19\) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][6]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|Mult0|mult_core|romout[0][6]~6_combout\,
	datad => VCC,
	cin => \U_MOTOR_PWM|duty_cycle[5]~19\,
	combout => \U_MOTOR_PWM|duty_cycle[6]~20_combout\,
	cout => \U_MOTOR_PWM|duty_cycle[6]~21\);

-- Location: LCCOMB_X9_Y12_N8
\U_MOTOR_PWM|duty_cycle[7]~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[7]~22_combout\ = (\U_MOTOR_PWM|Mult0|mult_core|romout[0][7]~5_combout\ & (\U_MOTOR_PWM|duty_cycle[6]~21\ $ (GND))) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][7]~5_combout\ & ((GND) # (!\U_MOTOR_PWM|duty_cycle[6]~21\)))
-- \U_MOTOR_PWM|duty_cycle[7]~23\ = CARRY((!\U_MOTOR_PWM|duty_cycle[6]~21\) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][7]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|Mult0|mult_core|romout[0][7]~5_combout\,
	datad => VCC,
	cin => \U_MOTOR_PWM|duty_cycle[6]~21\,
	combout => \U_MOTOR_PWM|duty_cycle[7]~22_combout\,
	cout => \U_MOTOR_PWM|duty_cycle[7]~23\);

-- Location: LCCOMB_X9_Y12_N10
\U_MOTOR_PWM|duty_cycle[8]~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[8]~24_combout\ = (\U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~combout\ & (\U_MOTOR_PWM|duty_cycle[7]~23\ & VCC)) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~combout\ & (!\U_MOTOR_PWM|duty_cycle[7]~23\))
-- \U_MOTOR_PWM|duty_cycle[8]~25\ = CARRY((!\U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~combout\ & !\U_MOTOR_PWM|duty_cycle[7]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|Mult0|mult_core|romout[0][8]~combout\,
	datad => VCC,
	cin => \U_MOTOR_PWM|duty_cycle[7]~23\,
	combout => \U_MOTOR_PWM|duty_cycle[8]~24_combout\,
	cout => \U_MOTOR_PWM|duty_cycle[8]~25\);

-- Location: LCCOMB_X9_Y12_N12
\U_MOTOR_PWM|duty_cycle[9]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[9]~26_combout\ = (\U_MOTOR_PWM|Mult0|mult_core|romout[0][9]~4_combout\ & (\U_MOTOR_PWM|duty_cycle[8]~25\ $ (GND))) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][9]~4_combout\ & (!\U_MOTOR_PWM|duty_cycle[8]~25\ & VCC))
-- \U_MOTOR_PWM|duty_cycle[9]~27\ = CARRY((\U_MOTOR_PWM|Mult0|mult_core|romout[0][9]~4_combout\ & !\U_MOTOR_PWM|duty_cycle[8]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|Mult0|mult_core|romout[0][9]~4_combout\,
	datad => VCC,
	cin => \U_MOTOR_PWM|duty_cycle[8]~25\,
	combout => \U_MOTOR_PWM|duty_cycle[9]~26_combout\,
	cout => \U_MOTOR_PWM|duty_cycle[9]~27\);

-- Location: LCCOMB_X9_Y12_N14
\U_MOTOR_PWM|duty_cycle[10]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[10]~28_combout\ = (\U_MOTOR_PWM|Mult0|mult_core|romout[0][10]~combout\ & (!\U_MOTOR_PWM|duty_cycle[9]~27\)) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][10]~combout\ & ((\U_MOTOR_PWM|duty_cycle[9]~27\) # (GND)))
-- \U_MOTOR_PWM|duty_cycle[10]~29\ = CARRY((!\U_MOTOR_PWM|duty_cycle[9]~27\) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][10]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|Mult0|mult_core|romout[0][10]~combout\,
	datad => VCC,
	cin => \U_MOTOR_PWM|duty_cycle[9]~27\,
	combout => \U_MOTOR_PWM|duty_cycle[10]~28_combout\,
	cout => \U_MOTOR_PWM|duty_cycle[10]~29\);

-- Location: LCCOMB_X9_Y12_N16
\U_MOTOR_PWM|duty_cycle[11]~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[11]~30_combout\ = (\U_MOTOR_PWM|Mult0|mult_core|romout[0][11]~3_combout\ & (\U_MOTOR_PWM|duty_cycle[10]~29\ $ (GND))) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][11]~3_combout\ & (!\U_MOTOR_PWM|duty_cycle[10]~29\ & VCC))
-- \U_MOTOR_PWM|duty_cycle[11]~31\ = CARRY((\U_MOTOR_PWM|Mult0|mult_core|romout[0][11]~3_combout\ & !\U_MOTOR_PWM|duty_cycle[10]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|Mult0|mult_core|romout[0][11]~3_combout\,
	datad => VCC,
	cin => \U_MOTOR_PWM|duty_cycle[10]~29\,
	combout => \U_MOTOR_PWM|duty_cycle[11]~30_combout\,
	cout => \U_MOTOR_PWM|duty_cycle[11]~31\);

-- Location: LCCOMB_X9_Y12_N18
\U_MOTOR_PWM|duty_cycle[12]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[12]~32_combout\ = (\U_MOTOR_PWM|Mult0|mult_core|romout[0][12]~2_combout\ & (!\U_MOTOR_PWM|duty_cycle[11]~31\)) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][12]~2_combout\ & ((\U_MOTOR_PWM|duty_cycle[11]~31\) # (GND)))
-- \U_MOTOR_PWM|duty_cycle[12]~33\ = CARRY((!\U_MOTOR_PWM|duty_cycle[11]~31\) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][12]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|Mult0|mult_core|romout[0][12]~2_combout\,
	datad => VCC,
	cin => \U_MOTOR_PWM|duty_cycle[11]~31\,
	combout => \U_MOTOR_PWM|duty_cycle[12]~32_combout\,
	cout => \U_MOTOR_PWM|duty_cycle[12]~33\);

-- Location: LCCOMB_X9_Y12_N20
\U_MOTOR_PWM|duty_cycle[13]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[13]~34_combout\ = (\U_MOTOR_PWM|Mult0|mult_core|romout[0][13]~1_combout\ & ((GND) # (!\U_MOTOR_PWM|duty_cycle[12]~33\))) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][13]~1_combout\ & (\U_MOTOR_PWM|duty_cycle[12]~33\ $ (GND)))
-- \U_MOTOR_PWM|duty_cycle[13]~35\ = CARRY((\U_MOTOR_PWM|Mult0|mult_core|romout[0][13]~1_combout\) # (!\U_MOTOR_PWM|duty_cycle[12]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|Mult0|mult_core|romout[0][13]~1_combout\,
	datad => VCC,
	cin => \U_MOTOR_PWM|duty_cycle[12]~33\,
	combout => \U_MOTOR_PWM|duty_cycle[13]~34_combout\,
	cout => \U_MOTOR_PWM|duty_cycle[13]~35\);

-- Location: LCCOMB_X9_Y12_N22
\U_MOTOR_PWM|duty_cycle[14]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[14]~36_combout\ = (\U_MOTOR_PWM|Mult0|mult_core|romout[0][14]~0_combout\ & (\U_MOTOR_PWM|duty_cycle[13]~35\ & VCC)) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][14]~0_combout\ & (!\U_MOTOR_PWM|duty_cycle[13]~35\))
-- \U_MOTOR_PWM|duty_cycle[14]~37\ = CARRY((!\U_MOTOR_PWM|Mult0|mult_core|romout[0][14]~0_combout\ & !\U_MOTOR_PWM|duty_cycle[13]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|Mult0|mult_core|romout[0][14]~0_combout\,
	datad => VCC,
	cin => \U_MOTOR_PWM|duty_cycle[13]~35\,
	combout => \U_MOTOR_PWM|duty_cycle[14]~36_combout\,
	cout => \U_MOTOR_PWM|duty_cycle[14]~37\);

-- Location: LCCOMB_X9_Y12_N24
\U_MOTOR_PWM|duty_cycle[15]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[15]~38_combout\ = (\U_MOTOR_PWM|Mult0|mult_core|romout[0][15]~combout\ & (\U_MOTOR_PWM|duty_cycle[14]~37\ $ (GND))) # (!\U_MOTOR_PWM|Mult0|mult_core|romout[0][15]~combout\ & (!\U_MOTOR_PWM|duty_cycle[14]~37\ & VCC))
-- \U_MOTOR_PWM|duty_cycle[15]~39\ = CARRY((\U_MOTOR_PWM|Mult0|mult_core|romout[0][15]~combout\ & !\U_MOTOR_PWM|duty_cycle[14]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|Mult0|mult_core|romout[0][15]~combout\,
	datad => VCC,
	cin => \U_MOTOR_PWM|duty_cycle[14]~37\,
	combout => \U_MOTOR_PWM|duty_cycle[15]~38_combout\,
	cout => \U_MOTOR_PWM|duty_cycle[15]~39\);

-- Location: LCCOMB_X9_Y12_N26
\U_MOTOR_PWM|duty_cycle[16]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[16]~40_combout\ = \U_MOTOR_PWM|duty_cycle[15]~39\ $ (\U_MOTOR_PWM|Mult0|mult_core|romout[0][16]~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \U_MOTOR_PWM|Mult0|mult_core|romout[0][16]~combout\,
	cin => \U_MOTOR_PWM|duty_cycle[15]~39\,
	combout => \U_MOTOR_PWM|duty_cycle[16]~40_combout\);

-- Location: LCCOMB_X9_Y11_N8
\~GND\ : cycloneiii_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: FF_X9_Y12_N27
\U_MOTOR_PWM|duty_cycle[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[16]~40_combout\,
	asdata => \~GND~combout\,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(16));

-- Location: FF_X9_Y12_N25
\U_MOTOR_PWM|duty_cycle[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[15]~38_combout\,
	asdata => \~GND~combout\,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(15));

-- Location: FF_X9_Y12_N23
\U_MOTOR_PWM|duty_cycle[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[14]~36_combout\,
	asdata => VCC,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(14));

-- Location: LCCOMB_X9_Y11_N28
\U_MOTOR_PWM|duty_cycle[13]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[13]~feeder_combout\ = \U_MOTOR_PWM|duty_cycle[13]~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_MOTOR_PWM|duty_cycle[13]~34_combout\,
	combout => \U_MOTOR_PWM|duty_cycle[13]~feeder_combout\);

-- Location: FF_X9_Y11_N29
\U_MOTOR_PWM|duty_cycle[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[13]~feeder_combout\,
	asdata => VCC,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(13));

-- Location: FF_X9_Y12_N19
\U_MOTOR_PWM|duty_cycle[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[12]~32_combout\,
	asdata => \~GND~combout\,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(12));

-- Location: LCCOMB_X9_Y11_N22
\U_MOTOR_PWM|duty_cycle[11]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[11]~feeder_combout\ = \U_MOTOR_PWM|duty_cycle[11]~30_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_MOTOR_PWM|duty_cycle[11]~30_combout\,
	combout => \U_MOTOR_PWM|duty_cycle[11]~feeder_combout\);

-- Location: FF_X9_Y11_N23
\U_MOTOR_PWM|duty_cycle[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[11]~feeder_combout\,
	asdata => \~GND~combout\,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(11));

-- Location: FF_X9_Y12_N15
\U_MOTOR_PWM|duty_cycle[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[10]~28_combout\,
	asdata => \~GND~combout\,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(10));

-- Location: LCCOMB_X9_Y12_N28
\U_MOTOR_PWM|duty_cycle[9]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[9]~feeder_combout\ = \U_MOTOR_PWM|duty_cycle[9]~26_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_MOTOR_PWM|duty_cycle[9]~26_combout\,
	combout => \U_MOTOR_PWM|duty_cycle[9]~feeder_combout\);

-- Location: FF_X9_Y12_N29
\U_MOTOR_PWM|duty_cycle[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[9]~feeder_combout\,
	asdata => \~GND~combout\,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(9));

-- Location: FF_X9_Y12_N11
\U_MOTOR_PWM|duty_cycle[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[8]~24_combout\,
	asdata => VCC,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(8));

-- Location: FF_X9_Y12_N9
\U_MOTOR_PWM|duty_cycle[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[7]~22_combout\,
	asdata => VCC,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(7));

-- Location: FF_X9_Y12_N7
\U_MOTOR_PWM|duty_cycle[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[6]~20_combout\,
	asdata => \~GND~combout\,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(6));

-- Location: FF_X9_Y12_N5
\U_MOTOR_PWM|duty_cycle[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[5]~18_combout\,
	asdata => VCC,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(5));

-- Location: FF_X9_Y12_N3
\U_MOTOR_PWM|duty_cycle[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[4]~16_combout\,
	asdata => \~GND~combout\,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(4));

-- Location: LCCOMB_X9_Y12_N30
\U_MOTOR_PWM|duty_cycle[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle[3]~feeder_combout\ = \U_MOTOR_PWM|duty_cycle[3]~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \U_MOTOR_PWM|duty_cycle[3]~14_combout\,
	combout => \U_MOTOR_PWM|duty_cycle[3]~feeder_combout\);

-- Location: FF_X9_Y12_N31
\U_MOTOR_PWM|duty_cycle[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle[3]~feeder_combout\,
	asdata => VCC,
	sload => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(3));

-- Location: LCCOMB_X8_Y11_N20
\U_MOTOR_PWM|Mult0|mult_core|romout[0][2]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][2]~combout\ = \SW_motor[2]~input_o\ $ (((\SW_motor[1]~input_o\ & !\SW_motor[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_motor[2]~input_o\,
	datac => \SW_motor[1]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][2]~combout\);

-- Location: FF_X10_Y12_N21
\U_MOTOR_PWM|duty_cycle[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \U_MOTOR_PWM|Mult0|mult_core|romout[0][2]~combout\,
	sclr => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(2));

-- Location: LCCOMB_X8_Y11_N30
\U_MOTOR_PWM|Mult0|mult_core|romout[0][1]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|Mult0|mult_core|romout[0][1]~10_combout\ = \SW_motor[1]~input_o\ $ (\SW_motor[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW_motor[1]~input_o\,
	datad => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|Mult0|mult_core|romout[0][1]~10_combout\);

-- Location: FF_X10_Y12_N19
\U_MOTOR_PWM|duty_cycle[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \U_MOTOR_PWM|Mult0|mult_core|romout[0][1]~10_combout\,
	sclr => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(1));

-- Location: LCCOMB_X10_Y12_N12
\U_MOTOR_PWM|duty_cycle~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|duty_cycle~42_combout\ = (!\reset~input_o\ & \SW_motor[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \SW_motor[0]~input_o\,
	combout => \U_MOTOR_PWM|duty_cycle~42_combout\);

-- Location: FF_X10_Y12_N13
\U_MOTOR_PWM|duty_cycle[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|duty_cycle~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|duty_cycle\(0));

-- Location: LCCOMB_X10_Y12_N16
\U_MOTOR_PWM|LessThan1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~1_cout\ = CARRY((\U_MOTOR_PWM|duty_cycle\(0) & !\U_MOTOR_PWM|counter\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|duty_cycle\(0),
	datab => \U_MOTOR_PWM|counter\(0),
	datad => VCC,
	cout => \U_MOTOR_PWM|LessThan1~1_cout\);

-- Location: LCCOMB_X10_Y12_N18
\U_MOTOR_PWM|LessThan1~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~3_cout\ = CARRY((\U_MOTOR_PWM|duty_cycle\(1) & (\U_MOTOR_PWM|counter\(1) & !\U_MOTOR_PWM|LessThan1~1_cout\)) # (!\U_MOTOR_PWM|duty_cycle\(1) & ((\U_MOTOR_PWM|counter\(1)) # (!\U_MOTOR_PWM|LessThan1~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|duty_cycle\(1),
	datab => \U_MOTOR_PWM|counter\(1),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~1_cout\,
	cout => \U_MOTOR_PWM|LessThan1~3_cout\);

-- Location: LCCOMB_X10_Y12_N20
\U_MOTOR_PWM|LessThan1~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~5_cout\ = CARRY((\U_MOTOR_PWM|duty_cycle\(2) & ((!\U_MOTOR_PWM|LessThan1~3_cout\) # (!\U_MOTOR_PWM|counter\(2)))) # (!\U_MOTOR_PWM|duty_cycle\(2) & (!\U_MOTOR_PWM|counter\(2) & !\U_MOTOR_PWM|LessThan1~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|duty_cycle\(2),
	datab => \U_MOTOR_PWM|counter\(2),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~3_cout\,
	cout => \U_MOTOR_PWM|LessThan1~5_cout\);

-- Location: LCCOMB_X10_Y12_N22
\U_MOTOR_PWM|LessThan1~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~7_cout\ = CARRY((\U_MOTOR_PWM|counter\(3) & ((!\U_MOTOR_PWM|LessThan1~5_cout\) # (!\U_MOTOR_PWM|duty_cycle\(3)))) # (!\U_MOTOR_PWM|counter\(3) & (!\U_MOTOR_PWM|duty_cycle\(3) & !\U_MOTOR_PWM|LessThan1~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(3),
	datab => \U_MOTOR_PWM|duty_cycle\(3),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~5_cout\,
	cout => \U_MOTOR_PWM|LessThan1~7_cout\);

-- Location: LCCOMB_X10_Y12_N24
\U_MOTOR_PWM|LessThan1~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~9_cout\ = CARRY((\U_MOTOR_PWM|duty_cycle\(4) & ((!\U_MOTOR_PWM|LessThan1~7_cout\) # (!\U_MOTOR_PWM|counter\(4)))) # (!\U_MOTOR_PWM|duty_cycle\(4) & (!\U_MOTOR_PWM|counter\(4) & !\U_MOTOR_PWM|LessThan1~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|duty_cycle\(4),
	datab => \U_MOTOR_PWM|counter\(4),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~7_cout\,
	cout => \U_MOTOR_PWM|LessThan1~9_cout\);

-- Location: LCCOMB_X10_Y12_N26
\U_MOTOR_PWM|LessThan1~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~11_cout\ = CARRY((\U_MOTOR_PWM|counter\(5) & ((!\U_MOTOR_PWM|LessThan1~9_cout\) # (!\U_MOTOR_PWM|duty_cycle\(5)))) # (!\U_MOTOR_PWM|counter\(5) & (!\U_MOTOR_PWM|duty_cycle\(5) & !\U_MOTOR_PWM|LessThan1~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(5),
	datab => \U_MOTOR_PWM|duty_cycle\(5),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~9_cout\,
	cout => \U_MOTOR_PWM|LessThan1~11_cout\);

-- Location: LCCOMB_X10_Y12_N28
\U_MOTOR_PWM|LessThan1~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~13_cout\ = CARRY((\U_MOTOR_PWM|counter\(6) & (\U_MOTOR_PWM|duty_cycle\(6) & !\U_MOTOR_PWM|LessThan1~11_cout\)) # (!\U_MOTOR_PWM|counter\(6) & ((\U_MOTOR_PWM|duty_cycle\(6)) # (!\U_MOTOR_PWM|LessThan1~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(6),
	datab => \U_MOTOR_PWM|duty_cycle\(6),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~11_cout\,
	cout => \U_MOTOR_PWM|LessThan1~13_cout\);

-- Location: LCCOMB_X10_Y12_N30
\U_MOTOR_PWM|LessThan1~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~15_cout\ = CARRY((\U_MOTOR_PWM|duty_cycle\(7) & (\U_MOTOR_PWM|counter\(7) & !\U_MOTOR_PWM|LessThan1~13_cout\)) # (!\U_MOTOR_PWM|duty_cycle\(7) & ((\U_MOTOR_PWM|counter\(7)) # (!\U_MOTOR_PWM|LessThan1~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|duty_cycle\(7),
	datab => \U_MOTOR_PWM|counter\(7),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~13_cout\,
	cout => \U_MOTOR_PWM|LessThan1~15_cout\);

-- Location: LCCOMB_X10_Y11_N0
\U_MOTOR_PWM|LessThan1~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~17_cout\ = CARRY((\U_MOTOR_PWM|duty_cycle\(8) & ((!\U_MOTOR_PWM|LessThan1~15_cout\) # (!\U_MOTOR_PWM|counter\(8)))) # (!\U_MOTOR_PWM|duty_cycle\(8) & (!\U_MOTOR_PWM|counter\(8) & !\U_MOTOR_PWM|LessThan1~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|duty_cycle\(8),
	datab => \U_MOTOR_PWM|counter\(8),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~15_cout\,
	cout => \U_MOTOR_PWM|LessThan1~17_cout\);

-- Location: LCCOMB_X10_Y11_N2
\U_MOTOR_PWM|LessThan1~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~19_cout\ = CARRY((\U_MOTOR_PWM|duty_cycle\(9) & (\U_MOTOR_PWM|counter\(9) & !\U_MOTOR_PWM|LessThan1~17_cout\)) # (!\U_MOTOR_PWM|duty_cycle\(9) & ((\U_MOTOR_PWM|counter\(9)) # (!\U_MOTOR_PWM|LessThan1~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|duty_cycle\(9),
	datab => \U_MOTOR_PWM|counter\(9),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~17_cout\,
	cout => \U_MOTOR_PWM|LessThan1~19_cout\);

-- Location: LCCOMB_X10_Y11_N4
\U_MOTOR_PWM|LessThan1~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~21_cout\ = CARRY((\U_MOTOR_PWM|duty_cycle\(10) & ((!\U_MOTOR_PWM|LessThan1~19_cout\) # (!\U_MOTOR_PWM|counter\(10)))) # (!\U_MOTOR_PWM|duty_cycle\(10) & (!\U_MOTOR_PWM|counter\(10) & !\U_MOTOR_PWM|LessThan1~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|duty_cycle\(10),
	datab => \U_MOTOR_PWM|counter\(10),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~19_cout\,
	cout => \U_MOTOR_PWM|LessThan1~21_cout\);

-- Location: LCCOMB_X10_Y11_N6
\U_MOTOR_PWM|LessThan1~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~23_cout\ = CARRY((\U_MOTOR_PWM|counter\(11) & ((!\U_MOTOR_PWM|LessThan1~21_cout\) # (!\U_MOTOR_PWM|duty_cycle\(11)))) # (!\U_MOTOR_PWM|counter\(11) & (!\U_MOTOR_PWM|duty_cycle\(11) & !\U_MOTOR_PWM|LessThan1~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(11),
	datab => \U_MOTOR_PWM|duty_cycle\(11),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~21_cout\,
	cout => \U_MOTOR_PWM|LessThan1~23_cout\);

-- Location: LCCOMB_X10_Y11_N8
\U_MOTOR_PWM|LessThan1~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~25_cout\ = CARRY((\U_MOTOR_PWM|counter\(12) & (\U_MOTOR_PWM|duty_cycle\(12) & !\U_MOTOR_PWM|LessThan1~23_cout\)) # (!\U_MOTOR_PWM|counter\(12) & ((\U_MOTOR_PWM|duty_cycle\(12)) # (!\U_MOTOR_PWM|LessThan1~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(12),
	datab => \U_MOTOR_PWM|duty_cycle\(12),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~23_cout\,
	cout => \U_MOTOR_PWM|LessThan1~25_cout\);

-- Location: LCCOMB_X10_Y11_N10
\U_MOTOR_PWM|LessThan1~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~27_cout\ = CARRY((\U_MOTOR_PWM|counter\(13) & ((!\U_MOTOR_PWM|LessThan1~25_cout\) # (!\U_MOTOR_PWM|duty_cycle\(13)))) # (!\U_MOTOR_PWM|counter\(13) & (!\U_MOTOR_PWM|duty_cycle\(13) & !\U_MOTOR_PWM|LessThan1~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(13),
	datab => \U_MOTOR_PWM|duty_cycle\(13),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~25_cout\,
	cout => \U_MOTOR_PWM|LessThan1~27_cout\);

-- Location: LCCOMB_X10_Y11_N12
\U_MOTOR_PWM|LessThan1~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~29_cout\ = CARRY((\U_MOTOR_PWM|duty_cycle\(14) & ((!\U_MOTOR_PWM|LessThan1~27_cout\) # (!\U_MOTOR_PWM|counter\(14)))) # (!\U_MOTOR_PWM|duty_cycle\(14) & (!\U_MOTOR_PWM|counter\(14) & !\U_MOTOR_PWM|LessThan1~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|duty_cycle\(14),
	datab => \U_MOTOR_PWM|counter\(14),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~27_cout\,
	cout => \U_MOTOR_PWM|LessThan1~29_cout\);

-- Location: LCCOMB_X10_Y11_N14
\U_MOTOR_PWM|LessThan1~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~31_cout\ = CARRY((\U_MOTOR_PWM|duty_cycle\(15) & (\U_MOTOR_PWM|counter\(15) & !\U_MOTOR_PWM|LessThan1~29_cout\)) # (!\U_MOTOR_PWM|duty_cycle\(15) & ((\U_MOTOR_PWM|counter\(15)) # (!\U_MOTOR_PWM|LessThan1~29_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|duty_cycle\(15),
	datab => \U_MOTOR_PWM|counter\(15),
	datad => VCC,
	cin => \U_MOTOR_PWM|LessThan1~29_cout\,
	cout => \U_MOTOR_PWM|LessThan1~31_cout\);

-- Location: LCCOMB_X10_Y11_N16
\U_MOTOR_PWM|LessThan1~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~32_combout\ = (\U_MOTOR_PWM|duty_cycle\(16) & ((!\U_MOTOR_PWM|LessThan1~31_cout\) # (!\U_MOTOR_PWM|counter\(16)))) # (!\U_MOTOR_PWM|duty_cycle\(16) & (!\U_MOTOR_PWM|counter\(16) & !\U_MOTOR_PWM|LessThan1~31_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|duty_cycle\(16),
	datab => \U_MOTOR_PWM|counter\(16),
	cin => \U_MOTOR_PWM|LessThan1~31_cout\,
	combout => \U_MOTOR_PWM|LessThan1~32_combout\);

-- Location: LCCOMB_X10_Y11_N22
\U_MOTOR_PWM|LessThan1~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \U_MOTOR_PWM|LessThan1~34_combout\ = (!\U_MOTOR_PWM|counter\(19) & (!\U_MOTOR_PWM|counter\(18) & (!\U_MOTOR_PWM|counter\(17) & \U_MOTOR_PWM|LessThan1~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MOTOR_PWM|counter\(19),
	datab => \U_MOTOR_PWM|counter\(18),
	datac => \U_MOTOR_PWM|counter\(17),
	datad => \U_MOTOR_PWM|LessThan1~32_combout\,
	combout => \U_MOTOR_PWM|LessThan1~34_combout\);

-- Location: FF_X10_Y11_N23
\U_MOTOR_PWM|pwm\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U_MOTOR_PWM|LessThan1~34_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_MOTOR_PWM|pwm~q\);

-- Location: LCCOMB_X20_Y10_N20
\servo_motor_02~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \servo_motor_02~0_combout\ = (\estado_motor_02.MOTOR_GIRANDO~q\ & \U_MOTOR_PWM|pwm~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \estado_motor_02.MOTOR_GIRANDO~q\,
	datad => \U_MOTOR_PWM|pwm~q\,
	combout => \servo_motor_02~0_combout\);

-- Location: IOIBUF_X21_Y29_N22
\activar_motor_30~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_activar_motor_30,
	o => \activar_motor_30~input_o\);

-- Location: LCCOMB_X22_Y27_N16
\Selector141~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector141~0_combout\ = (\estado_motor_30.MOTOR_GIRANDO~q\) # ((\entrega_completada~input_o\ & \estado_motor_30.MOTOR_ESPERANDO~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \entrega_completada~input_o\,
	datac => \estado_motor_30.MOTOR_GIRANDO~q\,
	datad => \estado_motor_30.MOTOR_ESPERANDO~q\,
	combout => \Selector141~0_combout\);

-- Location: LCCOMB_X17_Y23_N2
\Add9~56\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~56_combout\ = (!\entrega_completada~input_o\ & (!\LessThan10~6_combout\ & \estado_motor_30.MOTOR_ESPERANDO~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \entrega_completada~input_o\,
	datac => \LessThan10~6_combout\,
	datad => \estado_motor_30.MOTOR_ESPERANDO~q\,
	combout => \Add9~56_combout\);

-- Location: LCCOMB_X16_Y24_N4
\Add9~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~0_combout\ = contador_3seg_30(0) $ (VCC)
-- \Add9~1\ = CARRY(contador_3seg_30(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(0),
	datad => VCC,
	combout => \Add9~0_combout\,
	cout => \Add9~1\);

-- Location: LCCOMB_X16_Y24_N2
\Selector167~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector167~0_combout\ = (\Selector141~0_combout\ & ((contador_3seg_30(0)) # ((\Add9~0_combout\ & \Add9~56_combout\)))) # (!\Selector141~0_combout\ & (\Add9~0_combout\ & ((\Add9~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector141~0_combout\,
	datab => \Add9~0_combout\,
	datac => contador_3seg_30(0),
	datad => \Add9~56_combout\,
	combout => \Selector167~0_combout\);

-- Location: FF_X16_Y24_N3
\contador_3seg_30[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector167~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(0));

-- Location: LCCOMB_X16_Y24_N6
\Add9~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~2_combout\ = (contador_3seg_30(1) & (!\Add9~1\)) # (!contador_3seg_30(1) & ((\Add9~1\) # (GND)))
-- \Add9~3\ = CARRY((!\Add9~1\) # (!contador_3seg_30(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(1),
	datad => VCC,
	cin => \Add9~1\,
	combout => \Add9~2_combout\,
	cout => \Add9~3\);

-- Location: LCCOMB_X16_Y24_N0
\Selector166~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector166~0_combout\ = (\Selector141~0_combout\ & ((contador_3seg_30(1)) # ((\Add9~2_combout\ & \Add9~56_combout\)))) # (!\Selector141~0_combout\ & (\Add9~2_combout\ & ((\Add9~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector141~0_combout\,
	datab => \Add9~2_combout\,
	datac => contador_3seg_30(1),
	datad => \Add9~56_combout\,
	combout => \Selector166~0_combout\);

-- Location: FF_X16_Y24_N1
\contador_3seg_30[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector166~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(1));

-- Location: LCCOMB_X16_Y24_N8
\Add9~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~4_combout\ = (contador_3seg_30(2) & (\Add9~3\ $ (GND))) # (!contador_3seg_30(2) & (!\Add9~3\ & VCC))
-- \Add9~5\ = CARRY((contador_3seg_30(2) & !\Add9~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(2),
	datad => VCC,
	cin => \Add9~3\,
	combout => \Add9~4_combout\,
	cout => \Add9~5\);

-- Location: LCCOMB_X17_Y24_N6
\Selector165~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector165~0_combout\ = (\Add9~4_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(2))))) # (!\Add9~4_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~4_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(2),
	datad => \Add9~56_combout\,
	combout => \Selector165~0_combout\);

-- Location: FF_X17_Y24_N7
\contador_3seg_30[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector165~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(2));

-- Location: LCCOMB_X16_Y24_N10
\Add9~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~6_combout\ = (contador_3seg_30(3) & (!\Add9~5\)) # (!contador_3seg_30(3) & ((\Add9~5\) # (GND)))
-- \Add9~7\ = CARRY((!\Add9~5\) # (!contador_3seg_30(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(3),
	datad => VCC,
	cin => \Add9~5\,
	combout => \Add9~6_combout\,
	cout => \Add9~7\);

-- Location: LCCOMB_X17_Y24_N20
\Selector164~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector164~0_combout\ = (\Add9~6_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(3))))) # (!\Add9~6_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~6_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(3),
	datad => \Add9~56_combout\,
	combout => \Selector164~0_combout\);

-- Location: FF_X17_Y24_N21
\contador_3seg_30[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector164~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(3));

-- Location: LCCOMB_X16_Y24_N12
\Add9~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~8_combout\ = (contador_3seg_30(4) & (\Add9~7\ $ (GND))) # (!contador_3seg_30(4) & (!\Add9~7\ & VCC))
-- \Add9~9\ = CARRY((contador_3seg_30(4) & !\Add9~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(4),
	datad => VCC,
	cin => \Add9~7\,
	combout => \Add9~8_combout\,
	cout => \Add9~9\);

-- Location: LCCOMB_X17_Y24_N10
\Selector163~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector163~0_combout\ = (\Add9~8_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(4))))) # (!\Add9~8_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~8_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(4),
	datad => \Add9~56_combout\,
	combout => \Selector163~0_combout\);

-- Location: FF_X17_Y24_N11
\contador_3seg_30[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector163~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(4));

-- Location: LCCOMB_X16_Y24_N14
\Add9~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~10_combout\ = (contador_3seg_30(5) & (!\Add9~9\)) # (!contador_3seg_30(5) & ((\Add9~9\) # (GND)))
-- \Add9~11\ = CARRY((!\Add9~9\) # (!contador_3seg_30(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(5),
	datad => VCC,
	cin => \Add9~9\,
	combout => \Add9~10_combout\,
	cout => \Add9~11\);

-- Location: LCCOMB_X17_Y23_N0
\Selector162~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector162~0_combout\ = (\Add9~10_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(5))))) # (!\Add9~10_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~10_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(5),
	datad => \Add9~56_combout\,
	combout => \Selector162~0_combout\);

-- Location: FF_X17_Y23_N1
\contador_3seg_30[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector162~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(5));

-- Location: LCCOMB_X16_Y24_N16
\Add9~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~12_combout\ = (contador_3seg_30(6) & (\Add9~11\ $ (GND))) # (!contador_3seg_30(6) & (!\Add9~11\ & VCC))
-- \Add9~13\ = CARRY((contador_3seg_30(6) & !\Add9~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(6),
	datad => VCC,
	cin => \Add9~11\,
	combout => \Add9~12_combout\,
	cout => \Add9~13\);

-- Location: LCCOMB_X17_Y24_N8
\Selector161~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector161~0_combout\ = (\Add9~12_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(6))))) # (!\Add9~12_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~12_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(6),
	datad => \Add9~56_combout\,
	combout => \Selector161~0_combout\);

-- Location: FF_X17_Y24_N9
\contador_3seg_30[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector161~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(6));

-- Location: LCCOMB_X16_Y24_N18
\Add9~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~14_combout\ = (contador_3seg_30(7) & (!\Add9~13\)) # (!contador_3seg_30(7) & ((\Add9~13\) # (GND)))
-- \Add9~15\ = CARRY((!\Add9~13\) # (!contador_3seg_30(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(7),
	datad => VCC,
	cin => \Add9~13\,
	combout => \Add9~14_combout\,
	cout => \Add9~15\);

-- Location: LCCOMB_X17_Y24_N16
\Selector160~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector160~0_combout\ = (\Add9~14_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(7))))) # (!\Add9~14_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~14_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(7),
	datad => \Add9~56_combout\,
	combout => \Selector160~0_combout\);

-- Location: FF_X17_Y24_N17
\contador_3seg_30[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector160~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(7));

-- Location: LCCOMB_X16_Y24_N20
\Add9~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~16_combout\ = (contador_3seg_30(8) & (\Add9~15\ $ (GND))) # (!contador_3seg_30(8) & (!\Add9~15\ & VCC))
-- \Add9~17\ = CARRY((contador_3seg_30(8) & !\Add9~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(8),
	datad => VCC,
	cin => \Add9~15\,
	combout => \Add9~16_combout\,
	cout => \Add9~17\);

-- Location: LCCOMB_X17_Y24_N18
\Selector159~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector159~0_combout\ = (\Add9~56_combout\ & ((\Add9~16_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(8))))) # (!\Add9~56_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~56_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(8),
	datad => \Add9~16_combout\,
	combout => \Selector159~0_combout\);

-- Location: FF_X17_Y24_N19
\contador_3seg_30[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector159~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(8));

-- Location: LCCOMB_X16_Y24_N22
\Add9~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~18_combout\ = (contador_3seg_30(9) & (!\Add9~17\)) # (!contador_3seg_30(9) & ((\Add9~17\) # (GND)))
-- \Add9~19\ = CARRY((!\Add9~17\) # (!contador_3seg_30(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(9),
	datad => VCC,
	cin => \Add9~17\,
	combout => \Add9~18_combout\,
	cout => \Add9~19\);

-- Location: LCCOMB_X17_Y24_N12
\Selector158~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector158~0_combout\ = (\Add9~18_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(9))))) # (!\Add9~18_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~18_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(9),
	datad => \Add9~56_combout\,
	combout => \Selector158~0_combout\);

-- Location: FF_X17_Y24_N13
\contador_3seg_30[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector158~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(9));

-- Location: LCCOMB_X16_Y24_N24
\Add9~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~20_combout\ = (contador_3seg_30(10) & (\Add9~19\ $ (GND))) # (!contador_3seg_30(10) & (!\Add9~19\ & VCC))
-- \Add9~21\ = CARRY((contador_3seg_30(10) & !\Add9~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(10),
	datad => VCC,
	cin => \Add9~19\,
	combout => \Add9~20_combout\,
	cout => \Add9~21\);

-- Location: LCCOMB_X17_Y24_N4
\Selector157~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector157~0_combout\ = (\Add9~20_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(10))))) # (!\Add9~20_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~20_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(10),
	datad => \Add9~56_combout\,
	combout => \Selector157~0_combout\);

-- Location: FF_X17_Y24_N5
\contador_3seg_30[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector157~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(10));

-- Location: LCCOMB_X16_Y24_N26
\Add9~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~22_combout\ = (contador_3seg_30(11) & (!\Add9~21\)) # (!contador_3seg_30(11) & ((\Add9~21\) # (GND)))
-- \Add9~23\ = CARRY((!\Add9~21\) # (!contador_3seg_30(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(11),
	datad => VCC,
	cin => \Add9~21\,
	combout => \Add9~22_combout\,
	cout => \Add9~23\);

-- Location: LCCOMB_X17_Y24_N26
\Selector156~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector156~0_combout\ = (\Add9~22_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(11))))) # (!\Add9~22_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~22_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(11),
	datad => \Add9~56_combout\,
	combout => \Selector156~0_combout\);

-- Location: FF_X17_Y24_N27
\contador_3seg_30[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector156~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(11));

-- Location: LCCOMB_X16_Y24_N28
\Add9~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~24_combout\ = (contador_3seg_30(12) & (\Add9~23\ $ (GND))) # (!contador_3seg_30(12) & (!\Add9~23\ & VCC))
-- \Add9~25\ = CARRY((contador_3seg_30(12) & !\Add9~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(12),
	datad => VCC,
	cin => \Add9~23\,
	combout => \Add9~24_combout\,
	cout => \Add9~25\);

-- Location: LCCOMB_X17_Y24_N14
\Selector155~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector155~0_combout\ = (\Add9~24_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(12))))) # (!\Add9~24_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~24_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(12),
	datad => \Add9~56_combout\,
	combout => \Selector155~0_combout\);

-- Location: FF_X17_Y24_N15
\contador_3seg_30[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector155~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(12));

-- Location: LCCOMB_X16_Y24_N30
\Add9~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~26_combout\ = (contador_3seg_30(13) & (!\Add9~25\)) # (!contador_3seg_30(13) & ((\Add9~25\) # (GND)))
-- \Add9~27\ = CARRY((!\Add9~25\) # (!contador_3seg_30(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(13),
	datad => VCC,
	cin => \Add9~25\,
	combout => \Add9~26_combout\,
	cout => \Add9~27\);

-- Location: LCCOMB_X17_Y24_N28
\Selector154~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector154~0_combout\ = (\Add9~56_combout\ & ((\Add9~26_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(13))))) # (!\Add9~56_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~56_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(13),
	datad => \Add9~26_combout\,
	combout => \Selector154~0_combout\);

-- Location: FF_X17_Y24_N29
\contador_3seg_30[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector154~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(13));

-- Location: LCCOMB_X16_Y23_N0
\Add9~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~28_combout\ = (contador_3seg_30(14) & (\Add9~27\ $ (GND))) # (!contador_3seg_30(14) & (!\Add9~27\ & VCC))
-- \Add9~29\ = CARRY((contador_3seg_30(14) & !\Add9~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(14),
	datad => VCC,
	cin => \Add9~27\,
	combout => \Add9~28_combout\,
	cout => \Add9~29\);

-- Location: LCCOMB_X17_Y23_N6
\Selector153~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector153~0_combout\ = (\Add9~28_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(14))))) # (!\Add9~28_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~28_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(14),
	datad => \Add9~56_combout\,
	combout => \Selector153~0_combout\);

-- Location: FF_X17_Y23_N7
\contador_3seg_30[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector153~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(14));

-- Location: LCCOMB_X16_Y23_N2
\Add9~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~30_combout\ = (contador_3seg_30(15) & (!\Add9~29\)) # (!contador_3seg_30(15) & ((\Add9~29\) # (GND)))
-- \Add9~31\ = CARRY((!\Add9~29\) # (!contador_3seg_30(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(15),
	datad => VCC,
	cin => \Add9~29\,
	combout => \Add9~30_combout\,
	cout => \Add9~31\);

-- Location: LCCOMB_X17_Y23_N4
\Selector152~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector152~0_combout\ = (\Add9~30_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(15))))) # (!\Add9~30_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~30_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(15),
	datad => \Add9~56_combout\,
	combout => \Selector152~0_combout\);

-- Location: FF_X17_Y23_N5
\contador_3seg_30[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector152~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(15));

-- Location: LCCOMB_X16_Y23_N4
\Add9~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~32_combout\ = (contador_3seg_30(16) & (\Add9~31\ $ (GND))) # (!contador_3seg_30(16) & (!\Add9~31\ & VCC))
-- \Add9~33\ = CARRY((contador_3seg_30(16) & !\Add9~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(16),
	datad => VCC,
	cin => \Add9~31\,
	combout => \Add9~32_combout\,
	cout => \Add9~33\);

-- Location: LCCOMB_X17_Y23_N24
\Selector151~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector151~0_combout\ = (\Add9~32_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(16))))) # (!\Add9~32_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~32_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(16),
	datad => \Add9~56_combout\,
	combout => \Selector151~0_combout\);

-- Location: FF_X17_Y23_N25
\contador_3seg_30[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector151~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(16));

-- Location: LCCOMB_X16_Y23_N6
\Add9~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~34_combout\ = (contador_3seg_30(17) & (!\Add9~33\)) # (!contador_3seg_30(17) & ((\Add9~33\) # (GND)))
-- \Add9~35\ = CARRY((!\Add9~33\) # (!contador_3seg_30(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(17),
	datad => VCC,
	cin => \Add9~33\,
	combout => \Add9~34_combout\,
	cout => \Add9~35\);

-- Location: LCCOMB_X17_Y23_N26
\Selector150~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector150~0_combout\ = (\Selector141~0_combout\ & ((contador_3seg_30(17)) # ((\Add9~34_combout\ & \Add9~56_combout\)))) # (!\Selector141~0_combout\ & (\Add9~34_combout\ & ((\Add9~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector141~0_combout\,
	datab => \Add9~34_combout\,
	datac => contador_3seg_30(17),
	datad => \Add9~56_combout\,
	combout => \Selector150~0_combout\);

-- Location: FF_X17_Y23_N27
\contador_3seg_30[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector150~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(17));

-- Location: LCCOMB_X16_Y23_N8
\Add9~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~36_combout\ = (contador_3seg_30(18) & (\Add9~35\ $ (GND))) # (!contador_3seg_30(18) & (!\Add9~35\ & VCC))
-- \Add9~37\ = CARRY((contador_3seg_30(18) & !\Add9~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(18),
	datad => VCC,
	cin => \Add9~35\,
	combout => \Add9~36_combout\,
	cout => \Add9~37\);

-- Location: LCCOMB_X17_Y23_N12
\Selector149~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector149~0_combout\ = (\Add9~36_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(18))))) # (!\Add9~36_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~36_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(18),
	datad => \Add9~56_combout\,
	combout => \Selector149~0_combout\);

-- Location: FF_X17_Y23_N13
\contador_3seg_30[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector149~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(18));

-- Location: LCCOMB_X16_Y23_N10
\Add9~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~38_combout\ = (contador_3seg_30(19) & (!\Add9~37\)) # (!contador_3seg_30(19) & ((\Add9~37\) # (GND)))
-- \Add9~39\ = CARRY((!\Add9~37\) # (!contador_3seg_30(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(19),
	datad => VCC,
	cin => \Add9~37\,
	combout => \Add9~38_combout\,
	cout => \Add9~39\);

-- Location: LCCOMB_X17_Y23_N30
\Selector148~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector148~0_combout\ = (\Add9~38_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(19))))) # (!\Add9~38_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~38_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(19),
	datad => \Add9~56_combout\,
	combout => \Selector148~0_combout\);

-- Location: FF_X17_Y23_N31
\contador_3seg_30[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector148~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(19));

-- Location: LCCOMB_X16_Y23_N12
\Add9~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~40_combout\ = (contador_3seg_30(20) & (\Add9~39\ $ (GND))) # (!contador_3seg_30(20) & (!\Add9~39\ & VCC))
-- \Add9~41\ = CARRY((contador_3seg_30(20) & !\Add9~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(20),
	datad => VCC,
	cin => \Add9~39\,
	combout => \Add9~40_combout\,
	cout => \Add9~41\);

-- Location: LCCOMB_X17_Y23_N10
\Selector147~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector147~0_combout\ = (\Add9~40_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(20))))) # (!\Add9~40_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~40_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(20),
	datad => \Add9~56_combout\,
	combout => \Selector147~0_combout\);

-- Location: FF_X17_Y23_N11
\contador_3seg_30[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector147~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(20));

-- Location: LCCOMB_X16_Y23_N14
\Add9~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~42_combout\ = (contador_3seg_30(21) & (!\Add9~41\)) # (!contador_3seg_30(21) & ((\Add9~41\) # (GND)))
-- \Add9~43\ = CARRY((!\Add9~41\) # (!contador_3seg_30(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(21),
	datad => VCC,
	cin => \Add9~41\,
	combout => \Add9~42_combout\,
	cout => \Add9~43\);

-- Location: LCCOMB_X17_Y23_N20
\Selector146~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector146~0_combout\ = (\Add9~42_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(21))))) # (!\Add9~42_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~42_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(21),
	datad => \Add9~56_combout\,
	combout => \Selector146~0_combout\);

-- Location: FF_X17_Y23_N21
\contador_3seg_30[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector146~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(21));

-- Location: LCCOMB_X16_Y23_N16
\Add9~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~44_combout\ = (contador_3seg_30(22) & (\Add9~43\ $ (GND))) # (!contador_3seg_30(22) & (!\Add9~43\ & VCC))
-- \Add9~45\ = CARRY((contador_3seg_30(22) & !\Add9~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(22),
	datad => VCC,
	cin => \Add9~43\,
	combout => \Add9~44_combout\,
	cout => \Add9~45\);

-- Location: LCCOMB_X17_Y23_N14
\Selector145~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector145~0_combout\ = (\Add9~44_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(22))))) # (!\Add9~44_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~44_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(22),
	datad => \Add9~56_combout\,
	combout => \Selector145~0_combout\);

-- Location: FF_X17_Y23_N15
\contador_3seg_30[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector145~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(22));

-- Location: LCCOMB_X16_Y23_N18
\Add9~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~46_combout\ = (contador_3seg_30(23) & (!\Add9~45\)) # (!contador_3seg_30(23) & ((\Add9~45\) # (GND)))
-- \Add9~47\ = CARRY((!\Add9~45\) # (!contador_3seg_30(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(23),
	datad => VCC,
	cin => \Add9~45\,
	combout => \Add9~46_combout\,
	cout => \Add9~47\);

-- Location: LCCOMB_X17_Y23_N28
\Selector144~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector144~0_combout\ = (\Selector141~0_combout\ & ((contador_3seg_30(23)) # ((\Add9~56_combout\ & \Add9~46_combout\)))) # (!\Selector141~0_combout\ & (\Add9~56_combout\ & ((\Add9~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector141~0_combout\,
	datab => \Add9~56_combout\,
	datac => contador_3seg_30(23),
	datad => \Add9~46_combout\,
	combout => \Selector144~0_combout\);

-- Location: FF_X17_Y23_N29
\contador_3seg_30[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector144~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(23));

-- Location: LCCOMB_X17_Y23_N8
\LessThan10~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan10~1_combout\ = (contador_3seg_30(20) & (contador_3seg_30(23) & (contador_3seg_30(22) & contador_3seg_30(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(20),
	datab => contador_3seg_30(23),
	datac => contador_3seg_30(22),
	datad => contador_3seg_30(21),
	combout => \LessThan10~1_combout\);

-- Location: LCCOMB_X16_Y23_N20
\Add9~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~48_combout\ = (contador_3seg_30(24) & (\Add9~47\ $ (GND))) # (!contador_3seg_30(24) & (!\Add9~47\ & VCC))
-- \Add9~49\ = CARRY((contador_3seg_30(24) & !\Add9~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(24),
	datad => VCC,
	cin => \Add9~47\,
	combout => \Add9~48_combout\,
	cout => \Add9~49\);

-- Location: LCCOMB_X17_Y24_N22
\Selector143~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector143~0_combout\ = (\Add9~56_combout\ & ((\Add9~48_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(24))))) # (!\Add9~56_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~56_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(24),
	datad => \Add9~48_combout\,
	combout => \Selector143~0_combout\);

-- Location: FF_X17_Y24_N23
\contador_3seg_30[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector143~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(24));

-- Location: LCCOMB_X16_Y23_N22
\Add9~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~50_combout\ = (contador_3seg_30(25) & (!\Add9~49\)) # (!contador_3seg_30(25) & ((\Add9~49\) # (GND)))
-- \Add9~51\ = CARRY((!\Add9~49\) # (!contador_3seg_30(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_3seg_30(25),
	datad => VCC,
	cin => \Add9~49\,
	combout => \Add9~50_combout\,
	cout => \Add9~51\);

-- Location: LCCOMB_X17_Y24_N0
\Selector142~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector142~0_combout\ = (\Add9~56_combout\ & ((\Add9~50_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(25))))) # (!\Add9~56_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~56_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(25),
	datad => \Add9~50_combout\,
	combout => \Selector142~0_combout\);

-- Location: FF_X17_Y24_N1
\contador_3seg_30[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector142~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(25));

-- Location: LCCOMB_X16_Y23_N24
\Add9~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~52_combout\ = (contador_3seg_30(26) & (\Add9~51\ $ (GND))) # (!contador_3seg_30(26) & (!\Add9~51\ & VCC))
-- \Add9~53\ = CARRY((contador_3seg_30(26) & !\Add9~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(26),
	datad => VCC,
	cin => \Add9~51\,
	combout => \Add9~52_combout\,
	cout => \Add9~53\);

-- Location: LCCOMB_X16_Y23_N30
\Selector141~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector141~1_combout\ = (\Add9~56_combout\ & ((\Add9~52_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(26))))) # (!\Add9~56_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~56_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(26),
	datad => \Add9~52_combout\,
	combout => \Selector141~1_combout\);

-- Location: FF_X16_Y23_N31
\contador_3seg_30[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector141~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(26));

-- Location: LCCOMB_X16_Y23_N26
\Add9~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add9~54_combout\ = \Add9~53\ $ (contador_3seg_30(27))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => contador_3seg_30(27),
	cin => \Add9~53\,
	combout => \Add9~54_combout\);

-- Location: LCCOMB_X16_Y23_N28
\Selector140~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector140~0_combout\ = (\Add9~54_combout\ & ((\Add9~56_combout\) # ((\Selector141~0_combout\ & contador_3seg_30(27))))) # (!\Add9~54_combout\ & (\Selector141~0_combout\ & (contador_3seg_30(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~54_combout\,
	datab => \Selector141~0_combout\,
	datac => contador_3seg_30(27),
	datad => \Add9~56_combout\,
	combout => \Selector140~0_combout\);

-- Location: FF_X16_Y23_N29
\contador_3seg_30[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector140~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_3seg_30(27));

-- Location: LCCOMB_X17_Y24_N24
\LessThan10~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan10~0_combout\ = (contador_3seg_30(24)) # ((contador_3seg_30(26)) # (contador_3seg_30(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(24),
	datac => contador_3seg_30(26),
	datad => contador_3seg_30(25),
	combout => \LessThan10~0_combout\);

-- Location: LCCOMB_X17_Y24_N2
\LessThan10~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan10~3_combout\ = (!contador_3seg_30(11) & (!contador_3seg_30(10) & ((!contador_3seg_30(8)) # (!contador_3seg_30(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(11),
	datab => contador_3seg_30(7),
	datac => contador_3seg_30(10),
	datad => contador_3seg_30(8),
	combout => \LessThan10~3_combout\);

-- Location: LCCOMB_X17_Y24_N30
\LessThan10~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan10~4_combout\ = (!contador_3seg_30(13) & (((!contador_3seg_30(9) & \LessThan10~3_combout\)) # (!contador_3seg_30(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(9),
	datab => contador_3seg_30(13),
	datac => contador_3seg_30(12),
	datad => \LessThan10~3_combout\,
	combout => \LessThan10~4_combout\);

-- Location: LCCOMB_X17_Y23_N18
\LessThan10~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan10~2_combout\ = (!contador_3seg_30(17) & (!contador_3seg_30(16) & (!contador_3seg_30(19) & !contador_3seg_30(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(17),
	datab => contador_3seg_30(16),
	datac => contador_3seg_30(19),
	datad => contador_3seg_30(18),
	combout => \LessThan10~2_combout\);

-- Location: LCCOMB_X17_Y23_N16
\LessThan10~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan10~5_combout\ = (\LessThan10~2_combout\ & (((\LessThan10~4_combout\) # (!contador_3seg_30(15))) # (!contador_3seg_30(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_3seg_30(14),
	datab => contador_3seg_30(15),
	datac => \LessThan10~4_combout\,
	datad => \LessThan10~2_combout\,
	combout => \LessThan10~5_combout\);

-- Location: LCCOMB_X17_Y23_N22
\LessThan10~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan10~6_combout\ = (contador_3seg_30(27) & ((\LessThan10~0_combout\) # ((\LessThan10~1_combout\ & !\LessThan10~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan10~1_combout\,
	datab => contador_3seg_30(27),
	datac => \LessThan10~0_combout\,
	datad => \LessThan10~5_combout\,
	combout => \LessThan10~6_combout\);

-- Location: LCCOMB_X22_Y27_N8
\Selector168~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector168~0_combout\ = (\Selector169~4_combout\) # ((\estado_motor_30.MOTOR_ESPERANDO~q\ & ((\entrega_completada~input_o\) # (\LessThan10~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrega_completada~input_o\,
	datab => \estado_motor_30.MOTOR_ESPERANDO~q\,
	datac => \Selector169~4_combout\,
	datad => \LessThan10~6_combout\,
	combout => \Selector168~0_combout\);

-- Location: LCCOMB_X22_Y27_N6
\Selector168~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector168~1_combout\ = (\entrega_completada~input_o\ & ((\Selector168~0_combout\ & ((\Selector169~5_combout\))) # (!\Selector168~0_combout\ & (\estado_motor_30.MOTOR_GIRANDO~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_motor_30.MOTOR_GIRANDO~q\,
	datab => \entrega_completada~input_o\,
	datac => \Selector168~0_combout\,
	datad => \Selector169~5_combout\,
	combout => \Selector168~1_combout\);

-- Location: LCCOMB_X22_Y27_N12
\Selector168~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector168~2_combout\ = (!\Selector168~1_combout\ & ((\Selector169~5_combout\) # ((\estado_motor_30.MOTOR_APAGADO~q\) # (!\Selector168~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector169~5_combout\,
	datab => \Selector168~0_combout\,
	datac => \estado_motor_30.MOTOR_APAGADO~q\,
	datad => \Selector168~1_combout\,
	combout => \Selector168~2_combout\);

-- Location: FF_X22_Y27_N13
\estado_motor_30.MOTOR_APAGADO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector168~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_motor_30.MOTOR_APAGADO~q\);

-- Location: LCCOMB_X22_Y27_N18
\Selector169~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector169~3_combout\ = (\estado_motor_30.MOTOR_GIRANDO~q\ & !\Selector169~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \estado_motor_30.MOTOR_GIRANDO~q\,
	datad => \Selector169~2_combout\,
	combout => \Selector169~3_combout\);

-- Location: LCCOMB_X22_Y27_N4
\Selector169~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector169~4_combout\ = (!\Selector169~3_combout\ & (((\entrega_completada~input_o\) # (\estado_motor_30.MOTOR_APAGADO~q\)) # (!\activar_motor_30~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \activar_motor_30~input_o\,
	datab => \entrega_completada~input_o\,
	datac => \estado_motor_30.MOTOR_APAGADO~q\,
	datad => \Selector169~3_combout\,
	combout => \Selector169~4_combout\);

-- Location: LCCOMB_X22_Y27_N10
\Selector169~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector169~5_combout\ = ((\estado_motor_30.MOTOR_ESPERANDO~q\ & ((\entrega_completada~input_o\) # (\LessThan10~6_combout\)))) # (!\Selector169~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrega_completada~input_o\,
	datab => \estado_motor_30.MOTOR_ESPERANDO~q\,
	datac => \Selector169~4_combout\,
	datad => \LessThan10~6_combout\,
	combout => \Selector169~5_combout\);

-- Location: LCCOMB_X22_Y27_N26
\Selector170~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector170~0_combout\ = (\estado_motor_30.MOTOR_GIRANDO~q\ & (!\entrega_completada~input_o\ & !\Selector169~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_motor_30.MOTOR_GIRANDO~q\,
	datab => \entrega_completada~input_o\,
	datad => \Selector169~2_combout\,
	combout => \Selector170~0_combout\);

-- Location: LCCOMB_X22_Y27_N30
\Selector170~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector170~1_combout\ = (\Selector169~5_combout\ & (\Selector170~0_combout\ & ((!\Selector168~0_combout\)))) # (!\Selector169~5_combout\ & ((\estado_motor_30.MOTOR_ESPERANDO~q\) # ((\Selector170~0_combout\ & !\Selector168~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector169~5_combout\,
	datab => \Selector170~0_combout\,
	datac => \estado_motor_30.MOTOR_ESPERANDO~q\,
	datad => \Selector168~0_combout\,
	combout => \Selector170~1_combout\);

-- Location: FF_X22_Y27_N31
\estado_motor_30.MOTOR_ESPERANDO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector170~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_motor_30.MOTOR_ESPERANDO~q\);

-- Location: LCCOMB_X19_Y27_N0
\Selector114~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector114~0_combout\ = (\estado_motor_30.MOTOR_ESPERANDO~q\) # ((\estado_motor_30.MOTOR_GIRANDO~q\ & \entrega_completada~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_motor_30.MOTOR_GIRANDO~q\,
	datab => \estado_motor_30.MOTOR_ESPERANDO~q\,
	datac => \entrega_completada~input_o\,
	combout => \Selector114~0_combout\);

-- Location: LCCOMB_X22_Y27_N0
\Add8~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~54_combout\ = (\estado_motor_30.MOTOR_GIRANDO~q\ & \Selector169~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \estado_motor_30.MOTOR_GIRANDO~q\,
	datad => \Selector169~2_combout\,
	combout => \Add8~54_combout\);

-- Location: LCCOMB_X20_Y28_N4
\Add8~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~0_combout\ = contador_4seg_30(0) $ (VCC)
-- \Add8~1\ = CARRY(contador_4seg_30(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(0),
	datad => VCC,
	combout => \Add8~0_combout\,
	cout => \Add8~1\);

-- Location: LCCOMB_X20_Y28_N2
\Selector139~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector139~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(0)) # ((\Add8~0_combout\ & \Add8~54_combout\)))) # (!\Selector114~0_combout\ & (\Add8~0_combout\ & ((\Add8~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~0_combout\,
	datac => contador_4seg_30(0),
	datad => \Add8~54_combout\,
	combout => \Selector139~0_combout\);

-- Location: FF_X20_Y28_N3
\contador_4seg_30[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector139~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(0));

-- Location: LCCOMB_X20_Y28_N6
\Add8~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~2_combout\ = (contador_4seg_30(1) & (!\Add8~1\)) # (!contador_4seg_30(1) & ((\Add8~1\) # (GND)))
-- \Add8~3\ = CARRY((!\Add8~1\) # (!contador_4seg_30(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(1),
	datad => VCC,
	cin => \Add8~1\,
	combout => \Add8~2_combout\,
	cout => \Add8~3\);

-- Location: LCCOMB_X21_Y28_N18
\Selector138~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector138~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(1)) # ((\Add8~2_combout\ & \Add8~54_combout\)))) # (!\Selector114~0_combout\ & (\Add8~2_combout\ & ((\Add8~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~2_combout\,
	datac => contador_4seg_30(1),
	datad => \Add8~54_combout\,
	combout => \Selector138~0_combout\);

-- Location: FF_X21_Y28_N19
\contador_4seg_30[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector138~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(1));

-- Location: LCCOMB_X20_Y28_N8
\Add8~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~4_combout\ = (contador_4seg_30(2) & (\Add8~3\ $ (GND))) # (!contador_4seg_30(2) & (!\Add8~3\ & VCC))
-- \Add8~5\ = CARRY((contador_4seg_30(2) & !\Add8~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(2),
	datad => VCC,
	cin => \Add8~3\,
	combout => \Add8~4_combout\,
	cout => \Add8~5\);

-- Location: LCCOMB_X21_Y28_N16
\Selector137~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector137~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(2)) # ((\Add8~4_combout\ & \Add8~54_combout\)))) # (!\Selector114~0_combout\ & (\Add8~4_combout\ & ((\Add8~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~4_combout\,
	datac => contador_4seg_30(2),
	datad => \Add8~54_combout\,
	combout => \Selector137~0_combout\);

-- Location: FF_X21_Y28_N17
\contador_4seg_30[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector137~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(2));

-- Location: LCCOMB_X20_Y28_N10
\Add8~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~6_combout\ = (contador_4seg_30(3) & (!\Add8~5\)) # (!contador_4seg_30(3) & ((\Add8~5\) # (GND)))
-- \Add8~7\ = CARRY((!\Add8~5\) # (!contador_4seg_30(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(3),
	datad => VCC,
	cin => \Add8~5\,
	combout => \Add8~6_combout\,
	cout => \Add8~7\);

-- Location: LCCOMB_X20_Y28_N0
\Selector136~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector136~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(3)) # ((\Add8~6_combout\ & \Add8~54_combout\)))) # (!\Selector114~0_combout\ & (\Add8~6_combout\ & ((\Add8~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~6_combout\,
	datac => contador_4seg_30(3),
	datad => \Add8~54_combout\,
	combout => \Selector136~0_combout\);

-- Location: FF_X20_Y28_N1
\contador_4seg_30[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector136~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(3));

-- Location: LCCOMB_X20_Y28_N12
\Add8~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~8_combout\ = (contador_4seg_30(4) & (\Add8~7\ $ (GND))) # (!contador_4seg_30(4) & (!\Add8~7\ & VCC))
-- \Add8~9\ = CARRY((contador_4seg_30(4) & !\Add8~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(4),
	datad => VCC,
	cin => \Add8~7\,
	combout => \Add8~8_combout\,
	cout => \Add8~9\);

-- Location: LCCOMB_X21_Y28_N26
\Selector135~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector135~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(4)) # ((\Add8~8_combout\ & \Add8~54_combout\)))) # (!\Selector114~0_combout\ & (\Add8~8_combout\ & ((\Add8~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~8_combout\,
	datac => contador_4seg_30(4),
	datad => \Add8~54_combout\,
	combout => \Selector135~0_combout\);

-- Location: FF_X21_Y28_N27
\contador_4seg_30[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector135~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(4));

-- Location: LCCOMB_X20_Y28_N14
\Add8~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~10_combout\ = (contador_4seg_30(5) & (!\Add8~9\)) # (!contador_4seg_30(5) & ((\Add8~9\) # (GND)))
-- \Add8~11\ = CARRY((!\Add8~9\) # (!contador_4seg_30(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(5),
	datad => VCC,
	cin => \Add8~9\,
	combout => \Add8~10_combout\,
	cout => \Add8~11\);

-- Location: LCCOMB_X21_Y28_N28
\Selector134~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector134~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(5)) # ((\Add8~10_combout\ & \Add8~54_combout\)))) # (!\Selector114~0_combout\ & (\Add8~10_combout\ & ((\Add8~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~10_combout\,
	datac => contador_4seg_30(5),
	datad => \Add8~54_combout\,
	combout => \Selector134~0_combout\);

-- Location: FF_X21_Y28_N29
\contador_4seg_30[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector134~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(5));

-- Location: LCCOMB_X20_Y28_N16
\Add8~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~12_combout\ = (contador_4seg_30(6) & (\Add8~11\ $ (GND))) # (!contador_4seg_30(6) & (!\Add8~11\ & VCC))
-- \Add8~13\ = CARRY((contador_4seg_30(6) & !\Add8~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(6),
	datad => VCC,
	cin => \Add8~11\,
	combout => \Add8~12_combout\,
	cout => \Add8~13\);

-- Location: LCCOMB_X21_Y28_N6
\Selector133~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector133~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(6)) # ((\Add8~12_combout\ & \Add8~54_combout\)))) # (!\Selector114~0_combout\ & (\Add8~12_combout\ & ((\Add8~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~12_combout\,
	datac => contador_4seg_30(6),
	datad => \Add8~54_combout\,
	combout => \Selector133~0_combout\);

-- Location: FF_X21_Y28_N7
\contador_4seg_30[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector133~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(6));

-- Location: LCCOMB_X20_Y28_N18
\Add8~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~14_combout\ = (contador_4seg_30(7) & (!\Add8~13\)) # (!contador_4seg_30(7) & ((\Add8~13\) # (GND)))
-- \Add8~15\ = CARRY((!\Add8~13\) # (!contador_4seg_30(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(7),
	datad => VCC,
	cin => \Add8~13\,
	combout => \Add8~14_combout\,
	cout => \Add8~15\);

-- Location: LCCOMB_X21_Y28_N0
\Selector132~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector132~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(7)) # ((\Add8~14_combout\ & \Add8~54_combout\)))) # (!\Selector114~0_combout\ & (\Add8~14_combout\ & ((\Add8~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~14_combout\,
	datac => contador_4seg_30(7),
	datad => \Add8~54_combout\,
	combout => \Selector132~0_combout\);

-- Location: FF_X21_Y28_N1
\contador_4seg_30[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector132~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(7));

-- Location: LCCOMB_X20_Y28_N20
\Add8~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~16_combout\ = (contador_4seg_30(8) & (\Add8~15\ $ (GND))) # (!contador_4seg_30(8) & (!\Add8~15\ & VCC))
-- \Add8~17\ = CARRY((contador_4seg_30(8) & !\Add8~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(8),
	datad => VCC,
	cin => \Add8~15\,
	combout => \Add8~16_combout\,
	cout => \Add8~17\);

-- Location: LCCOMB_X21_Y27_N2
\Selector131~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector131~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(8)) # ((\Add8~54_combout\ & \Add8~16_combout\)))) # (!\Selector114~0_combout\ & (\Add8~54_combout\ & ((\Add8~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~54_combout\,
	datac => contador_4seg_30(8),
	datad => \Add8~16_combout\,
	combout => \Selector131~0_combout\);

-- Location: FF_X21_Y27_N3
\contador_4seg_30[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector131~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(8));

-- Location: LCCOMB_X20_Y28_N22
\Add8~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~18_combout\ = (contador_4seg_30(9) & (!\Add8~17\)) # (!contador_4seg_30(9) & ((\Add8~17\) # (GND)))
-- \Add8~19\ = CARRY((!\Add8~17\) # (!contador_4seg_30(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(9),
	datad => VCC,
	cin => \Add8~17\,
	combout => \Add8~18_combout\,
	cout => \Add8~19\);

-- Location: LCCOMB_X21_Y27_N22
\Selector130~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector130~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(9)) # ((\Add8~54_combout\ & \Add8~18_combout\)))) # (!\Selector114~0_combout\ & (\Add8~54_combout\ & ((\Add8~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~54_combout\,
	datac => contador_4seg_30(9),
	datad => \Add8~18_combout\,
	combout => \Selector130~0_combout\);

-- Location: FF_X21_Y27_N23
\contador_4seg_30[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector130~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(9));

-- Location: LCCOMB_X20_Y28_N24
\Add8~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~20_combout\ = (contador_4seg_30(10) & (\Add8~19\ $ (GND))) # (!contador_4seg_30(10) & (!\Add8~19\ & VCC))
-- \Add8~21\ = CARRY((contador_4seg_30(10) & !\Add8~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(10),
	datad => VCC,
	cin => \Add8~19\,
	combout => \Add8~20_combout\,
	cout => \Add8~21\);

-- Location: LCCOMB_X21_Y27_N28
\Selector129~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector129~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(10)) # ((\Add8~54_combout\ & \Add8~20_combout\)))) # (!\Selector114~0_combout\ & (\Add8~54_combout\ & ((\Add8~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~54_combout\,
	datac => contador_4seg_30(10),
	datad => \Add8~20_combout\,
	combout => \Selector129~0_combout\);

-- Location: FF_X21_Y27_N29
\contador_4seg_30[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector129~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(10));

-- Location: LCCOMB_X20_Y28_N26
\Add8~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~22_combout\ = (contador_4seg_30(11) & (!\Add8~21\)) # (!contador_4seg_30(11) & ((\Add8~21\) # (GND)))
-- \Add8~23\ = CARRY((!\Add8~21\) # (!contador_4seg_30(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(11),
	datad => VCC,
	cin => \Add8~21\,
	combout => \Add8~22_combout\,
	cout => \Add8~23\);

-- Location: LCCOMB_X21_Y27_N14
\Selector128~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector128~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(11)) # ((\Add8~54_combout\ & \Add8~22_combout\)))) # (!\Selector114~0_combout\ & (\Add8~54_combout\ & ((\Add8~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~54_combout\,
	datac => contador_4seg_30(11),
	datad => \Add8~22_combout\,
	combout => \Selector128~0_combout\);

-- Location: FF_X21_Y27_N15
\contador_4seg_30[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector128~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(11));

-- Location: LCCOMB_X20_Y28_N28
\Add8~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~24_combout\ = (contador_4seg_30(12) & (\Add8~23\ $ (GND))) # (!contador_4seg_30(12) & (!\Add8~23\ & VCC))
-- \Add8~25\ = CARRY((contador_4seg_30(12) & !\Add8~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(12),
	datad => VCC,
	cin => \Add8~23\,
	combout => \Add8~24_combout\,
	cout => \Add8~25\);

-- Location: LCCOMB_X21_Y27_N8
\Selector127~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector127~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(12)) # ((\Add8~54_combout\ & \Add8~24_combout\)))) # (!\Selector114~0_combout\ & (\Add8~54_combout\ & ((\Add8~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~54_combout\,
	datac => contador_4seg_30(12),
	datad => \Add8~24_combout\,
	combout => \Selector127~0_combout\);

-- Location: FF_X21_Y27_N9
\contador_4seg_30[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector127~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(12));

-- Location: LCCOMB_X20_Y28_N30
\Add8~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~26_combout\ = (contador_4seg_30(13) & (!\Add8~25\)) # (!contador_4seg_30(13) & ((\Add8~25\) # (GND)))
-- \Add8~27\ = CARRY((!\Add8~25\) # (!contador_4seg_30(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(13),
	datad => VCC,
	cin => \Add8~25\,
	combout => \Add8~26_combout\,
	cout => \Add8~27\);

-- Location: LCCOMB_X21_Y27_N26
\Selector126~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector126~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(13)) # ((\Add8~54_combout\ & \Add8~26_combout\)))) # (!\Selector114~0_combout\ & (\Add8~54_combout\ & ((\Add8~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~54_combout\,
	datac => contador_4seg_30(13),
	datad => \Add8~26_combout\,
	combout => \Selector126~0_combout\);

-- Location: FF_X21_Y27_N27
\contador_4seg_30[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector126~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(13));

-- Location: LCCOMB_X20_Y27_N0
\Add8~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~28_combout\ = (contador_4seg_30(14) & (\Add8~27\ $ (GND))) # (!contador_4seg_30(14) & (!\Add8~27\ & VCC))
-- \Add8~29\ = CARRY((contador_4seg_30(14) & !\Add8~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(14),
	datad => VCC,
	cin => \Add8~27\,
	combout => \Add8~28_combout\,
	cout => \Add8~29\);

-- Location: LCCOMB_X21_Y27_N0
\Selector125~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector125~0_combout\ = (\Add8~28_combout\ & ((\Add8~54_combout\) # ((contador_4seg_30(14) & \Selector114~0_combout\)))) # (!\Add8~28_combout\ & (((contador_4seg_30(14) & \Selector114~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add8~28_combout\,
	datab => \Add8~54_combout\,
	datac => contador_4seg_30(14),
	datad => \Selector114~0_combout\,
	combout => \Selector125~0_combout\);

-- Location: FF_X21_Y27_N1
\contador_4seg_30[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector125~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(14));

-- Location: LCCOMB_X20_Y27_N2
\Add8~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~30_combout\ = (contador_4seg_30(15) & (!\Add8~29\)) # (!contador_4seg_30(15) & ((\Add8~29\) # (GND)))
-- \Add8~31\ = CARRY((!\Add8~29\) # (!contador_4seg_30(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(15),
	datad => VCC,
	cin => \Add8~29\,
	combout => \Add8~30_combout\,
	cout => \Add8~31\);

-- Location: LCCOMB_X21_Y27_N18
\Selector124~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector124~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(15)) # ((\Add8~54_combout\ & \Add8~30_combout\)))) # (!\Selector114~0_combout\ & (\Add8~54_combout\ & ((\Add8~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~54_combout\,
	datac => contador_4seg_30(15),
	datad => \Add8~30_combout\,
	combout => \Selector124~0_combout\);

-- Location: FF_X21_Y27_N19
\contador_4seg_30[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector124~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(15));

-- Location: LCCOMB_X20_Y27_N4
\Add8~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~32_combout\ = (contador_4seg_30(16) & (\Add8~31\ $ (GND))) # (!contador_4seg_30(16) & (!\Add8~31\ & VCC))
-- \Add8~33\ = CARRY((contador_4seg_30(16) & !\Add8~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(16),
	datad => VCC,
	cin => \Add8~31\,
	combout => \Add8~32_combout\,
	cout => \Add8~33\);

-- Location: LCCOMB_X21_Y27_N16
\Selector123~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector123~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(16)) # ((\Add8~54_combout\ & \Add8~32_combout\)))) # (!\Selector114~0_combout\ & (\Add8~54_combout\ & ((\Add8~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~54_combout\,
	datac => contador_4seg_30(16),
	datad => \Add8~32_combout\,
	combout => \Selector123~0_combout\);

-- Location: FF_X21_Y27_N17
\contador_4seg_30[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector123~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(16));

-- Location: LCCOMB_X20_Y27_N6
\Add8~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~34_combout\ = (contador_4seg_30(17) & (!\Add8~33\)) # (!contador_4seg_30(17) & ((\Add8~33\) # (GND)))
-- \Add8~35\ = CARRY((!\Add8~33\) # (!contador_4seg_30(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(17),
	datad => VCC,
	cin => \Add8~33\,
	combout => \Add8~34_combout\,
	cout => \Add8~35\);

-- Location: LCCOMB_X21_Y27_N30
\Selector122~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector122~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(17)) # ((\Add8~54_combout\ & \Add8~34_combout\)))) # (!\Selector114~0_combout\ & (\Add8~54_combout\ & ((\Add8~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~54_combout\,
	datac => contador_4seg_30(17),
	datad => \Add8~34_combout\,
	combout => \Selector122~0_combout\);

-- Location: FF_X21_Y27_N31
\contador_4seg_30[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector122~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(17));

-- Location: LCCOMB_X20_Y27_N8
\Add8~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~36_combout\ = (contador_4seg_30(18) & (\Add8~35\ $ (GND))) # (!contador_4seg_30(18) & (!\Add8~35\ & VCC))
-- \Add8~37\ = CARRY((contador_4seg_30(18) & !\Add8~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(18),
	datad => VCC,
	cin => \Add8~35\,
	combout => \Add8~36_combout\,
	cout => \Add8~37\);

-- Location: LCCOMB_X20_Y27_N30
\Selector121~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector121~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(18)) # ((\Add8~36_combout\ & \Add8~54_combout\)))) # (!\Selector114~0_combout\ & (\Add8~36_combout\ & ((\Add8~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~36_combout\,
	datac => contador_4seg_30(18),
	datad => \Add8~54_combout\,
	combout => \Selector121~0_combout\);

-- Location: FF_X20_Y27_N31
\contador_4seg_30[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector121~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(18));

-- Location: LCCOMB_X20_Y27_N10
\Add8~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~38_combout\ = (contador_4seg_30(19) & (!\Add8~37\)) # (!contador_4seg_30(19) & ((\Add8~37\) # (GND)))
-- \Add8~39\ = CARRY((!\Add8~37\) # (!contador_4seg_30(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(19),
	datad => VCC,
	cin => \Add8~37\,
	combout => \Add8~38_combout\,
	cout => \Add8~39\);

-- Location: LCCOMB_X21_Y27_N12
\Selector120~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector120~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(19)) # ((\Add8~54_combout\ & \Add8~38_combout\)))) # (!\Selector114~0_combout\ & (\Add8~54_combout\ & ((\Add8~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~54_combout\,
	datac => contador_4seg_30(19),
	datad => \Add8~38_combout\,
	combout => \Selector120~0_combout\);

-- Location: FF_X21_Y27_N13
\contador_4seg_30[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector120~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(19));

-- Location: LCCOMB_X20_Y27_N12
\Add8~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~40_combout\ = (contador_4seg_30(20) & (\Add8~39\ $ (GND))) # (!contador_4seg_30(20) & (!\Add8~39\ & VCC))
-- \Add8~41\ = CARRY((contador_4seg_30(20) & !\Add8~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(20),
	datad => VCC,
	cin => \Add8~39\,
	combout => \Add8~40_combout\,
	cout => \Add8~41\);

-- Location: LCCOMB_X21_Y27_N10
\Selector119~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector119~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(20)) # ((\Add8~54_combout\ & \Add8~40_combout\)))) # (!\Selector114~0_combout\ & (\Add8~54_combout\ & ((\Add8~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~54_combout\,
	datac => contador_4seg_30(20),
	datad => \Add8~40_combout\,
	combout => \Selector119~0_combout\);

-- Location: FF_X21_Y27_N11
\contador_4seg_30[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector119~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(20));

-- Location: LCCOMB_X20_Y27_N14
\Add8~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~42_combout\ = (contador_4seg_30(21) & (!\Add8~41\)) # (!contador_4seg_30(21) & ((\Add8~41\) # (GND)))
-- \Add8~43\ = CARRY((!\Add8~41\) # (!contador_4seg_30(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(21),
	datad => VCC,
	cin => \Add8~41\,
	combout => \Add8~42_combout\,
	cout => \Add8~43\);

-- Location: LCCOMB_X19_Y27_N18
\Selector118~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector118~0_combout\ = (\Add8~54_combout\ & ((\Add8~42_combout\) # ((\Selector114~0_combout\ & contador_4seg_30(21))))) # (!\Add8~54_combout\ & (\Selector114~0_combout\ & (contador_4seg_30(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add8~54_combout\,
	datab => \Selector114~0_combout\,
	datac => contador_4seg_30(21),
	datad => \Add8~42_combout\,
	combout => \Selector118~0_combout\);

-- Location: FF_X19_Y27_N19
\contador_4seg_30[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector118~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(21));

-- Location: LCCOMB_X20_Y27_N16
\Add8~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~44_combout\ = (contador_4seg_30(22) & (\Add8~43\ $ (GND))) # (!contador_4seg_30(22) & (!\Add8~43\ & VCC))
-- \Add8~45\ = CARRY((contador_4seg_30(22) & !\Add8~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(22),
	datad => VCC,
	cin => \Add8~43\,
	combout => \Add8~44_combout\,
	cout => \Add8~45\);

-- Location: LCCOMB_X19_Y27_N28
\Selector117~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector117~0_combout\ = (\Add8~54_combout\ & ((\Add8~44_combout\) # ((\Selector114~0_combout\ & contador_4seg_30(22))))) # (!\Add8~54_combout\ & (\Selector114~0_combout\ & (contador_4seg_30(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add8~54_combout\,
	datab => \Selector114~0_combout\,
	datac => contador_4seg_30(22),
	datad => \Add8~44_combout\,
	combout => \Selector117~0_combout\);

-- Location: FF_X19_Y27_N29
\contador_4seg_30[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector117~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(22));

-- Location: LCCOMB_X20_Y27_N18
\Add8~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~46_combout\ = (contador_4seg_30(23) & (!\Add8~45\)) # (!contador_4seg_30(23) & ((\Add8~45\) # (GND)))
-- \Add8~47\ = CARRY((!\Add8~45\) # (!contador_4seg_30(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(23),
	datad => VCC,
	cin => \Add8~45\,
	combout => \Add8~46_combout\,
	cout => \Add8~47\);

-- Location: LCCOMB_X19_Y27_N10
\Selector116~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector116~0_combout\ = (\Add8~54_combout\ & ((\Add8~46_combout\) # ((\Selector114~0_combout\ & contador_4seg_30(23))))) # (!\Add8~54_combout\ & (\Selector114~0_combout\ & (contador_4seg_30(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add8~54_combout\,
	datab => \Selector114~0_combout\,
	datac => contador_4seg_30(23),
	datad => \Add8~46_combout\,
	combout => \Selector116~0_combout\);

-- Location: FF_X19_Y27_N11
\contador_4seg_30[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector116~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(23));

-- Location: LCCOMB_X20_Y27_N20
\Add8~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~48_combout\ = (contador_4seg_30(24) & (\Add8~47\ $ (GND))) # (!contador_4seg_30(24) & (!\Add8~47\ & VCC))
-- \Add8~49\ = CARRY((contador_4seg_30(24) & !\Add8~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(24),
	datad => VCC,
	cin => \Add8~47\,
	combout => \Add8~48_combout\,
	cout => \Add8~49\);

-- Location: LCCOMB_X19_Y27_N8
\Selector115~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector115~0_combout\ = (\Add8~54_combout\ & ((\Add8~48_combout\) # ((\Selector114~0_combout\ & contador_4seg_30(24))))) # (!\Add8~54_combout\ & (\Selector114~0_combout\ & (contador_4seg_30(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add8~54_combout\,
	datab => \Selector114~0_combout\,
	datac => contador_4seg_30(24),
	datad => \Add8~48_combout\,
	combout => \Selector115~0_combout\);

-- Location: FF_X19_Y27_N9
\contador_4seg_30[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector115~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(24));

-- Location: LCCOMB_X20_Y27_N22
\Add8~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~50_combout\ = (contador_4seg_30(25) & (!\Add8~49\)) # (!contador_4seg_30(25) & ((\Add8~49\) # (GND)))
-- \Add8~51\ = CARRY((!\Add8~49\) # (!contador_4seg_30(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(25),
	datad => VCC,
	cin => \Add8~49\,
	combout => \Add8~50_combout\,
	cout => \Add8~51\);

-- Location: LCCOMB_X19_Y27_N6
\Selector114~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector114~1_combout\ = (\Add8~54_combout\ & ((\Add8~50_combout\) # ((\Selector114~0_combout\ & contador_4seg_30(25))))) # (!\Add8~54_combout\ & (\Selector114~0_combout\ & (contador_4seg_30(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add8~54_combout\,
	datab => \Selector114~0_combout\,
	datac => contador_4seg_30(25),
	datad => \Add8~50_combout\,
	combout => \Selector114~1_combout\);

-- Location: FF_X19_Y27_N7
\contador_4seg_30[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector114~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(25));

-- Location: LCCOMB_X20_Y27_N24
\Add8~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~52_combout\ = (contador_4seg_30(26) & (\Add8~51\ $ (GND))) # (!contador_4seg_30(26) & (!\Add8~51\ & VCC))
-- \Add8~53\ = CARRY((contador_4seg_30(26) & !\Add8~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_4seg_30(26),
	datad => VCC,
	cin => \Add8~51\,
	combout => \Add8~52_combout\,
	cout => \Add8~53\);

-- Location: LCCOMB_X20_Y27_N28
\Selector113~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector113~0_combout\ = (\Selector114~0_combout\ & ((contador_4seg_30(26)) # ((\Add8~52_combout\ & \Add8~54_combout\)))) # (!\Selector114~0_combout\ & (\Add8~52_combout\ & ((\Add8~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector114~0_combout\,
	datab => \Add8~52_combout\,
	datac => contador_4seg_30(26),
	datad => \Add8~54_combout\,
	combout => \Selector113~0_combout\);

-- Location: FF_X20_Y27_N29
\contador_4seg_30[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector113~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(26));

-- Location: LCCOMB_X20_Y27_N26
\Add8~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add8~55_combout\ = \Add8~53\ $ (contador_4seg_30(27))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => contador_4seg_30(27),
	cin => \Add8~53\,
	combout => \Add8~55_combout\);

-- Location: LCCOMB_X19_Y27_N14
\Selector112~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector112~0_combout\ = (\Add8~54_combout\ & ((\Add8~55_combout\) # ((\Selector114~0_combout\ & contador_4seg_30(27))))) # (!\Add8~54_combout\ & (\Selector114~0_combout\ & (contador_4seg_30(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add8~54_combout\,
	datab => \Selector114~0_combout\,
	datac => contador_4seg_30(27),
	datad => \Add8~55_combout\,
	combout => \Selector112~0_combout\);

-- Location: FF_X19_Y27_N15
\contador_4seg_30[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector112~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_4seg_30(27));

-- Location: LCCOMB_X19_Y27_N24
\LessThan9~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan9~4_combout\ = (contador_4seg_30(23) & (contador_4seg_30(22) & (contador_4seg_30(24) & contador_4seg_30(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(23),
	datab => contador_4seg_30(22),
	datac => contador_4seg_30(24),
	datad => contador_4seg_30(21),
	combout => \LessThan9~4_combout\);

-- Location: LCCOMB_X21_Y27_N4
\LessThan9~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan9~0_combout\ = (contador_4seg_30(15) & (contador_4seg_30(14) & (contador_4seg_30(13) & contador_4seg_30(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(15),
	datab => contador_4seg_30(14),
	datac => contador_4seg_30(13),
	datad => contador_4seg_30(16),
	combout => \LessThan9~0_combout\);

-- Location: LCCOMB_X21_Y27_N20
\LessThan9~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan9~1_combout\ = (contador_4seg_30(9)) # ((contador_4seg_30(12)) # ((contador_4seg_30(11)) # (contador_4seg_30(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(9),
	datab => contador_4seg_30(12),
	datac => contador_4seg_30(11),
	datad => contador_4seg_30(10),
	combout => \LessThan9~1_combout\);

-- Location: LCCOMB_X21_Y27_N6
\LessThan9~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan9~2_combout\ = (contador_4seg_30(17)) # ((\LessThan9~0_combout\ & ((contador_4seg_30(8)) # (\LessThan9~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(17),
	datab => contador_4seg_30(8),
	datac => \LessThan9~0_combout\,
	datad => \LessThan9~1_combout\,
	combout => \LessThan9~2_combout\);

-- Location: LCCOMB_X21_Y27_N24
\LessThan9~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan9~3_combout\ = (contador_4seg_30(19)) # ((contador_4seg_30(18) & \LessThan9~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(19),
	datab => contador_4seg_30(18),
	datad => \LessThan9~2_combout\,
	combout => \LessThan9~3_combout\);

-- Location: LCCOMB_X22_Y27_N2
\LessThan9~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan9~5_combout\ = (contador_4seg_30(25)) # ((contador_4seg_30(20) & (\LessThan9~4_combout\ & \LessThan9~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(20),
	datab => contador_4seg_30(25),
	datac => \LessThan9~4_combout\,
	datad => \LessThan9~3_combout\,
	combout => \LessThan9~5_combout\);

-- Location: LCCOMB_X22_Y27_N28
\Selector169~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector169~2_combout\ = (!\entrega_completada~input_o\ & (!contador_4seg_30(27) & ((!\LessThan9~5_combout\) # (!contador_4seg_30(26)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_4seg_30(26),
	datab => \entrega_completada~input_o\,
	datac => contador_4seg_30(27),
	datad => \LessThan9~5_combout\,
	combout => \Selector169~2_combout\);

-- Location: LCCOMB_X22_Y27_N20
\Selector169~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector169~6_combout\ = (\Selector168~0_combout\ & ((\Selector169~5_combout\ & ((!\entrega_completada~input_o\))) # (!\Selector169~5_combout\ & (\estado_motor_30.MOTOR_GIRANDO~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_motor_30.MOTOR_GIRANDO~q\,
	datab => \entrega_completada~input_o\,
	datac => \Selector168~0_combout\,
	datad => \Selector169~5_combout\,
	combout => \Selector169~6_combout\);

-- Location: LCCOMB_X22_Y27_N24
\Selector169~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector169~7_combout\ = (\Selector169~6_combout\) # ((!\Selector168~0_combout\ & ((\Selector169~2_combout\) # (!\estado_motor_30.MOTOR_GIRANDO~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector169~2_combout\,
	datab => \Selector168~0_combout\,
	datac => \estado_motor_30.MOTOR_GIRANDO~q\,
	datad => \Selector169~6_combout\,
	combout => \Selector169~7_combout\);

-- Location: FF_X22_Y27_N25
\estado_motor_30.MOTOR_GIRANDO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector169~7_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_motor_30.MOTOR_GIRANDO~q\);

-- Location: LCCOMB_X19_Y27_N16
\servo_motor_30~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \servo_motor_30~0_combout\ = (\estado_motor_30.MOTOR_GIRANDO~q\ & \U_MOTOR_PWM|pwm~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_motor_30.MOTOR_GIRANDO~q\,
	datac => \U_MOTOR_PWM|pwm~q\,
	combout => \servo_motor_30~0_combout\);

-- Location: LCCOMB_X11_Y8_N10
\Selector0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\estado_devolucion.FIN_DEVOLUCION~q\ & !\LessThan6~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \estado_devolucion.FIN_DEVOLUCION~q\,
	datad => \LessThan6~5_combout\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X11_Y8_N28
\Selector0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (\estado_devolucion.REPOSO~q\ & (((\devolucion_activa~q\ & !\Selector0~0_combout\)))) # (!\estado_devolucion.REPOSO~q\ & (\activar_devolucion_reg~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \activar_devolucion_reg~q\,
	datab => \estado_devolucion.REPOSO~q\,
	datac => \devolucion_activa~q\,
	datad => \Selector0~0_combout\,
	combout => \Selector0~1_combout\);

-- Location: FF_X11_Y8_N29
devolucion_activa : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector0~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \devolucion_activa~q\);

-- Location: LCCOMB_X20_Y10_N22
\motor_02_activo_int~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \motor_02_activo_int~0_combout\ = (\estado_motor_02.MOTOR_APAGADO~q\ & (((\motor_02_activo_int~q\)))) # (!\estado_motor_02.MOTOR_APAGADO~q\ & (\activar_motor_02~input_o\ & ((!\entrega_completada~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_motor_02.MOTOR_APAGADO~q\,
	datab => \activar_motor_02~input_o\,
	datac => \motor_02_activo_int~q\,
	datad => \entrega_completada~input_o\,
	combout => \motor_02_activo_int~0_combout\);

-- Location: FF_X20_Y10_N23
motor_02_activo_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \motor_02_activo_int~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \motor_02_activo_int~q\);

-- Location: LCCOMB_X22_Y27_N22
\motor_30_activo_int~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \motor_30_activo_int~0_combout\ = (\estado_motor_30.MOTOR_APAGADO~q\ & (((\motor_30_activo_int~q\)))) # (!\estado_motor_30.MOTOR_APAGADO~q\ & (\activar_motor_30~input_o\ & ((!\entrega_completada~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \activar_motor_30~input_o\,
	datab => \estado_motor_30.MOTOR_APAGADO~q\,
	datac => \motor_30_activo_int~q\,
	datad => \entrega_completada~input_o\,
	combout => \motor_30_activo_int~0_combout\);

-- Location: FF_X22_Y27_N23
motor_30_activo_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \motor_30_activo_int~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \motor_30_activo_int~q\);

-- Location: LCCOMB_X12_Y9_N0
\Add5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add5~0_combout\ = credito_restante_int(0) $ (VCC)
-- \Add5~1\ = CARRY(credito_restante_int(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => credito_restante_int(0),
	datad => VCC,
	combout => \Add5~0_combout\,
	cout => \Add5~1\);

-- Location: LCCOMB_X12_Y11_N26
\Add5~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add5~2_combout\ = (\estado_devolucion.ESPERAR_190_5~q\ & ((\Add5~0_combout\))) # (!\estado_devolucion.ESPERAR_190_5~q\ & (\credito_actual[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_190_5~q\,
	datac => \credito_actual[0]~input_o\,
	datad => \Add5~0_combout\,
	combout => \Add5~2_combout\);

-- Location: FF_X12_Y11_N27
\credito_restante_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add5~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \credito_restante_int[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_restante_int(0));

-- Location: LCCOMB_X12_Y9_N16
\Add3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = credito_restante_int(1) $ (VCC)
-- \Add3~1\ = CARRY(credito_restante_int(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => credito_restante_int(1),
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

-- Location: LCCOMB_X11_Y9_N16
\credito_restante_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_restante_int[1]~0_combout\ = (\estado_devolucion.ESPERAR_190_10~q\ & ((\Add3~0_combout\))) # (!\estado_devolucion.ESPERAR_190_10~q\ & (\credito_actual[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_190_10~q\,
	datab => \credito_actual[1]~input_o\,
	datad => \Add3~0_combout\,
	combout => \credito_restante_int[1]~0_combout\);

-- Location: LCCOMB_X12_Y9_N2
\Add5~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add5~3_combout\ = (credito_restante_int(1) & (\Add5~1\ & VCC)) # (!credito_restante_int(1) & (!\Add5~1\))
-- \Add5~4\ = CARRY((!credito_restante_int(1) & !\Add5~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => credito_restante_int(1),
	datad => VCC,
	cin => \Add5~1\,
	combout => \Add5~3_combout\,
	cout => \Add5~4\);

-- Location: LCCOMB_X11_Y9_N24
\credito_restante_int[3]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_restante_int[3]~7_combout\ = (\estado_devolucion.ESPERAR_190_10~q\ & (((!\LessThan4~6_combout\)))) # (!\estado_devolucion.ESPERAR_190_10~q\ & ((\estado_devolucion.ESPERAR_190_5~q\ & ((!\LessThan4~6_combout\))) # 
-- (!\estado_devolucion.ESPERAR_190_5~q\ & (\estado_devolucion.CALCULAR_MONEDAS~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_190_10~q\,
	datab => \estado_devolucion.CALCULAR_MONEDAS~q\,
	datac => \estado_devolucion.ESPERAR_190_5~q\,
	datad => \LessThan4~6_combout\,
	combout => \credito_restante_int[3]~7_combout\);

-- Location: FF_X11_Y9_N17
\credito_restante_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \credito_restante_int[1]~0_combout\,
	asdata => \Add5~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \estado_devolucion.ESPERAR_190_5~q\,
	ena => \credito_restante_int[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_restante_int(1));

-- Location: LCCOMB_X12_Y9_N18
\Add3~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (credito_restante_int(2) & (\Add3~1\ & VCC)) # (!credito_restante_int(2) & (!\Add3~1\))
-- \Add3~3\ = CARRY((!credito_restante_int(2) & !\Add3~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => credito_restante_int(2),
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: LCCOMB_X11_Y9_N22
\credito_restante_int[2]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_restante_int[2]~1_combout\ = (\estado_devolucion.ESPERAR_190_10~q\ & ((\Add3~2_combout\))) # (!\estado_devolucion.ESPERAR_190_10~q\ & (\credito_actual[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_190_10~q\,
	datab => \credito_actual[2]~input_o\,
	datad => \Add3~2_combout\,
	combout => \credito_restante_int[2]~1_combout\);

-- Location: LCCOMB_X12_Y9_N4
\Add5~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add5~5_combout\ = (credito_restante_int(2) & (\Add5~4\ $ (GND))) # (!credito_restante_int(2) & (!\Add5~4\ & VCC))
-- \Add5~6\ = CARRY((credito_restante_int(2) & !\Add5~4\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => credito_restante_int(2),
	datad => VCC,
	cin => \Add5~4\,
	combout => \Add5~5_combout\,
	cout => \Add5~6\);

-- Location: FF_X11_Y9_N23
\credito_restante_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \credito_restante_int[2]~1_combout\,
	asdata => \Add5~5_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \estado_devolucion.ESPERAR_190_5~q\,
	ena => \credito_restante_int[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_restante_int(2));

-- Location: LCCOMB_X12_Y9_N20
\Add3~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = (credito_restante_int(3) & (\Add3~3\ $ (GND))) # (!credito_restante_int(3) & (!\Add3~3\ & VCC))
-- \Add3~5\ = CARRY((credito_restante_int(3) & !\Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => credito_restante_int(3),
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: LCCOMB_X11_Y9_N12
\credito_restante_int[3]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_restante_int[3]~2_combout\ = (\estado_devolucion.ESPERAR_190_10~q\ & (\Add3~4_combout\)) # (!\estado_devolucion.ESPERAR_190_10~q\ & ((\credito_actual[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~4_combout\,
	datab => \credito_actual[3]~input_o\,
	datad => \estado_devolucion.ESPERAR_190_10~q\,
	combout => \credito_restante_int[3]~2_combout\);

-- Location: LCCOMB_X12_Y9_N6
\Add5~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add5~7_combout\ = (credito_restante_int(3) & (\Add5~6\ & VCC)) # (!credito_restante_int(3) & (!\Add5~6\))
-- \Add5~8\ = CARRY((!credito_restante_int(3) & !\Add5~6\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => credito_restante_int(3),
	datad => VCC,
	cin => \Add5~6\,
	combout => \Add5~7_combout\,
	cout => \Add5~8\);

-- Location: FF_X11_Y9_N13
\credito_restante_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \credito_restante_int[3]~2_combout\,
	asdata => \Add5~7_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \estado_devolucion.ESPERAR_190_5~q\,
	ena => \credito_restante_int[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_restante_int(3));

-- Location: LCCOMB_X12_Y9_N22
\Add3~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (credito_restante_int(4) & (\Add3~5\ & VCC)) # (!credito_restante_int(4) & (!\Add3~5\))
-- \Add3~7\ = CARRY((!credito_restante_int(4) & !\Add3~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => credito_restante_int(4),
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: LCCOMB_X11_Y9_N26
\credito_restante_int[4]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_restante_int[4]~3_combout\ = (\estado_devolucion.ESPERAR_190_10~q\ & ((\Add3~6_combout\))) # (!\estado_devolucion.ESPERAR_190_10~q\ & (\credito_actual[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_devolucion.ESPERAR_190_10~q\,
	datab => \credito_actual[4]~input_o\,
	datad => \Add3~6_combout\,
	combout => \credito_restante_int[4]~3_combout\);

-- Location: LCCOMB_X12_Y9_N8
\Add5~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add5~9_combout\ = (credito_restante_int(4) & ((GND) # (!\Add5~8\))) # (!credito_restante_int(4) & (\Add5~8\ $ (GND)))
-- \Add5~10\ = CARRY((credito_restante_int(4)) # (!\Add5~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => credito_restante_int(4),
	datad => VCC,
	cin => \Add5~8\,
	combout => \Add5~9_combout\,
	cout => \Add5~10\);

-- Location: FF_X11_Y9_N27
\credito_restante_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \credito_restante_int[4]~3_combout\,
	asdata => \Add5~9_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \estado_devolucion.ESPERAR_190_5~q\,
	ena => \credito_restante_int[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_restante_int(4));

-- Location: LCCOMB_X12_Y9_N24
\Add3~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = (credito_restante_int(5) & ((GND) # (!\Add3~7\))) # (!credito_restante_int(5) & (\Add3~7\ $ (GND)))
-- \Add3~9\ = CARRY((credito_restante_int(5)) # (!\Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => credito_restante_int(5),
	datad => VCC,
	cin => \Add3~7\,
	combout => \Add3~8_combout\,
	cout => \Add3~9\);

-- Location: LCCOMB_X11_Y9_N4
\credito_restante_int[5]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_restante_int[5]~4_combout\ = (\estado_devolucion.ESPERAR_190_10~q\ & ((\Add3~8_combout\))) # (!\estado_devolucion.ESPERAR_190_10~q\ & (\credito_actual[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \credito_actual[5]~input_o\,
	datab => \Add3~8_combout\,
	datad => \estado_devolucion.ESPERAR_190_10~q\,
	combout => \credito_restante_int[5]~4_combout\);

-- Location: LCCOMB_X12_Y9_N10
\Add5~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add5~11_combout\ = (credito_restante_int(5) & (\Add5~10\ & VCC)) # (!credito_restante_int(5) & (!\Add5~10\))
-- \Add5~12\ = CARRY((!credito_restante_int(5) & !\Add5~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => credito_restante_int(5),
	datad => VCC,
	cin => \Add5~10\,
	combout => \Add5~11_combout\,
	cout => \Add5~12\);

-- Location: FF_X11_Y9_N5
\credito_restante_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \credito_restante_int[5]~4_combout\,
	asdata => \Add5~11_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \estado_devolucion.ESPERAR_190_5~q\,
	ena => \credito_restante_int[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_restante_int(5));

-- Location: LCCOMB_X12_Y9_N26
\Add3~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~10_combout\ = \Add3~9\ $ (!credito_restante_int(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => credito_restante_int(6),
	cin => \Add3~9\,
	combout => \Add3~10_combout\);

-- Location: LCCOMB_X11_Y9_N18
\credito_restante_int[6]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_restante_int[6]~5_combout\ = (\estado_devolucion.ESPERAR_190_10~q\ & ((\Add3~10_combout\))) # (!\estado_devolucion.ESPERAR_190_10~q\ & (\credito_actual[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \credito_actual[6]~input_o\,
	datab => \Add3~10_combout\,
	datad => \estado_devolucion.ESPERAR_190_10~q\,
	combout => \credito_restante_int[6]~5_combout\);

-- Location: LCCOMB_X12_Y9_N12
\Add5~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add5~13_combout\ = \Add5~12\ $ (credito_restante_int(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => credito_restante_int(6),
	cin => \Add5~12\,
	combout => \Add5~13_combout\);

-- Location: FF_X11_Y9_N19
\credito_restante_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \credito_restante_int[6]~5_combout\,
	asdata => \Add5~13_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \estado_devolucion.ESPERAR_190_5~q\,
	ena => \credito_restante_int[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_restante_int(6));

ww_servo_moneda_5 <= \servo_moneda_5~output_o\;

ww_servo_moneda_10 <= \servo_moneda_10~output_o\;

ww_servo_motor_02 <= \servo_motor_02~output_o\;

ww_servo_motor_30 <= \servo_motor_30~output_o\;

ww_devolucion_en_curso <= \devolucion_en_curso~output_o\;

ww_motor_02_activo <= \motor_02_activo~output_o\;

ww_motor_30_activo <= \motor_30_activo~output_o\;

ww_credito_restante(0) <= \credito_restante[0]~output_o\;

ww_credito_restante(1) <= \credito_restante[1]~output_o\;

ww_credito_restante(2) <= \credito_restante[2]~output_o\;

ww_credito_restante(3) <= \credito_restante[3]~output_o\;

ww_credito_restante(4) <= \credito_restante[4]~output_o\;

ww_credito_restante(5) <= \credito_restante[5]~output_o\;

ww_credito_restante(6) <= \credito_restante[6]~output_o\;
END structure;


