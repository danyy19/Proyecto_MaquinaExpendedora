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

-- DATE "10/29/2025 11:39:52"

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

ENTITY 	ControlSensores IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	sensor_moneda_5 : IN std_logic;
	sensor_moneda_10 : IN std_logic;
	sensor_entrega : IN std_logic;
	compra_en_proceso : IN std_logic;
	actualizar_credito : IN std_logic;
	monto_compra : IN STD.STANDARD.integer range 0 TO 127;
	credito_externo : IN STD.STANDARD.integer range 0 TO 99;
	actualizar_externo : IN std_logic;
	moneda_5_detectada : OUT std_logic;
	moneda_10_detectada : OUT std_logic;
	entrega_detectada : OUT std_logic;
	credito_total : OUT STD.STANDARD.integer range 0 TO 99;
	bloqueo_monedas : OUT std_logic;
	bloqueo_entrega : OUT std_logic
	);
END ControlSensores;

-- Design Ports Information
-- moneda_5_detectada	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- moneda_10_detectada	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- entrega_detectada	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_total[0]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_total[1]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_total[2]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_total[3]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_total[4]	=>  Location: PIN_B20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_total[5]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_total[6]	=>  Location: PIN_A20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bloqueo_monedas	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bloqueo_entrega	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_externo[6]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- actualizar_externo	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monto_compra[6]	=>  Location: PIN_C21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_externo[5]	=>  Location: PIN_C22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monto_compra[5]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_externo[4]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monto_compra[4]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_externo[3]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monto_compra[3]	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_externo[2]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monto_compra[2]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_externo[1]	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monto_compra[1]	=>  Location: PIN_G14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- credito_externo[0]	=>  Location: PIN_B22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monto_compra[0]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- actualizar_credito	=>  Location: PIN_D20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- compra_en_proceso	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sensor_moneda_5	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sensor_moneda_10	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sensor_entrega	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ControlSensores IS
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
SIGNAL ww_sensor_moneda_5 : std_logic;
SIGNAL ww_sensor_moneda_10 : std_logic;
SIGNAL ww_sensor_entrega : std_logic;
SIGNAL ww_compra_en_proceso : std_logic;
SIGNAL ww_actualizar_credito : std_logic;
SIGNAL ww_monto_compra : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_credito_externo : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_actualizar_externo : std_logic;
SIGNAL ww_moneda_5_detectada : std_logic;
SIGNAL ww_moneda_10_detectada : std_logic;
SIGNAL ww_entrega_detectada : std_logic;
SIGNAL ww_credito_total : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_bloqueo_monedas : std_logic;
SIGNAL ww_bloqueo_entrega : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \moneda_5_detectada~output_o\ : std_logic;
SIGNAL \moneda_10_detectada~output_o\ : std_logic;
SIGNAL \entrega_detectada~output_o\ : std_logic;
SIGNAL \credito_total[0]~output_o\ : std_logic;
SIGNAL \credito_total[1]~output_o\ : std_logic;
SIGNAL \credito_total[2]~output_o\ : std_logic;
SIGNAL \credito_total[3]~output_o\ : std_logic;
SIGNAL \credito_total[4]~output_o\ : std_logic;
SIGNAL \credito_total[5]~output_o\ : std_logic;
SIGNAL \credito_total[6]~output_o\ : std_logic;
SIGNAL \bloqueo_monedas~output_o\ : std_logic;
SIGNAL \bloqueo_entrega~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \actualizar_credito~input_o\ : std_logic;
SIGNAL \actualizar_externo~input_o\ : std_logic;
SIGNAL \credito_externo[5]~input_o\ : std_logic;
SIGNAL \monto_compra[0]~input_o\ : std_logic;
SIGNAL \credito_externo[0]~input_o\ : std_logic;
SIGNAL \contador_bloqueo[0]~27_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \compra_en_proceso~input_o\ : std_logic;
SIGNAL \sensor_moneda_5~input_o\ : std_logic;
SIGNAL \moneda_5_debounce[0]~0_combout\ : std_logic;
SIGNAL \moneda_5_debounce[2]~feeder_combout\ : std_logic;
SIGNAL \moneda_5_debounce[4]~feeder_combout\ : std_logic;
SIGNAL \moneda_5_debounce[5]~feeder_combout\ : std_logic;
SIGNAL \moneda_5_estable~2_combout\ : std_logic;
SIGNAL \moneda_5_estable~1_combout\ : std_logic;
SIGNAL \moneda_5_estable~0_combout\ : std_logic;
SIGNAL \moneda_5_estable~3_combout\ : std_logic;
SIGNAL \moneda_5_estable~q\ : std_logic;
SIGNAL \sensor_moneda_10~input_o\ : std_logic;
SIGNAL \moneda_10_debounce[0]~0_combout\ : std_logic;
SIGNAL \moneda_10_debounce[2]~feeder_combout\ : std_logic;
SIGNAL \moneda_10_debounce[4]~feeder_combout\ : std_logic;
SIGNAL \moneda_10_estable~1_combout\ : std_logic;
SIGNAL \moneda_10_estable~2_combout\ : std_logic;
SIGNAL \moneda_10_estable~0_combout\ : std_logic;
SIGNAL \moneda_10_estable~3_combout\ : std_logic;
SIGNAL \moneda_10_estable~q\ : std_logic;
SIGNAL \moneda_10_prev~q\ : std_logic;
SIGNAL \moneda_5_prev~q\ : std_logic;
SIGNAL \contador_bloqueo[21]~26_combout\ : std_logic;
SIGNAL \contador_bloqueo[21]~76_combout\ : std_logic;
SIGNAL \contador_bloqueo[21]~43_combout\ : std_logic;
SIGNAL \contador_bloqueo[0]~28\ : std_logic;
SIGNAL \contador_bloqueo[1]~29_combout\ : std_logic;
SIGNAL \contador_bloqueo[1]~30\ : std_logic;
SIGNAL \contador_bloqueo[2]~31_combout\ : std_logic;
SIGNAL \contador_bloqueo[2]~32\ : std_logic;
SIGNAL \contador_bloqueo[3]~33_combout\ : std_logic;
SIGNAL \contador_bloqueo[3]~34\ : std_logic;
SIGNAL \contador_bloqueo[4]~35_combout\ : std_logic;
SIGNAL \contador_bloqueo[4]~36\ : std_logic;
SIGNAL \contador_bloqueo[5]~37_combout\ : std_logic;
SIGNAL \contador_bloqueo[5]~38\ : std_logic;
SIGNAL \contador_bloqueo[6]~39_combout\ : std_logic;
SIGNAL \contador_bloqueo[6]~40\ : std_logic;
SIGNAL \contador_bloqueo[7]~41_combout\ : std_logic;
SIGNAL \contador_bloqueo[7]~42\ : std_logic;
SIGNAL \contador_bloqueo[8]~44_combout\ : std_logic;
SIGNAL \contador_bloqueo[8]~45\ : std_logic;
SIGNAL \contador_bloqueo[9]~46_combout\ : std_logic;
SIGNAL \contador_bloqueo[9]~47\ : std_logic;
SIGNAL \contador_bloqueo[10]~48_combout\ : std_logic;
SIGNAL \contador_bloqueo[10]~49\ : std_logic;
SIGNAL \contador_bloqueo[11]~50_combout\ : std_logic;
SIGNAL \contador_bloqueo[11]~51\ : std_logic;
SIGNAL \contador_bloqueo[12]~52_combout\ : std_logic;
SIGNAL \contador_bloqueo[12]~53\ : std_logic;
SIGNAL \contador_bloqueo[13]~54_combout\ : std_logic;
SIGNAL \contador_bloqueo[13]~55\ : std_logic;
SIGNAL \contador_bloqueo[14]~56_combout\ : std_logic;
SIGNAL \contador_bloqueo[14]~57\ : std_logic;
SIGNAL \contador_bloqueo[15]~58_combout\ : std_logic;
SIGNAL \contador_bloqueo[15]~59\ : std_logic;
SIGNAL \contador_bloqueo[16]~60_combout\ : std_logic;
SIGNAL \contador_bloqueo[16]~61\ : std_logic;
SIGNAL \contador_bloqueo[17]~62_combout\ : std_logic;
SIGNAL \contador_bloqueo[17]~63\ : std_logic;
SIGNAL \contador_bloqueo[18]~64_combout\ : std_logic;
SIGNAL \LessThan2~3_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \LessThan2~2_combout\ : std_logic;
SIGNAL \contador_bloqueo[18]~65\ : std_logic;
SIGNAL \contador_bloqueo[19]~66_combout\ : std_logic;
SIGNAL \contador_bloqueo[19]~67\ : std_logic;
SIGNAL \contador_bloqueo[20]~68_combout\ : std_logic;
SIGNAL \LessThan2~4_combout\ : std_logic;
SIGNAL \contador_bloqueo[20]~69\ : std_logic;
SIGNAL \contador_bloqueo[21]~70_combout\ : std_logic;
SIGNAL \contador_bloqueo[21]~71\ : std_logic;
SIGNAL \contador_bloqueo[22]~72_combout\ : std_logic;
SIGNAL \contador_bloqueo[22]~73\ : std_logic;
SIGNAL \contador_bloqueo[23]~74_combout\ : std_logic;
SIGNAL \LessThan2~5_combout\ : std_logic;
SIGNAL \bloqueo_monedas_int~0_combout\ : std_logic;
SIGNAL \bloqueo_monedas_int~q\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \nuevo_credito~16_combout\ : std_logic;
SIGNAL \nuevo_credito~6_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \monto_compra[6]~input_o\ : std_logic;
SIGNAL \credito_externo[6]~input_o\ : std_logic;
SIGNAL \monto_compra[5]~input_o\ : std_logic;
SIGNAL \monto_compra[4]~input_o\ : std_logic;
SIGNAL \credito_externo[4]~input_o\ : std_logic;
SIGNAL \monto_compra[3]~input_o\ : std_logic;
SIGNAL \credito_externo[3]~input_o\ : std_logic;
SIGNAL \process_0~1_combout\ : std_logic;
SIGNAL \monto_compra[2]~input_o\ : std_logic;
SIGNAL \credito_externo[2]~input_o\ : std_logic;
SIGNAL \credito_externo[1]~input_o\ : std_logic;
SIGNAL \monto_compra[1]~input_o\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \nuevo_credito~14_combout\ : std_logic;
SIGNAL \credito_total_int[1]~6_combout\ : std_logic;
SIGNAL \nuevo_credito~5_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \nuevo_credito~13_combout\ : std_logic;
SIGNAL \credito_total_int[1]~7\ : std_logic;
SIGNAL \credito_total_int[2]~8_combout\ : std_logic;
SIGNAL \nuevo_credito~4_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add0~19_combout\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \nuevo_credito~12_combout\ : std_logic;
SIGNAL \LessThan4~0_combout\ : std_logic;
SIGNAL \moneda_10_detectada_int~2_combout\ : std_logic;
SIGNAL \credito_total_int[2]~9\ : std_logic;
SIGNAL \credito_total_int[3]~10_combout\ : std_logic;
SIGNAL \nuevo_credito~3_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \nuevo_credito~11_combout\ : std_logic;
SIGNAL \credito_total_int[3]~11\ : std_logic;
SIGNAL \credito_total_int[4]~12_combout\ : std_logic;
SIGNAL \nuevo_credito~2_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add3~9\ : std_logic;
SIGNAL \Add3~11\ : std_logic;
SIGNAL \Add3~12_combout\ : std_logic;
SIGNAL \nuevo_credito~15_combout\ : std_logic;
SIGNAL \credito_total_int[4]~13\ : std_logic;
SIGNAL \credito_total_int[5]~15\ : std_logic;
SIGNAL \credito_total_int[6]~16_combout\ : std_logic;
SIGNAL \nuevo_credito~0_combout\ : std_logic;
SIGNAL \LessThan0~1_cout\ : std_logic;
SIGNAL \LessThan0~3_cout\ : std_logic;
SIGNAL \LessThan0~5_cout\ : std_logic;
SIGNAL \LessThan0~7_cout\ : std_logic;
SIGNAL \LessThan0~9_cout\ : std_logic;
SIGNAL \LessThan0~11_cout\ : std_logic;
SIGNAL \LessThan0~12_combout\ : std_logic;
SIGNAL \Add0~17_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \nuevo_credito~9_combout\ : std_logic;
SIGNAL \Add3~10_combout\ : std_logic;
SIGNAL \nuevo_credito~10_combout\ : std_logic;
SIGNAL \credito_total_int[5]~14_combout\ : std_logic;
SIGNAL \nuevo_credito~1_combout\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~15_combout\ : std_logic;
SIGNAL \nuevo_credito~7_combout\ : std_logic;
SIGNAL \nuevo_credito~8_combout\ : std_logic;
SIGNAL \moneda_5_detectada_int~q\ : std_logic;
SIGNAL \moneda_10_detectada_int~3_combout\ : std_logic;
SIGNAL \moneda_10_detectada_int~q\ : std_logic;
SIGNAL \sensor_entrega~input_o\ : std_logic;
SIGNAL \entrega_debounce[0]~0_combout\ : std_logic;
SIGNAL \entrega_debounce[1]~feeder_combout\ : std_logic;
SIGNAL \entrega_debounce[3]~feeder_combout\ : std_logic;
SIGNAL \entrega_debounce[6]~feeder_combout\ : std_logic;
SIGNAL \entrega_estable~2_combout\ : std_logic;
SIGNAL \entrega_estable~1_combout\ : std_logic;
SIGNAL \entrega_estable~0_combout\ : std_logic;
SIGNAL \entrega_estable~3_combout\ : std_logic;
SIGNAL \entrega_estable~q\ : std_logic;
SIGNAL \entrega_prev~feeder_combout\ : std_logic;
SIGNAL \entrega_prev~q\ : std_logic;
SIGNAL \contador_bloqueo_entrega[0]~26_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[11]~75_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[11]~42_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[0]~27\ : std_logic;
SIGNAL \contador_bloqueo_entrega[1]~28_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[1]~29\ : std_logic;
SIGNAL \contador_bloqueo_entrega[2]~30_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[2]~31\ : std_logic;
SIGNAL \contador_bloqueo_entrega[3]~32_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[3]~33\ : std_logic;
SIGNAL \contador_bloqueo_entrega[4]~34_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[4]~35\ : std_logic;
SIGNAL \contador_bloqueo_entrega[5]~36_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[5]~37\ : std_logic;
SIGNAL \contador_bloqueo_entrega[6]~38_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[6]~39\ : std_logic;
SIGNAL \contador_bloqueo_entrega[7]~40_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[7]~41\ : std_logic;
SIGNAL \contador_bloqueo_entrega[8]~43_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[8]~44\ : std_logic;
SIGNAL \contador_bloqueo_entrega[9]~45_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[9]~46\ : std_logic;
SIGNAL \contador_bloqueo_entrega[10]~47_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[10]~48\ : std_logic;
SIGNAL \contador_bloqueo_entrega[11]~49_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[11]~50\ : std_logic;
SIGNAL \contador_bloqueo_entrega[12]~51_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[12]~52\ : std_logic;
SIGNAL \contador_bloqueo_entrega[13]~53_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[13]~54\ : std_logic;
SIGNAL \contador_bloqueo_entrega[14]~55_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[14]~56\ : std_logic;
SIGNAL \contador_bloqueo_entrega[15]~57_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[15]~58\ : std_logic;
SIGNAL \contador_bloqueo_entrega[16]~59_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[16]~60\ : std_logic;
SIGNAL \contador_bloqueo_entrega[17]~61_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[17]~62\ : std_logic;
SIGNAL \contador_bloqueo_entrega[18]~63_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[18]~64\ : std_logic;
SIGNAL \contador_bloqueo_entrega[19]~65_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[19]~66\ : std_logic;
SIGNAL \contador_bloqueo_entrega[20]~67_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[20]~68\ : std_logic;
SIGNAL \contador_bloqueo_entrega[21]~69_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[21]~70\ : std_logic;
SIGNAL \contador_bloqueo_entrega[22]~71_combout\ : std_logic;
SIGNAL \contador_bloqueo_entrega[22]~72\ : std_logic;
SIGNAL \contador_bloqueo_entrega[23]~73_combout\ : std_logic;
SIGNAL \bloqueo_entrega_int~2_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \bloqueo_entrega_int~3_combout\ : std_logic;
SIGNAL \bloqueo_entrega_int~4_combout\ : std_logic;
SIGNAL \bloqueo_entrega_int~5_combout\ : std_logic;
SIGNAL \bloqueo_entrega_int~q\ : std_logic;
SIGNAL \entrega_detectada_int~0_combout\ : std_logic;
SIGNAL \entrega_detectada_int~q\ : std_logic;
SIGNAL moneda_5_debounce : std_logic_vector(7 DOWNTO 0);
SIGNAL moneda_10_debounce : std_logic_vector(7 DOWNTO 0);
SIGNAL entrega_debounce : std_logic_vector(7 DOWNTO 0);
SIGNAL credito_total_int : std_logic_vector(6 DOWNTO 0);
SIGNAL contador_bloqueo_entrega : std_logic_vector(23 DOWNTO 0);
SIGNAL contador_bloqueo : std_logic_vector(23 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_sensor_moneda_5 <= sensor_moneda_5;
ww_sensor_moneda_10 <= sensor_moneda_10;
ww_sensor_entrega <= sensor_entrega;
ww_compra_en_proceso <= compra_en_proceso;
ww_actualizar_credito <= actualizar_credito;
ww_monto_compra <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(monto_compra, 7);
ww_credito_externo <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(credito_externo, 7);
ww_actualizar_externo <= actualizar_externo;
moneda_5_detectada <= ww_moneda_5_detectada;
moneda_10_detectada <= ww_moneda_10_detectada;
entrega_detectada <= ww_entrega_detectada;
credito_total <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_credito_total));
bloqueo_monedas <= ww_bloqueo_monedas;
bloqueo_entrega <= ww_bloqueo_entrega;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;

-- Location: IOOBUF_X41_Y26_N2
\moneda_5_detectada~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \moneda_5_detectada_int~q\,
	devoe => ww_devoe,
	o => \moneda_5_detectada~output_o\);

-- Location: IOOBUF_X35_Y29_N16
\moneda_10_detectada~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \moneda_10_detectada_int~q\,
	devoe => ww_devoe,
	o => \moneda_10_detectada~output_o\);

-- Location: IOOBUF_X30_Y0_N30
\entrega_detectada~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \entrega_detectada_int~q\,
	devoe => ww_devoe,
	o => \entrega_detectada~output_o\);

-- Location: IOOBUF_X41_Y25_N16
\credito_total[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_total_int(0),
	devoe => ww_devoe,
	o => \credito_total[0]~output_o\);

-- Location: IOOBUF_X32_Y29_N9
\credito_total[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_total_int(1),
	devoe => ww_devoe,
	o => \credito_total[1]~output_o\);

-- Location: IOOBUF_X37_Y29_N16
\credito_total[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_total_int(2),
	devoe => ww_devoe,
	o => \credito_total[2]~output_o\);

-- Location: IOOBUF_X39_Y29_N30
\credito_total[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_total_int(3),
	devoe => ww_devoe,
	o => \credito_total[3]~output_o\);

-- Location: IOOBUF_X35_Y29_N9
\credito_total[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_total_int(4),
	devoe => ww_devoe,
	o => \credito_total[4]~output_o\);

-- Location: IOOBUF_X41_Y27_N2
\credito_total[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_total_int(5),
	devoe => ww_devoe,
	o => \credito_total[5]~output_o\);

-- Location: IOOBUF_X35_Y29_N2
\credito_total[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => credito_total_int(6),
	devoe => ww_devoe,
	o => \credito_total[6]~output_o\);

-- Location: IOOBUF_X32_Y29_N2
\bloqueo_monedas~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bloqueo_monedas_int~q\,
	devoe => ww_devoe,
	o => \bloqueo_monedas~output_o\);

-- Location: IOOBUF_X30_Y0_N23
\bloqueo_entrega~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bloqueo_entrega_int~q\,
	devoe => ww_devoe,
	o => \bloqueo_entrega~output_o\);

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

-- Location: IOIBUF_X41_Y27_N15
\actualizar_credito~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_actualizar_credito,
	o => \actualizar_credito~input_o\);

-- Location: IOIBUF_X41_Y27_N22
\actualizar_externo~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_actualizar_externo,
	o => \actualizar_externo~input_o\);

-- Location: IOIBUF_X41_Y26_N22
\credito_externo[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_externo(5),
	o => \credito_externo[5]~input_o\);

-- Location: IOIBUF_X37_Y29_N29
\monto_compra[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_monto_compra(0),
	o => \monto_compra[0]~input_o\);

-- Location: IOIBUF_X41_Y26_N8
\credito_externo[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_externo(0),
	o => \credito_externo[0]~input_o\);

-- Location: LCCOMB_X35_Y28_N8
\contador_bloqueo[0]~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[0]~27_combout\ = contador_bloqueo(0) $ (VCC)
-- \contador_bloqueo[0]~28\ = CARRY(contador_bloqueo(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(0),
	datad => VCC,
	combout => \contador_bloqueo[0]~27_combout\,
	cout => \contador_bloqueo[0]~28\);

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

-- Location: IOIBUF_X32_Y29_N29
\compra_en_proceso~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_compra_en_proceso,
	o => \compra_en_proceso~input_o\);

-- Location: IOIBUF_X41_Y27_N8
\sensor_moneda_5~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sensor_moneda_5,
	o => \sensor_moneda_5~input_o\);

-- Location: LCCOMB_X40_Y27_N26
\moneda_5_debounce[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_5_debounce[0]~0_combout\ = !\sensor_moneda_5~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sensor_moneda_5~input_o\,
	combout => \moneda_5_debounce[0]~0_combout\);

-- Location: FF_X40_Y27_N27
\moneda_5_debounce[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \moneda_5_debounce[0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_5_debounce(0));

-- Location: FF_X40_Y27_N21
\moneda_5_debounce[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => moneda_5_debounce(0),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_5_debounce(1));

-- Location: LCCOMB_X40_Y27_N8
\moneda_5_debounce[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_5_debounce[2]~feeder_combout\ = moneda_5_debounce(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => moneda_5_debounce(1),
	combout => \moneda_5_debounce[2]~feeder_combout\);

-- Location: FF_X40_Y27_N9
\moneda_5_debounce[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \moneda_5_debounce[2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_5_debounce(2));

-- Location: FF_X40_Y27_N17
\moneda_5_debounce[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => moneda_5_debounce(2),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_5_debounce(3));

-- Location: LCCOMB_X40_Y27_N10
\moneda_5_debounce[4]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_5_debounce[4]~feeder_combout\ = moneda_5_debounce(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => moneda_5_debounce(3),
	combout => \moneda_5_debounce[4]~feeder_combout\);

-- Location: FF_X40_Y27_N11
\moneda_5_debounce[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \moneda_5_debounce[4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_5_debounce(4));

-- Location: LCCOMB_X40_Y27_N30
\moneda_5_debounce[5]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_5_debounce[5]~feeder_combout\ = moneda_5_debounce(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => moneda_5_debounce(4),
	combout => \moneda_5_debounce[5]~feeder_combout\);

-- Location: FF_X40_Y27_N31
\moneda_5_debounce[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \moneda_5_debounce[5]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_5_debounce(5));

-- Location: FF_X40_Y27_N23
\moneda_5_debounce[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => moneda_5_debounce(5),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_5_debounce(6));

-- Location: FF_X40_Y27_N13
\moneda_5_debounce[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => moneda_5_debounce(6),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_5_debounce(7));

-- Location: LCCOMB_X40_Y27_N12
\moneda_5_estable~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_5_estable~2_combout\ = (moneda_5_debounce(6) & ((\moneda_5_estable~q\) # ((moneda_5_debounce(1) & moneda_5_debounce(7))))) # (!moneda_5_debounce(6) & (\moneda_5_estable~q\ & ((moneda_5_debounce(1)) # (moneda_5_debounce(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => moneda_5_debounce(6),
	datab => moneda_5_debounce(1),
	datac => moneda_5_debounce(7),
	datad => \moneda_5_estable~q\,
	combout => \moneda_5_estable~2_combout\);

-- Location: LCCOMB_X40_Y27_N18
\moneda_5_estable~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_5_estable~1_combout\ = (moneda_5_debounce(4) & ((\moneda_5_estable~q\) # ((moneda_5_debounce(2) & moneda_5_debounce(5))))) # (!moneda_5_debounce(4) & (\moneda_5_estable~q\ & ((moneda_5_debounce(2)) # (moneda_5_debounce(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => moneda_5_debounce(4),
	datab => moneda_5_debounce(2),
	datac => moneda_5_debounce(5),
	datad => \moneda_5_estable~q\,
	combout => \moneda_5_estable~1_combout\);

-- Location: LCCOMB_X40_Y27_N28
\moneda_5_estable~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_5_estable~0_combout\ = (moneda_5_debounce(5) & (moneda_5_debounce(3) & moneda_5_debounce(0))) # (!moneda_5_debounce(5) & ((moneda_5_debounce(3)) # (moneda_5_debounce(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => moneda_5_debounce(5),
	datab => moneda_5_debounce(3),
	datac => moneda_5_debounce(0),
	combout => \moneda_5_estable~0_combout\);

-- Location: LCCOMB_X40_Y27_N24
\moneda_5_estable~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_5_estable~3_combout\ = (\moneda_5_estable~2_combout\ & ((\moneda_5_estable~q\) # ((\moneda_5_estable~1_combout\ & \moneda_5_estable~0_combout\)))) # (!\moneda_5_estable~2_combout\ & (\moneda_5_estable~q\ & ((\moneda_5_estable~1_combout\) # 
-- (\moneda_5_estable~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \moneda_5_estable~2_combout\,
	datab => \moneda_5_estable~1_combout\,
	datac => \moneda_5_estable~q\,
	datad => \moneda_5_estable~0_combout\,
	combout => \moneda_5_estable~3_combout\);

-- Location: FF_X40_Y27_N25
moneda_5_estable : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \moneda_5_estable~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \moneda_5_estable~q\);

-- Location: IOIBUF_X35_Y29_N29
\sensor_moneda_10~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sensor_moneda_10,
	o => \sensor_moneda_10~input_o\);

-- Location: LCCOMB_X36_Y28_N26
\moneda_10_debounce[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_10_debounce[0]~0_combout\ = !\sensor_moneda_10~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sensor_moneda_10~input_o\,
	combout => \moneda_10_debounce[0]~0_combout\);

-- Location: FF_X36_Y28_N27
\moneda_10_debounce[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \moneda_10_debounce[0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_10_debounce(0));

-- Location: FF_X36_Y28_N25
\moneda_10_debounce[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => moneda_10_debounce(0),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_10_debounce(1));

-- Location: LCCOMB_X36_Y28_N22
\moneda_10_debounce[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_10_debounce[2]~feeder_combout\ = moneda_10_debounce(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => moneda_10_debounce(1),
	combout => \moneda_10_debounce[2]~feeder_combout\);

-- Location: FF_X36_Y28_N23
\moneda_10_debounce[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \moneda_10_debounce[2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_10_debounce(2));

-- Location: FF_X36_Y28_N29
\moneda_10_debounce[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => moneda_10_debounce(2),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_10_debounce(3));

-- Location: LCCOMB_X36_Y28_N4
\moneda_10_debounce[4]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_10_debounce[4]~feeder_combout\ = moneda_10_debounce(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => moneda_10_debounce(3),
	combout => \moneda_10_debounce[4]~feeder_combout\);

-- Location: FF_X36_Y28_N5
\moneda_10_debounce[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \moneda_10_debounce[4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_10_debounce(4));

-- Location: FF_X36_Y28_N11
\moneda_10_debounce[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => moneda_10_debounce(4),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_10_debounce(5));

-- Location: LCCOMB_X36_Y28_N10
\moneda_10_estable~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_10_estable~1_combout\ = (moneda_10_debounce(2) & ((\moneda_10_estable~q\) # ((moneda_10_debounce(4) & moneda_10_debounce(5))))) # (!moneda_10_debounce(2) & (\moneda_10_estable~q\ & ((moneda_10_debounce(4)) # (moneda_10_debounce(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => moneda_10_debounce(2),
	datab => moneda_10_debounce(4),
	datac => moneda_10_debounce(5),
	datad => \moneda_10_estable~q\,
	combout => \moneda_10_estable~1_combout\);

-- Location: FF_X36_Y28_N7
\moneda_10_debounce[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => moneda_10_debounce(5),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_10_debounce(6));

-- Location: FF_X36_Y28_N17
\moneda_10_debounce[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => moneda_10_debounce(6),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => moneda_10_debounce(7));

-- Location: LCCOMB_X36_Y28_N16
\moneda_10_estable~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_10_estable~2_combout\ = (moneda_10_debounce(6) & ((\moneda_10_estable~q\) # ((moneda_10_debounce(7) & moneda_10_debounce(1))))) # (!moneda_10_debounce(6) & (\moneda_10_estable~q\ & ((moneda_10_debounce(7)) # (moneda_10_debounce(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => moneda_10_debounce(6),
	datab => \moneda_10_estable~q\,
	datac => moneda_10_debounce(7),
	datad => moneda_10_debounce(1),
	combout => \moneda_10_estable~2_combout\);

-- Location: LCCOMB_X36_Y28_N28
\moneda_10_estable~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_10_estable~0_combout\ = (moneda_10_debounce(0) & ((moneda_10_debounce(3)) # (!moneda_10_debounce(5)))) # (!moneda_10_debounce(0) & (!moneda_10_debounce(5) & moneda_10_debounce(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001010110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => moneda_10_debounce(0),
	datab => moneda_10_debounce(5),
	datac => moneda_10_debounce(3),
	combout => \moneda_10_estable~0_combout\);

-- Location: LCCOMB_X36_Y28_N0
\moneda_10_estable~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_10_estable~3_combout\ = (\moneda_10_estable~1_combout\ & ((\moneda_10_estable~q\) # ((\moneda_10_estable~2_combout\ & \moneda_10_estable~0_combout\)))) # (!\moneda_10_estable~1_combout\ & (\moneda_10_estable~q\ & ((\moneda_10_estable~2_combout\) # 
-- (\moneda_10_estable~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \moneda_10_estable~1_combout\,
	datab => \moneda_10_estable~2_combout\,
	datac => \moneda_10_estable~q\,
	datad => \moneda_10_estable~0_combout\,
	combout => \moneda_10_estable~3_combout\);

-- Location: FF_X36_Y28_N1
moneda_10_estable : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \moneda_10_estable~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \moneda_10_estable~q\);

-- Location: FF_X36_Y28_N15
moneda_10_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \moneda_10_estable~q\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \moneda_10_prev~q\);

-- Location: FF_X40_Y28_N27
moneda_5_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \moneda_5_estable~q\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \moneda_5_prev~q\);

-- Location: LCCOMB_X36_Y28_N12
\contador_bloqueo[21]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[21]~26_combout\ = (\moneda_5_estable~q\ & (\moneda_5_prev~q\ & ((\moneda_10_prev~q\) # (!\moneda_10_estable~q\)))) # (!\moneda_5_estable~q\ & (((\moneda_10_prev~q\)) # (!\moneda_10_estable~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \moneda_5_estable~q\,
	datab => \moneda_10_estable~q\,
	datac => \moneda_10_prev~q\,
	datad => \moneda_5_prev~q\,
	combout => \contador_bloqueo[21]~26_combout\);

-- Location: LCCOMB_X36_Y28_N20
\contador_bloqueo[21]~76\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[21]~76_combout\ = ((!\bloqueo_monedas_int~q\ & (!\compra_en_proceso~input_o\ & !\contador_bloqueo[21]~26_combout\))) # (!\LessThan2~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bloqueo_monedas_int~q\,
	datab => \compra_en_proceso~input_o\,
	datac => \LessThan2~5_combout\,
	datad => \contador_bloqueo[21]~26_combout\,
	combout => \contador_bloqueo[21]~76_combout\);

-- Location: LCCOMB_X36_Y28_N18
\contador_bloqueo[21]~43\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[21]~43_combout\ = (\bloqueo_monedas_int~q\) # ((!\compra_en_proceso~input_o\ & !\contador_bloqueo[21]~26_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bloqueo_monedas_int~q\,
	datac => \compra_en_proceso~input_o\,
	datad => \contador_bloqueo[21]~26_combout\,
	combout => \contador_bloqueo[21]~43_combout\);

-- Location: FF_X35_Y28_N9
\contador_bloqueo[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[0]~27_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(0));

-- Location: LCCOMB_X35_Y28_N10
\contador_bloqueo[1]~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[1]~29_combout\ = (contador_bloqueo(1) & (!\contador_bloqueo[0]~28\)) # (!contador_bloqueo(1) & ((\contador_bloqueo[0]~28\) # (GND)))
-- \contador_bloqueo[1]~30\ = CARRY((!\contador_bloqueo[0]~28\) # (!contador_bloqueo(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo(1),
	datad => VCC,
	cin => \contador_bloqueo[0]~28\,
	combout => \contador_bloqueo[1]~29_combout\,
	cout => \contador_bloqueo[1]~30\);

-- Location: FF_X35_Y28_N11
\contador_bloqueo[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[1]~29_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(1));

-- Location: LCCOMB_X35_Y28_N12
\contador_bloqueo[2]~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[2]~31_combout\ = (contador_bloqueo(2) & (\contador_bloqueo[1]~30\ $ (GND))) # (!contador_bloqueo(2) & (!\contador_bloqueo[1]~30\ & VCC))
-- \contador_bloqueo[2]~32\ = CARRY((contador_bloqueo(2) & !\contador_bloqueo[1]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo(2),
	datad => VCC,
	cin => \contador_bloqueo[1]~30\,
	combout => \contador_bloqueo[2]~31_combout\,
	cout => \contador_bloqueo[2]~32\);

-- Location: FF_X35_Y28_N13
\contador_bloqueo[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[2]~31_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(2));

-- Location: LCCOMB_X35_Y28_N14
\contador_bloqueo[3]~33\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[3]~33_combout\ = (contador_bloqueo(3) & (!\contador_bloqueo[2]~32\)) # (!contador_bloqueo(3) & ((\contador_bloqueo[2]~32\) # (GND)))
-- \contador_bloqueo[3]~34\ = CARRY((!\contador_bloqueo[2]~32\) # (!contador_bloqueo(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(3),
	datad => VCC,
	cin => \contador_bloqueo[2]~32\,
	combout => \contador_bloqueo[3]~33_combout\,
	cout => \contador_bloqueo[3]~34\);

-- Location: FF_X35_Y28_N15
\contador_bloqueo[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[3]~33_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(3));

-- Location: LCCOMB_X35_Y28_N16
\contador_bloqueo[4]~35\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[4]~35_combout\ = (contador_bloqueo(4) & (\contador_bloqueo[3]~34\ $ (GND))) # (!contador_bloqueo(4) & (!\contador_bloqueo[3]~34\ & VCC))
-- \contador_bloqueo[4]~36\ = CARRY((contador_bloqueo(4) & !\contador_bloqueo[3]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(4),
	datad => VCC,
	cin => \contador_bloqueo[3]~34\,
	combout => \contador_bloqueo[4]~35_combout\,
	cout => \contador_bloqueo[4]~36\);

-- Location: FF_X35_Y28_N17
\contador_bloqueo[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[4]~35_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(4));

-- Location: LCCOMB_X35_Y28_N18
\contador_bloqueo[5]~37\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[5]~37_combout\ = (contador_bloqueo(5) & (!\contador_bloqueo[4]~36\)) # (!contador_bloqueo(5) & ((\contador_bloqueo[4]~36\) # (GND)))
-- \contador_bloqueo[5]~38\ = CARRY((!\contador_bloqueo[4]~36\) # (!contador_bloqueo(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(5),
	datad => VCC,
	cin => \contador_bloqueo[4]~36\,
	combout => \contador_bloqueo[5]~37_combout\,
	cout => \contador_bloqueo[5]~38\);

-- Location: FF_X35_Y28_N19
\contador_bloqueo[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[5]~37_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(5));

-- Location: LCCOMB_X35_Y28_N20
\contador_bloqueo[6]~39\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[6]~39_combout\ = (contador_bloqueo(6) & (\contador_bloqueo[5]~38\ $ (GND))) # (!contador_bloqueo(6) & (!\contador_bloqueo[5]~38\ & VCC))
-- \contador_bloqueo[6]~40\ = CARRY((contador_bloqueo(6) & !\contador_bloqueo[5]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(6),
	datad => VCC,
	cin => \contador_bloqueo[5]~38\,
	combout => \contador_bloqueo[6]~39_combout\,
	cout => \contador_bloqueo[6]~40\);

-- Location: FF_X35_Y28_N21
\contador_bloqueo[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[6]~39_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(6));

-- Location: LCCOMB_X35_Y28_N22
\contador_bloqueo[7]~41\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[7]~41_combout\ = (contador_bloqueo(7) & (!\contador_bloqueo[6]~40\)) # (!contador_bloqueo(7) & ((\contador_bloqueo[6]~40\) # (GND)))
-- \contador_bloqueo[7]~42\ = CARRY((!\contador_bloqueo[6]~40\) # (!contador_bloqueo(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo(7),
	datad => VCC,
	cin => \contador_bloqueo[6]~40\,
	combout => \contador_bloqueo[7]~41_combout\,
	cout => \contador_bloqueo[7]~42\);

-- Location: FF_X35_Y28_N23
\contador_bloqueo[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[7]~41_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(7));

-- Location: LCCOMB_X35_Y28_N24
\contador_bloqueo[8]~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[8]~44_combout\ = (contador_bloqueo(8) & (\contador_bloqueo[7]~42\ $ (GND))) # (!contador_bloqueo(8) & (!\contador_bloqueo[7]~42\ & VCC))
-- \contador_bloqueo[8]~45\ = CARRY((contador_bloqueo(8) & !\contador_bloqueo[7]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(8),
	datad => VCC,
	cin => \contador_bloqueo[7]~42\,
	combout => \contador_bloqueo[8]~44_combout\,
	cout => \contador_bloqueo[8]~45\);

-- Location: FF_X35_Y28_N25
\contador_bloqueo[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[8]~44_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(8));

-- Location: LCCOMB_X35_Y28_N26
\contador_bloqueo[9]~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[9]~46_combout\ = (contador_bloqueo(9) & (!\contador_bloqueo[8]~45\)) # (!contador_bloqueo(9) & ((\contador_bloqueo[8]~45\) # (GND)))
-- \contador_bloqueo[9]~47\ = CARRY((!\contador_bloqueo[8]~45\) # (!contador_bloqueo(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo(9),
	datad => VCC,
	cin => \contador_bloqueo[8]~45\,
	combout => \contador_bloqueo[9]~46_combout\,
	cout => \contador_bloqueo[9]~47\);

-- Location: FF_X35_Y28_N27
\contador_bloqueo[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[9]~46_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(9));

-- Location: LCCOMB_X35_Y28_N28
\contador_bloqueo[10]~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[10]~48_combout\ = (contador_bloqueo(10) & (\contador_bloqueo[9]~47\ $ (GND))) # (!contador_bloqueo(10) & (!\contador_bloqueo[9]~47\ & VCC))
-- \contador_bloqueo[10]~49\ = CARRY((contador_bloqueo(10) & !\contador_bloqueo[9]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(10),
	datad => VCC,
	cin => \contador_bloqueo[9]~47\,
	combout => \contador_bloqueo[10]~48_combout\,
	cout => \contador_bloqueo[10]~49\);

-- Location: FF_X35_Y28_N29
\contador_bloqueo[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[10]~48_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(10));

-- Location: LCCOMB_X35_Y28_N30
\contador_bloqueo[11]~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[11]~50_combout\ = (contador_bloqueo(11) & (!\contador_bloqueo[10]~49\)) # (!contador_bloqueo(11) & ((\contador_bloqueo[10]~49\) # (GND)))
-- \contador_bloqueo[11]~51\ = CARRY((!\contador_bloqueo[10]~49\) # (!contador_bloqueo(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo(11),
	datad => VCC,
	cin => \contador_bloqueo[10]~49\,
	combout => \contador_bloqueo[11]~50_combout\,
	cout => \contador_bloqueo[11]~51\);

-- Location: FF_X35_Y28_N31
\contador_bloqueo[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[11]~50_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(11));

-- Location: LCCOMB_X35_Y27_N0
\contador_bloqueo[12]~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[12]~52_combout\ = (contador_bloqueo(12) & (\contador_bloqueo[11]~51\ $ (GND))) # (!contador_bloqueo(12) & (!\contador_bloqueo[11]~51\ & VCC))
-- \contador_bloqueo[12]~53\ = CARRY((contador_bloqueo(12) & !\contador_bloqueo[11]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(12),
	datad => VCC,
	cin => \contador_bloqueo[11]~51\,
	combout => \contador_bloqueo[12]~52_combout\,
	cout => \contador_bloqueo[12]~53\);

-- Location: FF_X35_Y27_N1
\contador_bloqueo[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[12]~52_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(12));

-- Location: LCCOMB_X35_Y27_N2
\contador_bloqueo[13]~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[13]~54_combout\ = (contador_bloqueo(13) & (!\contador_bloqueo[12]~53\)) # (!contador_bloqueo(13) & ((\contador_bloqueo[12]~53\) # (GND)))
-- \contador_bloqueo[13]~55\ = CARRY((!\contador_bloqueo[12]~53\) # (!contador_bloqueo(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(13),
	datad => VCC,
	cin => \contador_bloqueo[12]~53\,
	combout => \contador_bloqueo[13]~54_combout\,
	cout => \contador_bloqueo[13]~55\);

-- Location: FF_X35_Y27_N3
\contador_bloqueo[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[13]~54_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(13));

-- Location: LCCOMB_X35_Y27_N4
\contador_bloqueo[14]~56\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[14]~56_combout\ = (contador_bloqueo(14) & (\contador_bloqueo[13]~55\ $ (GND))) # (!contador_bloqueo(14) & (!\contador_bloqueo[13]~55\ & VCC))
-- \contador_bloqueo[14]~57\ = CARRY((contador_bloqueo(14) & !\contador_bloqueo[13]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(14),
	datad => VCC,
	cin => \contador_bloqueo[13]~55\,
	combout => \contador_bloqueo[14]~56_combout\,
	cout => \contador_bloqueo[14]~57\);

-- Location: FF_X35_Y27_N5
\contador_bloqueo[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[14]~56_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(14));

-- Location: LCCOMB_X35_Y27_N6
\contador_bloqueo[15]~58\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[15]~58_combout\ = (contador_bloqueo(15) & (!\contador_bloqueo[14]~57\)) # (!contador_bloqueo(15) & ((\contador_bloqueo[14]~57\) # (GND)))
-- \contador_bloqueo[15]~59\ = CARRY((!\contador_bloqueo[14]~57\) # (!contador_bloqueo(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo(15),
	datad => VCC,
	cin => \contador_bloqueo[14]~57\,
	combout => \contador_bloqueo[15]~58_combout\,
	cout => \contador_bloqueo[15]~59\);

-- Location: FF_X35_Y27_N7
\contador_bloqueo[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[15]~58_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(15));

-- Location: LCCOMB_X35_Y27_N8
\contador_bloqueo[16]~60\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[16]~60_combout\ = (contador_bloqueo(16) & (\contador_bloqueo[15]~59\ $ (GND))) # (!contador_bloqueo(16) & (!\contador_bloqueo[15]~59\ & VCC))
-- \contador_bloqueo[16]~61\ = CARRY((contador_bloqueo(16) & !\contador_bloqueo[15]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(16),
	datad => VCC,
	cin => \contador_bloqueo[15]~59\,
	combout => \contador_bloqueo[16]~60_combout\,
	cout => \contador_bloqueo[16]~61\);

-- Location: FF_X35_Y27_N9
\contador_bloqueo[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[16]~60_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(16));

-- Location: LCCOMB_X35_Y27_N10
\contador_bloqueo[17]~62\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[17]~62_combout\ = (contador_bloqueo(17) & (!\contador_bloqueo[16]~61\)) # (!contador_bloqueo(17) & ((\contador_bloqueo[16]~61\) # (GND)))
-- \contador_bloqueo[17]~63\ = CARRY((!\contador_bloqueo[16]~61\) # (!contador_bloqueo(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo(17),
	datad => VCC,
	cin => \contador_bloqueo[16]~61\,
	combout => \contador_bloqueo[17]~62_combout\,
	cout => \contador_bloqueo[17]~63\);

-- Location: FF_X35_Y27_N11
\contador_bloqueo[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[17]~62_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(17));

-- Location: LCCOMB_X35_Y27_N12
\contador_bloqueo[18]~64\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[18]~64_combout\ = (contador_bloqueo(18) & (\contador_bloqueo[17]~63\ $ (GND))) # (!contador_bloqueo(18) & (!\contador_bloqueo[17]~63\ & VCC))
-- \contador_bloqueo[18]~65\ = CARRY((contador_bloqueo(18) & !\contador_bloqueo[17]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo(18),
	datad => VCC,
	cin => \contador_bloqueo[17]~63\,
	combout => \contador_bloqueo[18]~64_combout\,
	cout => \contador_bloqueo[18]~65\);

-- Location: FF_X35_Y27_N13
\contador_bloqueo[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[18]~64_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(18));

-- Location: LCCOMB_X35_Y27_N26
\LessThan2~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~3_combout\ = (!contador_bloqueo(18) & (!contador_bloqueo(16) & !contador_bloqueo(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo(18),
	datac => contador_bloqueo(16),
	datad => contador_bloqueo(17),
	combout => \LessThan2~3_combout\);

-- Location: LCCOMB_X35_Y28_N0
\LessThan2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (((!contador_bloqueo(7) & !contador_bloqueo(8))) # (!contador_bloqueo(9))) # (!contador_bloqueo(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo(7),
	datab => contador_bloqueo(10),
	datac => contador_bloqueo(9),
	datad => contador_bloqueo(8),
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X35_Y28_N6
\LessThan2~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = ((!contador_bloqueo(11) & \LessThan2~0_combout\)) # (!contador_bloqueo(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(12),
	datac => contador_bloqueo(11),
	datad => \LessThan2~0_combout\,
	combout => \LessThan2~1_combout\);

-- Location: LCCOMB_X35_Y27_N24
\LessThan2~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~2_combout\ = ((!contador_bloqueo(14) & (\LessThan2~1_combout\ & !contador_bloqueo(13)))) # (!contador_bloqueo(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo(15),
	datab => contador_bloqueo(14),
	datac => \LessThan2~1_combout\,
	datad => contador_bloqueo(13),
	combout => \LessThan2~2_combout\);

-- Location: LCCOMB_X35_Y27_N14
\contador_bloqueo[19]~66\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[19]~66_combout\ = (contador_bloqueo(19) & (!\contador_bloqueo[18]~65\)) # (!contador_bloqueo(19) & ((\contador_bloqueo[18]~65\) # (GND)))
-- \contador_bloqueo[19]~67\ = CARRY((!\contador_bloqueo[18]~65\) # (!contador_bloqueo(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(19),
	datad => VCC,
	cin => \contador_bloqueo[18]~65\,
	combout => \contador_bloqueo[19]~66_combout\,
	cout => \contador_bloqueo[19]~67\);

-- Location: FF_X35_Y27_N15
\contador_bloqueo[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[19]~66_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(19));

-- Location: LCCOMB_X35_Y27_N16
\contador_bloqueo[20]~68\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[20]~68_combout\ = (contador_bloqueo(20) & (\contador_bloqueo[19]~67\ $ (GND))) # (!contador_bloqueo(20) & (!\contador_bloqueo[19]~67\ & VCC))
-- \contador_bloqueo[20]~69\ = CARRY((contador_bloqueo(20) & !\contador_bloqueo[19]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(20),
	datad => VCC,
	cin => \contador_bloqueo[19]~67\,
	combout => \contador_bloqueo[20]~68_combout\,
	cout => \contador_bloqueo[20]~69\);

-- Location: FF_X35_Y27_N17
\contador_bloqueo[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[20]~68_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(20));

-- Location: LCCOMB_X35_Y27_N28
\LessThan2~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~4_combout\ = (((\LessThan2~3_combout\ & \LessThan2~2_combout\)) # (!contador_bloqueo(20))) # (!contador_bloqueo(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~3_combout\,
	datab => \LessThan2~2_combout\,
	datac => contador_bloqueo(19),
	datad => contador_bloqueo(20),
	combout => \LessThan2~4_combout\);

-- Location: LCCOMB_X35_Y27_N18
\contador_bloqueo[21]~70\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[21]~70_combout\ = (contador_bloqueo(21) & (!\contador_bloqueo[20]~69\)) # (!contador_bloqueo(21) & ((\contador_bloqueo[20]~69\) # (GND)))
-- \contador_bloqueo[21]~71\ = CARRY((!\contador_bloqueo[20]~69\) # (!contador_bloqueo(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(21),
	datad => VCC,
	cin => \contador_bloqueo[20]~69\,
	combout => \contador_bloqueo[21]~70_combout\,
	cout => \contador_bloqueo[21]~71\);

-- Location: FF_X35_Y27_N19
\contador_bloqueo[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[21]~70_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(21));

-- Location: LCCOMB_X35_Y27_N20
\contador_bloqueo[22]~72\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[22]~72_combout\ = (contador_bloqueo(22) & (\contador_bloqueo[21]~71\ $ (GND))) # (!contador_bloqueo(22) & (!\contador_bloqueo[21]~71\ & VCC))
-- \contador_bloqueo[22]~73\ = CARRY((contador_bloqueo(22) & !\contador_bloqueo[21]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo(22),
	datad => VCC,
	cin => \contador_bloqueo[21]~71\,
	combout => \contador_bloqueo[22]~72_combout\,
	cout => \contador_bloqueo[22]~73\);

-- Location: FF_X35_Y27_N21
\contador_bloqueo[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[22]~72_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(22));

-- Location: LCCOMB_X35_Y27_N22
\contador_bloqueo[23]~74\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo[23]~74_combout\ = contador_bloqueo(23) $ (\contador_bloqueo[22]~73\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo(23),
	cin => \contador_bloqueo[22]~73\,
	combout => \contador_bloqueo[23]~74_combout\);

-- Location: FF_X35_Y27_N23
\contador_bloqueo[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo[23]~74_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo[21]~76_combout\,
	ena => \contador_bloqueo[21]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo(23));

-- Location: LCCOMB_X35_Y27_N30
\LessThan2~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~5_combout\ = ((\LessThan2~4_combout\ & (!contador_bloqueo(21) & !contador_bloqueo(22)))) # (!contador_bloqueo(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~4_combout\,
	datab => contador_bloqueo(21),
	datac => contador_bloqueo(23),
	datad => contador_bloqueo(22),
	combout => \LessThan2~5_combout\);

-- Location: LCCOMB_X36_Y28_N30
\bloqueo_monedas_int~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \bloqueo_monedas_int~0_combout\ = (\bloqueo_monedas_int~q\ & (\LessThan2~5_combout\)) # (!\bloqueo_monedas_int~q\ & (((!\compra_en_proceso~input_o\ & !\contador_bloqueo[21]~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~5_combout\,
	datab => \compra_en_proceso~input_o\,
	datac => \bloqueo_monedas_int~q\,
	datad => \contador_bloqueo[21]~26_combout\,
	combout => \bloqueo_monedas_int~0_combout\);

-- Location: FF_X36_Y28_N31
bloqueo_monedas_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \bloqueo_monedas_int~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bloqueo_monedas_int~q\);

-- Location: LCCOMB_X36_Y28_N2
\process_0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (\bloqueo_monedas_int~q\) # (\compra_en_proceso~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bloqueo_monedas_int~q\,
	datac => \compra_en_proceso~input_o\,
	combout => \process_0~0_combout\);

-- Location: LCCOMB_X40_Y28_N8
\Add3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = \Add0~17_combout\ $ (VCC)
-- \Add3~1\ = CARRY(\Add0~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~17_combout\,
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

-- Location: LCCOMB_X40_Y28_N2
\nuevo_credito~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~16_combout\ = (\process_0~0_combout\ & (\Add0~17_combout\)) # (!\process_0~0_combout\ & ((\nuevo_credito~9_combout\ & ((\Add3~0_combout\))) # (!\nuevo_credito~9_combout\ & (\Add0~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Add0~17_combout\,
	datac => \Add3~0_combout\,
	datad => \nuevo_credito~9_combout\,
	combout => \nuevo_credito~16_combout\);

-- Location: FF_X40_Y28_N3
\credito_total_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \nuevo_credito~16_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_total_int(0));

-- Location: LCCOMB_X40_Y28_N0
\nuevo_credito~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~6_combout\ = (\actualizar_externo~input_o\ & (\credito_externo[0]~input_o\)) # (!\actualizar_externo~input_o\ & ((credito_total_int(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actualizar_externo~input_o\,
	datac => \credito_externo[0]~input_o\,
	datad => credito_total_int(0),
	combout => \nuevo_credito~6_combout\);

-- Location: LCCOMB_X37_Y28_N12
\Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (\monto_compra[0]~input_o\ & (\nuevo_credito~6_combout\ $ (VCC))) # (!\monto_compra[0]~input_o\ & ((\nuevo_credito~6_combout\) # (GND)))
-- \Add0~1\ = CARRY((\nuevo_credito~6_combout\) # (!\monto_compra[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \monto_compra[0]~input_o\,
	datab => \nuevo_credito~6_combout\,
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: IOIBUF_X41_Y26_N15
\monto_compra[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_monto_compra(6),
	o => \monto_compra[6]~input_o\);

-- Location: IOIBUF_X39_Y29_N15
\credito_externo[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_externo(6),
	o => \credito_externo[6]~input_o\);

-- Location: IOIBUF_X37_Y29_N1
\monto_compra[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_monto_compra(5),
	o => \monto_compra[5]~input_o\);

-- Location: IOIBUF_X35_Y29_N22
\monto_compra[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_monto_compra(4),
	o => \monto_compra[4]~input_o\);

-- Location: IOIBUF_X39_Y29_N22
\credito_externo[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_externo(4),
	o => \credito_externo[4]~input_o\);

-- Location: IOIBUF_X37_Y29_N22
\monto_compra[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_monto_compra(3),
	o => \monto_compra[3]~input_o\);

-- Location: IOIBUF_X41_Y25_N1
\credito_externo[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_externo(3),
	o => \credito_externo[3]~input_o\);

-- Location: LCCOMB_X36_Y28_N14
\process_0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \process_0~1_combout\ = (!\moneda_10_prev~q\ & \moneda_10_estable~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \moneda_10_prev~q\,
	datad => \moneda_10_estable~q\,
	combout => \process_0~1_combout\);

-- Location: IOIBUF_X39_Y29_N8
\monto_compra[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_monto_compra(2),
	o => \monto_compra[2]~input_o\);

-- Location: IOIBUF_X32_Y29_N22
\credito_externo[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_externo(2),
	o => \credito_externo[2]~input_o\);

-- Location: IOIBUF_X39_Y29_N1
\credito_externo[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_credito_externo(1),
	o => \credito_externo[1]~input_o\);

-- Location: IOIBUF_X37_Y29_N8
\monto_compra[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_monto_compra(1),
	o => \monto_compra[1]~input_o\);

-- Location: LCCOMB_X37_Y28_N14
\Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\nuevo_credito~5_combout\ & ((\monto_compra[1]~input_o\ & (!\Add0~1\)) # (!\monto_compra[1]~input_o\ & (\Add0~1\ & VCC)))) # (!\nuevo_credito~5_combout\ & ((\monto_compra[1]~input_o\ & ((\Add0~1\) # (GND))) # 
-- (!\monto_compra[1]~input_o\ & (!\Add0~1\))))
-- \Add0~3\ = CARRY((\nuevo_credito~5_combout\ & (\monto_compra[1]~input_o\ & !\Add0~1\)) # (!\nuevo_credito~5_combout\ & ((\monto_compra[1]~input_o\) # (!\Add0~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \nuevo_credito~5_combout\,
	datab => \monto_compra[1]~input_o\,
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X38_Y28_N6
\Add0~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (\actualizar_credito~input_o\ & (\Add0~2_combout\ & ((!\LessThan0~12_combout\)))) # (!\actualizar_credito~input_o\ & (((\nuevo_credito~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~2_combout\,
	datab => \actualizar_credito~input_o\,
	datac => \nuevo_credito~5_combout\,
	datad => \LessThan0~12_combout\,
	combout => \Add0~18_combout\);

-- Location: LCCOMB_X40_Y28_N10
\Add3~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (\Add0~18_combout\ & (!\Add3~1\)) # (!\Add0~18_combout\ & ((\Add3~1\) # (GND)))
-- \Add3~3\ = CARRY((!\Add3~1\) # (!\Add0~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~18_combout\,
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: LCCOMB_X40_Y28_N22
\nuevo_credito~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~14_combout\ = (\nuevo_credito~9_combout\ & (\Add3~2_combout\)) # (!\nuevo_credito~9_combout\ & ((\Add0~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~2_combout\,
	datac => \Add0~18_combout\,
	datad => \nuevo_credito~9_combout\,
	combout => \nuevo_credito~14_combout\);

-- Location: LCCOMB_X39_Y28_N14
\credito_total_int[1]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_total_int[1]~6_combout\ = (\moneda_10_detectada_int~2_combout\ & (\nuevo_credito~14_combout\ $ (VCC))) # (!\moneda_10_detectada_int~2_combout\ & (\nuevo_credito~14_combout\ & VCC))
-- \credito_total_int[1]~7\ = CARRY((\moneda_10_detectada_int~2_combout\ & \nuevo_credito~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \moneda_10_detectada_int~2_combout\,
	datab => \nuevo_credito~14_combout\,
	datad => VCC,
	combout => \credito_total_int[1]~6_combout\,
	cout => \credito_total_int[1]~7\);

-- Location: FF_X39_Y28_N15
\credito_total_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \credito_total_int[1]~6_combout\,
	asdata => \Add0~18_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_total_int(1));

-- Location: LCCOMB_X38_Y28_N30
\nuevo_credito~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~5_combout\ = (\actualizar_externo~input_o\ & (\credito_externo[1]~input_o\)) # (!\actualizar_externo~input_o\ & ((credito_total_int(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \credito_externo[1]~input_o\,
	datac => credito_total_int(1),
	datad => \actualizar_externo~input_o\,
	combout => \nuevo_credito~5_combout\);

-- Location: LCCOMB_X37_Y28_N16
\Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = ((\monto_compra[2]~input_o\ $ (\nuevo_credito~4_combout\ $ (\Add0~3\)))) # (GND)
-- \Add0~5\ = CARRY((\monto_compra[2]~input_o\ & (\nuevo_credito~4_combout\ & !\Add0~3\)) # (!\monto_compra[2]~input_o\ & ((\nuevo_credito~4_combout\) # (!\Add0~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \monto_compra[2]~input_o\,
	datab => \nuevo_credito~4_combout\,
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X40_Y28_N4
\Add0~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (\actualizar_credito~input_o\ & (((!\LessThan0~12_combout\ & \Add0~4_combout\)))) # (!\actualizar_credito~input_o\ & (\nuevo_credito~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actualizar_credito~input_o\,
	datab => \nuevo_credito~4_combout\,
	datac => \LessThan0~12_combout\,
	datad => \Add0~4_combout\,
	combout => \Add0~16_combout\);

-- Location: LCCOMB_X40_Y28_N12
\Add3~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = (\Add0~16_combout\ & ((GND) # (!\Add3~3\))) # (!\Add0~16_combout\ & (\Add3~3\ $ (GND)))
-- \Add3~5\ = CARRY((\Add0~16_combout\) # (!\Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~16_combout\,
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: LCCOMB_X39_Y28_N4
\nuevo_credito~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~13_combout\ = (\nuevo_credito~9_combout\ & ((\Add3~4_combout\))) # (!\nuevo_credito~9_combout\ & (\Add0~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~16_combout\,
	datac => \Add3~4_combout\,
	datad => \nuevo_credito~9_combout\,
	combout => \nuevo_credito~13_combout\);

-- Location: LCCOMB_X39_Y28_N16
\credito_total_int[2]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_total_int[2]~8_combout\ = (\nuevo_credito~13_combout\ & (!\credito_total_int[1]~7\)) # (!\nuevo_credito~13_combout\ & ((\credito_total_int[1]~7\) # (GND)))
-- \credito_total_int[2]~9\ = CARRY((!\credito_total_int[1]~7\) # (!\nuevo_credito~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \nuevo_credito~13_combout\,
	datad => VCC,
	cin => \credito_total_int[1]~7\,
	combout => \credito_total_int[2]~8_combout\,
	cout => \credito_total_int[2]~9\);

-- Location: FF_X39_Y28_N17
\credito_total_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \credito_total_int[2]~8_combout\,
	asdata => \Add0~16_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_total_int(2));

-- Location: LCCOMB_X38_Y28_N0
\nuevo_credito~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~4_combout\ = (\actualizar_externo~input_o\ & (\credito_externo[2]~input_o\)) # (!\actualizar_externo~input_o\ & ((credito_total_int(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actualizar_externo~input_o\,
	datac => \credito_externo[2]~input_o\,
	datad => credito_total_int(2),
	combout => \nuevo_credito~4_combout\);

-- Location: LCCOMB_X37_Y28_N18
\Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\monto_compra[3]~input_o\ & ((\nuevo_credito~3_combout\ & (!\Add0~5\)) # (!\nuevo_credito~3_combout\ & ((\Add0~5\) # (GND))))) # (!\monto_compra[3]~input_o\ & ((\nuevo_credito~3_combout\ & (\Add0~5\ & VCC)) # 
-- (!\nuevo_credito~3_combout\ & (!\Add0~5\))))
-- \Add0~7\ = CARRY((\monto_compra[3]~input_o\ & ((!\Add0~5\) # (!\nuevo_credito~3_combout\))) # (!\monto_compra[3]~input_o\ & (!\nuevo_credito~3_combout\ & !\Add0~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \monto_compra[3]~input_o\,
	datab => \nuevo_credito~3_combout\,
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X40_Y28_N30
\Add0~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~19_combout\ = (\actualizar_credito~input_o\ & (((!\LessThan0~12_combout\ & \Add0~6_combout\)))) # (!\actualizar_credito~input_o\ & (\nuevo_credito~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actualizar_credito~input_o\,
	datab => \nuevo_credito~3_combout\,
	datac => \LessThan0~12_combout\,
	datad => \Add0~6_combout\,
	combout => \Add0~19_combout\);

-- Location: LCCOMB_X40_Y28_N14
\Add3~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (\Add0~19_combout\ & (!\Add3~5\)) # (!\Add0~19_combout\ & ((\Add3~5\) # (GND)))
-- \Add3~7\ = CARRY((!\Add3~5\) # (!\Add0~19_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~19_combout\,
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: LCCOMB_X39_Y28_N30
\nuevo_credito~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~12_combout\ = (\nuevo_credito~9_combout\ & ((\Add3~6_combout\))) # (!\nuevo_credito~9_combout\ & (\Add0~19_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~19_combout\,
	datac => \Add3~6_combout\,
	datad => \nuevo_credito~9_combout\,
	combout => \nuevo_credito~12_combout\);

-- Location: LCCOMB_X39_Y28_N6
\LessThan4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan4~0_combout\ = (\nuevo_credito~11_combout\ & ((\nuevo_credito~12_combout\) # ((\nuevo_credito~13_combout\ & \nuevo_credito~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nuevo_credito~12_combout\,
	datab => \nuevo_credito~11_combout\,
	datac => \nuevo_credito~13_combout\,
	datad => \nuevo_credito~14_combout\,
	combout => \LessThan4~0_combout\);

-- Location: LCCOMB_X39_Y28_N10
\moneda_10_detectada_int~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_10_detectada_int~2_combout\ = (\process_0~1_combout\ & (((!\nuevo_credito~10_combout\ & !\LessThan4~0_combout\)) # (!\nuevo_credito~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~1_combout\,
	datab => \nuevo_credito~10_combout\,
	datac => \nuevo_credito~15_combout\,
	datad => \LessThan4~0_combout\,
	combout => \moneda_10_detectada_int~2_combout\);

-- Location: LCCOMB_X39_Y28_N18
\credito_total_int[3]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_total_int[3]~10_combout\ = ((\moneda_10_detectada_int~2_combout\ $ (\nuevo_credito~12_combout\ $ (!\credito_total_int[2]~9\)))) # (GND)
-- \credito_total_int[3]~11\ = CARRY((\moneda_10_detectada_int~2_combout\ & ((\nuevo_credito~12_combout\) # (!\credito_total_int[2]~9\))) # (!\moneda_10_detectada_int~2_combout\ & (\nuevo_credito~12_combout\ & !\credito_total_int[2]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \moneda_10_detectada_int~2_combout\,
	datab => \nuevo_credito~12_combout\,
	datad => VCC,
	cin => \credito_total_int[2]~9\,
	combout => \credito_total_int[3]~10_combout\,
	cout => \credito_total_int[3]~11\);

-- Location: FF_X39_Y28_N19
\credito_total_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \credito_total_int[3]~10_combout\,
	asdata => \Add0~19_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_total_int(3));

-- Location: LCCOMB_X38_Y28_N10
\nuevo_credito~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~3_combout\ = (\actualizar_externo~input_o\ & (\credito_externo[3]~input_o\)) # (!\actualizar_externo~input_o\ & ((credito_total_int(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actualizar_externo~input_o\,
	datac => \credito_externo[3]~input_o\,
	datad => credito_total_int(3),
	combout => \nuevo_credito~3_combout\);

-- Location: LCCOMB_X37_Y28_N20
\Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = ((\monto_compra[4]~input_o\ $ (\nuevo_credito~2_combout\ $ (\Add0~7\)))) # (GND)
-- \Add0~9\ = CARRY((\monto_compra[4]~input_o\ & (\nuevo_credito~2_combout\ & !\Add0~7\)) # (!\monto_compra[4]~input_o\ & ((\nuevo_credito~2_combout\) # (!\Add0~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \monto_compra[4]~input_o\,
	datab => \nuevo_credito~2_combout\,
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X40_Y28_N28
\Add0~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (\actualizar_credito~input_o\ & (((!\LessThan0~12_combout\ & \Add0~8_combout\)))) # (!\actualizar_credito~input_o\ & (\nuevo_credito~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actualizar_credito~input_o\,
	datab => \nuevo_credito~2_combout\,
	datac => \LessThan0~12_combout\,
	datad => \Add0~8_combout\,
	combout => \Add0~20_combout\);

-- Location: LCCOMB_X40_Y28_N16
\Add3~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = (\Add0~20_combout\ & (\Add3~7\ $ (GND))) # (!\Add0~20_combout\ & (!\Add3~7\ & VCC))
-- \Add3~9\ = CARRY((\Add0~20_combout\ & !\Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~20_combout\,
	datad => VCC,
	cin => \Add3~7\,
	combout => \Add3~8_combout\,
	cout => \Add3~9\);

-- Location: LCCOMB_X39_Y28_N0
\nuevo_credito~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~11_combout\ = (\nuevo_credito~9_combout\ & ((\Add3~8_combout\))) # (!\nuevo_credito~9_combout\ & (\Add0~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nuevo_credito~9_combout\,
	datab => \Add0~20_combout\,
	datad => \Add3~8_combout\,
	combout => \nuevo_credito~11_combout\);

-- Location: LCCOMB_X39_Y28_N20
\credito_total_int[4]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_total_int[4]~12_combout\ = (\nuevo_credito~11_combout\ & (!\credito_total_int[3]~11\)) # (!\nuevo_credito~11_combout\ & ((\credito_total_int[3]~11\) # (GND)))
-- \credito_total_int[4]~13\ = CARRY((!\credito_total_int[3]~11\) # (!\nuevo_credito~11_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \nuevo_credito~11_combout\,
	datad => VCC,
	cin => \credito_total_int[3]~11\,
	combout => \credito_total_int[4]~12_combout\,
	cout => \credito_total_int[4]~13\);

-- Location: FF_X39_Y28_N21
\credito_total_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \credito_total_int[4]~12_combout\,
	asdata => \Add0~20_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_total_int(4));

-- Location: LCCOMB_X38_Y28_N12
\nuevo_credito~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~2_combout\ = (\actualizar_externo~input_o\ & (\credito_externo[4]~input_o\)) # (!\actualizar_externo~input_o\ & ((credito_total_int(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \credito_externo[4]~input_o\,
	datac => credito_total_int(4),
	datad => \actualizar_externo~input_o\,
	combout => \nuevo_credito~2_combout\);

-- Location: LCCOMB_X37_Y28_N22
\Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (\nuevo_credito~1_combout\ & ((\monto_compra[5]~input_o\ & (!\Add0~9\)) # (!\monto_compra[5]~input_o\ & (\Add0~9\ & VCC)))) # (!\nuevo_credito~1_combout\ & ((\monto_compra[5]~input_o\ & ((\Add0~9\) # (GND))) # 
-- (!\monto_compra[5]~input_o\ & (!\Add0~9\))))
-- \Add0~11\ = CARRY((\nuevo_credito~1_combout\ & (\monto_compra[5]~input_o\ & !\Add0~9\)) # (!\nuevo_credito~1_combout\ & ((\monto_compra[5]~input_o\) # (!\Add0~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \nuevo_credito~1_combout\,
	datab => \monto_compra[5]~input_o\,
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X37_Y28_N24
\Add0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = \monto_compra[6]~input_o\ $ (\Add0~11\ $ (\nuevo_credito~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \monto_compra[6]~input_o\,
	datad => \nuevo_credito~0_combout\,
	cin => \Add0~11\,
	combout => \Add0~12_combout\);

-- Location: LCCOMB_X38_Y28_N8
\Add0~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (\actualizar_credito~input_o\ & (((!\LessThan0~12_combout\ & \Add0~12_combout\)))) # (!\actualizar_credito~input_o\ & (\nuevo_credito~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nuevo_credito~0_combout\,
	datab => \actualizar_credito~input_o\,
	datac => \LessThan0~12_combout\,
	datad => \Add0~12_combout\,
	combout => \Add0~14_combout\);

-- Location: LCCOMB_X40_Y28_N18
\Add3~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~10_combout\ = (\Add0~15_combout\ & (!\Add3~9\)) # (!\Add0~15_combout\ & ((\Add3~9\) # (GND)))
-- \Add3~11\ = CARRY((!\Add3~9\) # (!\Add0~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~15_combout\,
	datad => VCC,
	cin => \Add3~9\,
	combout => \Add3~10_combout\,
	cout => \Add3~11\);

-- Location: LCCOMB_X40_Y28_N20
\Add3~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~12_combout\ = \Add3~11\ $ (!\Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Add0~14_combout\,
	cin => \Add3~11\,
	combout => \Add3~12_combout\);

-- Location: LCCOMB_X39_Y28_N8
\nuevo_credito~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~15_combout\ = (\nuevo_credito~9_combout\ & ((\Add3~12_combout\))) # (!\nuevo_credito~9_combout\ & (\Add0~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~14_combout\,
	datac => \Add3~12_combout\,
	datad => \nuevo_credito~9_combout\,
	combout => \nuevo_credito~15_combout\);

-- Location: LCCOMB_X39_Y28_N22
\credito_total_int[5]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_total_int[5]~14_combout\ = (\nuevo_credito~10_combout\ & (\credito_total_int[4]~13\ $ (GND))) # (!\nuevo_credito~10_combout\ & (!\credito_total_int[4]~13\ & VCC))
-- \credito_total_int[5]~15\ = CARRY((\nuevo_credito~10_combout\ & !\credito_total_int[4]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \nuevo_credito~10_combout\,
	datad => VCC,
	cin => \credito_total_int[4]~13\,
	combout => \credito_total_int[5]~14_combout\,
	cout => \credito_total_int[5]~15\);

-- Location: LCCOMB_X39_Y28_N24
\credito_total_int[6]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \credito_total_int[6]~16_combout\ = \credito_total_int[5]~15\ $ (\nuevo_credito~15_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \nuevo_credito~15_combout\,
	cin => \credito_total_int[5]~15\,
	combout => \credito_total_int[6]~16_combout\);

-- Location: FF_X39_Y28_N25
\credito_total_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \credito_total_int[6]~16_combout\,
	asdata => \Add0~14_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_total_int(6));

-- Location: LCCOMB_X38_Y28_N4
\nuevo_credito~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~0_combout\ = (\actualizar_externo~input_o\ & (\credito_externo[6]~input_o\)) # (!\actualizar_externo~input_o\ & ((credito_total_int(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actualizar_externo~input_o\,
	datac => \credito_externo[6]~input_o\,
	datad => credito_total_int(6),
	combout => \nuevo_credito~0_combout\);

-- Location: LCCOMB_X38_Y28_N16
\LessThan0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~1_cout\ = CARRY((\monto_compra[0]~input_o\ & !\nuevo_credito~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \monto_compra[0]~input_o\,
	datab => \nuevo_credito~6_combout\,
	datad => VCC,
	cout => \LessThan0~1_cout\);

-- Location: LCCOMB_X38_Y28_N18
\LessThan0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~3_cout\ = CARRY((\nuevo_credito~5_combout\ & ((!\LessThan0~1_cout\) # (!\monto_compra[1]~input_o\))) # (!\nuevo_credito~5_combout\ & (!\monto_compra[1]~input_o\ & !\LessThan0~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \nuevo_credito~5_combout\,
	datab => \monto_compra[1]~input_o\,
	datad => VCC,
	cin => \LessThan0~1_cout\,
	cout => \LessThan0~3_cout\);

-- Location: LCCOMB_X38_Y28_N20
\LessThan0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~5_cout\ = CARRY((\monto_compra[2]~input_o\ & ((!\LessThan0~3_cout\) # (!\nuevo_credito~4_combout\))) # (!\monto_compra[2]~input_o\ & (!\nuevo_credito~4_combout\ & !\LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \monto_compra[2]~input_o\,
	datab => \nuevo_credito~4_combout\,
	datad => VCC,
	cin => \LessThan0~3_cout\,
	cout => \LessThan0~5_cout\);

-- Location: LCCOMB_X38_Y28_N22
\LessThan0~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~7_cout\ = CARRY((\nuevo_credito~3_combout\ & ((!\LessThan0~5_cout\) # (!\monto_compra[3]~input_o\))) # (!\nuevo_credito~3_combout\ & (!\monto_compra[3]~input_o\ & !\LessThan0~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \nuevo_credito~3_combout\,
	datab => \monto_compra[3]~input_o\,
	datad => VCC,
	cin => \LessThan0~5_cout\,
	cout => \LessThan0~7_cout\);

-- Location: LCCOMB_X38_Y28_N24
\LessThan0~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~9_cout\ = CARRY((\nuevo_credito~2_combout\ & (\monto_compra[4]~input_o\ & !\LessThan0~7_cout\)) # (!\nuevo_credito~2_combout\ & ((\monto_compra[4]~input_o\) # (!\LessThan0~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \nuevo_credito~2_combout\,
	datab => \monto_compra[4]~input_o\,
	datad => VCC,
	cin => \LessThan0~7_cout\,
	cout => \LessThan0~9_cout\);

-- Location: LCCOMB_X38_Y28_N26
\LessThan0~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~11_cout\ = CARRY((\monto_compra[5]~input_o\ & (\nuevo_credito~1_combout\ & !\LessThan0~9_cout\)) # (!\monto_compra[5]~input_o\ & ((\nuevo_credito~1_combout\) # (!\LessThan0~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \monto_compra[5]~input_o\,
	datab => \nuevo_credito~1_combout\,
	datad => VCC,
	cin => \LessThan0~9_cout\,
	cout => \LessThan0~11_cout\);

-- Location: LCCOMB_X38_Y28_N28
\LessThan0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~12_combout\ = (\monto_compra[6]~input_o\ & ((!\nuevo_credito~0_combout\) # (!\LessThan0~11_cout\))) # (!\monto_compra[6]~input_o\ & (!\LessThan0~11_cout\ & !\nuevo_credito~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \monto_compra[6]~input_o\,
	datad => \nuevo_credito~0_combout\,
	cin => \LessThan0~11_cout\,
	combout => \LessThan0~12_combout\);

-- Location: LCCOMB_X38_Y28_N14
\Add0~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~17_combout\ = (\actualizar_credito~input_o\ & (\Add0~0_combout\ & ((!\LessThan0~12_combout\)))) # (!\actualizar_credito~input_o\ & (((\nuevo_credito~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \actualizar_credito~input_o\,
	datac => \nuevo_credito~6_combout\,
	datad => \LessThan0~12_combout\,
	combout => \Add0~17_combout\);

-- Location: LCCOMB_X39_Y28_N28
\LessThan3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (\Add0~16_combout\) # ((\Add0~17_combout\ & \Add0~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~17_combout\,
	datac => \Add0~18_combout\,
	datad => \Add0~16_combout\,
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X39_Y28_N26
\LessThan3~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = (\Add0~14_combout\ & (\Add0~19_combout\ & \Add0~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~14_combout\,
	datac => \Add0~19_combout\,
	datad => \Add0~20_combout\,
	combout => \LessThan3~1_combout\);

-- Location: LCCOMB_X39_Y28_N12
\nuevo_credito~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~9_combout\ = (\nuevo_credito~7_combout\ & ((!\LessThan3~1_combout\) # (!\LessThan3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan3~0_combout\,
	datac => \LessThan3~1_combout\,
	datad => \nuevo_credito~7_combout\,
	combout => \nuevo_credito~9_combout\);

-- Location: LCCOMB_X39_Y28_N2
\nuevo_credito~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~10_combout\ = (\nuevo_credito~9_combout\ & ((\Add3~10_combout\))) # (!\nuevo_credito~9_combout\ & (\Add0~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nuevo_credito~9_combout\,
	datab => \Add0~15_combout\,
	datad => \Add3~10_combout\,
	combout => \nuevo_credito~10_combout\);

-- Location: FF_X39_Y28_N23
\credito_total_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \credito_total_int[5]~14_combout\,
	asdata => \Add0~15_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => credito_total_int(5));

-- Location: LCCOMB_X38_Y28_N2
\nuevo_credito~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~1_combout\ = (\actualizar_externo~input_o\ & (\credito_externo[5]~input_o\)) # (!\actualizar_externo~input_o\ & ((credito_total_int(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actualizar_externo~input_o\,
	datac => \credito_externo[5]~input_o\,
	datad => credito_total_int(5),
	combout => \nuevo_credito~1_combout\);

-- Location: LCCOMB_X40_Y28_N6
\Add0~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~15_combout\ = (\actualizar_credito~input_o\ & (((!\LessThan0~12_combout\ & \Add0~10_combout\)))) # (!\actualizar_credito~input_o\ & (\nuevo_credito~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actualizar_credito~input_o\,
	datab => \nuevo_credito~1_combout\,
	datac => \LessThan0~12_combout\,
	datad => \Add0~10_combout\,
	combout => \Add0~15_combout\);

-- Location: LCCOMB_X40_Y28_N26
\nuevo_credito~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~7_combout\ = (\moneda_5_estable~q\ & (!\moneda_5_prev~q\ & ((!\Add0~14_combout\) # (!\Add0~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~15_combout\,
	datab => \moneda_5_estable~q\,
	datac => \moneda_5_prev~q\,
	datad => \Add0~14_combout\,
	combout => \nuevo_credito~7_combout\);

-- Location: LCCOMB_X40_Y28_N24
\nuevo_credito~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \nuevo_credito~8_combout\ = (\nuevo_credito~7_combout\ & (!\process_0~0_combout\ & ((!\LessThan3~1_combout\) # (!\LessThan3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nuevo_credito~7_combout\,
	datab => \LessThan3~0_combout\,
	datac => \LessThan3~1_combout\,
	datad => \process_0~0_combout\,
	combout => \nuevo_credito~8_combout\);

-- Location: FF_X40_Y28_N25
moneda_5_detectada_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \nuevo_credito~8_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \moneda_5_detectada_int~q\);

-- Location: LCCOMB_X36_Y28_N8
\moneda_10_detectada_int~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \moneda_10_detectada_int~3_combout\ = (!\bloqueo_monedas_int~q\ & (!\compra_en_proceso~input_o\ & \moneda_10_detectada_int~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bloqueo_monedas_int~q\,
	datac => \compra_en_proceso~input_o\,
	datad => \moneda_10_detectada_int~2_combout\,
	combout => \moneda_10_detectada_int~3_combout\);

-- Location: FF_X36_Y28_N9
moneda_10_detectada_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \moneda_10_detectada_int~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \moneda_10_detectada_int~q\);

-- Location: IOIBUF_X30_Y0_N8
\sensor_entrega~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sensor_entrega,
	o => \sensor_entrega~input_o\);

-- Location: LCCOMB_X30_Y4_N10
\entrega_debounce[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \entrega_debounce[0]~0_combout\ = !\sensor_entrega~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sensor_entrega~input_o\,
	combout => \entrega_debounce[0]~0_combout\);

-- Location: FF_X30_Y4_N11
\entrega_debounce[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \entrega_debounce[0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => entrega_debounce(0));

-- Location: LCCOMB_X30_Y4_N4
\entrega_debounce[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \entrega_debounce[1]~feeder_combout\ = entrega_debounce(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => entrega_debounce(0),
	combout => \entrega_debounce[1]~feeder_combout\);

-- Location: FF_X30_Y4_N5
\entrega_debounce[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \entrega_debounce[1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => entrega_debounce(1));

-- Location: FF_X30_Y4_N17
\entrega_debounce[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => entrega_debounce(1),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => entrega_debounce(2));

-- Location: LCCOMB_X30_Y4_N8
\entrega_debounce[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \entrega_debounce[3]~feeder_combout\ = entrega_debounce(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => entrega_debounce(2),
	combout => \entrega_debounce[3]~feeder_combout\);

-- Location: FF_X30_Y4_N9
\entrega_debounce[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \entrega_debounce[3]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => entrega_debounce(3));

-- Location: FF_X30_Y4_N31
\entrega_debounce[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => entrega_debounce(3),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => entrega_debounce(4));

-- Location: FF_X30_Y4_N7
\entrega_debounce[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => entrega_debounce(4),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => entrega_debounce(5));

-- Location: LCCOMB_X30_Y4_N22
\entrega_debounce[6]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \entrega_debounce[6]~feeder_combout\ = entrega_debounce(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => entrega_debounce(5),
	combout => \entrega_debounce[6]~feeder_combout\);

-- Location: FF_X30_Y4_N23
\entrega_debounce[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \entrega_debounce[6]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => entrega_debounce(6));

-- Location: FF_X30_Y4_N13
\entrega_debounce[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => entrega_debounce(6),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => entrega_debounce(7));

-- Location: LCCOMB_X30_Y4_N12
\entrega_estable~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \entrega_estable~2_combout\ = (entrega_debounce(6) & ((\entrega_estable~q\) # ((entrega_debounce(1) & entrega_debounce(7))))) # (!entrega_debounce(6) & (\entrega_estable~q\ & ((entrega_debounce(1)) # (entrega_debounce(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => entrega_debounce(6),
	datab => entrega_debounce(1),
	datac => entrega_debounce(7),
	datad => \entrega_estable~q\,
	combout => \entrega_estable~2_combout\);

-- Location: LCCOMB_X30_Y4_N18
\entrega_estable~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \entrega_estable~1_combout\ = (entrega_debounce(5) & ((\entrega_estable~q\) # ((entrega_debounce(4) & entrega_debounce(2))))) # (!entrega_debounce(5) & (\entrega_estable~q\ & ((entrega_debounce(4)) # (entrega_debounce(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => entrega_debounce(5),
	datab => \entrega_estable~q\,
	datac => entrega_debounce(4),
	datad => entrega_debounce(2),
	combout => \entrega_estable~1_combout\);

-- Location: LCCOMB_X30_Y4_N20
\entrega_estable~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \entrega_estable~0_combout\ = (entrega_debounce(5) & (entrega_debounce(3) & entrega_debounce(0))) # (!entrega_debounce(5) & ((entrega_debounce(3)) # (entrega_debounce(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => entrega_debounce(5),
	datac => entrega_debounce(3),
	datad => entrega_debounce(0),
	combout => \entrega_estable~0_combout\);

-- Location: LCCOMB_X30_Y4_N24
\entrega_estable~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \entrega_estable~3_combout\ = (\entrega_estable~2_combout\ & ((\entrega_estable~q\) # ((\entrega_estable~1_combout\ & \entrega_estable~0_combout\)))) # (!\entrega_estable~2_combout\ & (\entrega_estable~q\ & ((\entrega_estable~1_combout\) # 
-- (\entrega_estable~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrega_estable~2_combout\,
	datab => \entrega_estable~1_combout\,
	datac => \entrega_estable~q\,
	datad => \entrega_estable~0_combout\,
	combout => \entrega_estable~3_combout\);

-- Location: FF_X30_Y4_N25
entrega_estable : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \entrega_estable~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \entrega_estable~q\);

-- Location: LCCOMB_X30_Y4_N26
\entrega_prev~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \entrega_prev~feeder_combout\ = \entrega_estable~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \entrega_estable~q\,
	combout => \entrega_prev~feeder_combout\);

-- Location: FF_X30_Y4_N27
entrega_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \entrega_prev~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \entrega_prev~q\);

-- Location: LCCOMB_X31_Y4_N8
\contador_bloqueo_entrega[0]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[0]~26_combout\ = contador_bloqueo_entrega(0) $ (VCC)
-- \contador_bloqueo_entrega[0]~27\ = CARRY(contador_bloqueo_entrega(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(0),
	datad => VCC,
	combout => \contador_bloqueo_entrega[0]~26_combout\,
	cout => \contador_bloqueo_entrega[0]~27\);

-- Location: LCCOMB_X31_Y4_N6
\contador_bloqueo_entrega[11]~75\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[11]~75_combout\ = ((!\entrega_prev~q\ & (\entrega_estable~q\ & !\bloqueo_entrega_int~q\))) # (!\bloqueo_entrega_int~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrega_prev~q\,
	datab => \entrega_estable~q\,
	datac => \bloqueo_entrega_int~q\,
	datad => \bloqueo_entrega_int~4_combout\,
	combout => \contador_bloqueo_entrega[11]~75_combout\);

-- Location: LCCOMB_X30_Y4_N14
\contador_bloqueo_entrega[11]~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[11]~42_combout\ = (\bloqueo_entrega_int~q\) # ((\entrega_estable~q\ & !\entrega_prev~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \entrega_estable~q\,
	datac => \entrega_prev~q\,
	datad => \bloqueo_entrega_int~q\,
	combout => \contador_bloqueo_entrega[11]~42_combout\);

-- Location: FF_X31_Y4_N9
\contador_bloqueo_entrega[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[0]~26_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(0));

-- Location: LCCOMB_X31_Y4_N10
\contador_bloqueo_entrega[1]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[1]~28_combout\ = (contador_bloqueo_entrega(1) & (!\contador_bloqueo_entrega[0]~27\)) # (!contador_bloqueo_entrega(1) & ((\contador_bloqueo_entrega[0]~27\) # (GND)))
-- \contador_bloqueo_entrega[1]~29\ = CARRY((!\contador_bloqueo_entrega[0]~27\) # (!contador_bloqueo_entrega(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo_entrega(1),
	datad => VCC,
	cin => \contador_bloqueo_entrega[0]~27\,
	combout => \contador_bloqueo_entrega[1]~28_combout\,
	cout => \contador_bloqueo_entrega[1]~29\);

-- Location: FF_X31_Y4_N11
\contador_bloqueo_entrega[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[1]~28_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(1));

-- Location: LCCOMB_X31_Y4_N12
\contador_bloqueo_entrega[2]~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[2]~30_combout\ = (contador_bloqueo_entrega(2) & (\contador_bloqueo_entrega[1]~29\ $ (GND))) # (!contador_bloqueo_entrega(2) & (!\contador_bloqueo_entrega[1]~29\ & VCC))
-- \contador_bloqueo_entrega[2]~31\ = CARRY((contador_bloqueo_entrega(2) & !\contador_bloqueo_entrega[1]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo_entrega(2),
	datad => VCC,
	cin => \contador_bloqueo_entrega[1]~29\,
	combout => \contador_bloqueo_entrega[2]~30_combout\,
	cout => \contador_bloqueo_entrega[2]~31\);

-- Location: FF_X31_Y4_N13
\contador_bloqueo_entrega[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[2]~30_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(2));

-- Location: LCCOMB_X31_Y4_N14
\contador_bloqueo_entrega[3]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[3]~32_combout\ = (contador_bloqueo_entrega(3) & (!\contador_bloqueo_entrega[2]~31\)) # (!contador_bloqueo_entrega(3) & ((\contador_bloqueo_entrega[2]~31\) # (GND)))
-- \contador_bloqueo_entrega[3]~33\ = CARRY((!\contador_bloqueo_entrega[2]~31\) # (!contador_bloqueo_entrega(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(3),
	datad => VCC,
	cin => \contador_bloqueo_entrega[2]~31\,
	combout => \contador_bloqueo_entrega[3]~32_combout\,
	cout => \contador_bloqueo_entrega[3]~33\);

-- Location: FF_X31_Y4_N15
\contador_bloqueo_entrega[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[3]~32_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(3));

-- Location: LCCOMB_X31_Y4_N16
\contador_bloqueo_entrega[4]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[4]~34_combout\ = (contador_bloqueo_entrega(4) & (\contador_bloqueo_entrega[3]~33\ $ (GND))) # (!contador_bloqueo_entrega(4) & (!\contador_bloqueo_entrega[3]~33\ & VCC))
-- \contador_bloqueo_entrega[4]~35\ = CARRY((contador_bloqueo_entrega(4) & !\contador_bloqueo_entrega[3]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(4),
	datad => VCC,
	cin => \contador_bloqueo_entrega[3]~33\,
	combout => \contador_bloqueo_entrega[4]~34_combout\,
	cout => \contador_bloqueo_entrega[4]~35\);

-- Location: FF_X31_Y4_N17
\contador_bloqueo_entrega[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[4]~34_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(4));

-- Location: LCCOMB_X31_Y4_N18
\contador_bloqueo_entrega[5]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[5]~36_combout\ = (contador_bloqueo_entrega(5) & (!\contador_bloqueo_entrega[4]~35\)) # (!contador_bloqueo_entrega(5) & ((\contador_bloqueo_entrega[4]~35\) # (GND)))
-- \contador_bloqueo_entrega[5]~37\ = CARRY((!\contador_bloqueo_entrega[4]~35\) # (!contador_bloqueo_entrega(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(5),
	datad => VCC,
	cin => \contador_bloqueo_entrega[4]~35\,
	combout => \contador_bloqueo_entrega[5]~36_combout\,
	cout => \contador_bloqueo_entrega[5]~37\);

-- Location: FF_X31_Y4_N19
\contador_bloqueo_entrega[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[5]~36_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(5));

-- Location: LCCOMB_X31_Y4_N20
\contador_bloqueo_entrega[6]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[6]~38_combout\ = (contador_bloqueo_entrega(6) & (\contador_bloqueo_entrega[5]~37\ $ (GND))) # (!contador_bloqueo_entrega(6) & (!\contador_bloqueo_entrega[5]~37\ & VCC))
-- \contador_bloqueo_entrega[6]~39\ = CARRY((contador_bloqueo_entrega(6) & !\contador_bloqueo_entrega[5]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(6),
	datad => VCC,
	cin => \contador_bloqueo_entrega[5]~37\,
	combout => \contador_bloqueo_entrega[6]~38_combout\,
	cout => \contador_bloqueo_entrega[6]~39\);

-- Location: FF_X31_Y4_N21
\contador_bloqueo_entrega[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[6]~38_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(6));

-- Location: LCCOMB_X31_Y4_N22
\contador_bloqueo_entrega[7]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[7]~40_combout\ = (contador_bloqueo_entrega(7) & (!\contador_bloqueo_entrega[6]~39\)) # (!contador_bloqueo_entrega(7) & ((\contador_bloqueo_entrega[6]~39\) # (GND)))
-- \contador_bloqueo_entrega[7]~41\ = CARRY((!\contador_bloqueo_entrega[6]~39\) # (!contador_bloqueo_entrega(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(7),
	datad => VCC,
	cin => \contador_bloqueo_entrega[6]~39\,
	combout => \contador_bloqueo_entrega[7]~40_combout\,
	cout => \contador_bloqueo_entrega[7]~41\);

-- Location: FF_X31_Y4_N23
\contador_bloqueo_entrega[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[7]~40_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(7));

-- Location: LCCOMB_X31_Y4_N24
\contador_bloqueo_entrega[8]~43\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[8]~43_combout\ = (contador_bloqueo_entrega(8) & (\contador_bloqueo_entrega[7]~41\ $ (GND))) # (!contador_bloqueo_entrega(8) & (!\contador_bloqueo_entrega[7]~41\ & VCC))
-- \contador_bloqueo_entrega[8]~44\ = CARRY((contador_bloqueo_entrega(8) & !\contador_bloqueo_entrega[7]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo_entrega(8),
	datad => VCC,
	cin => \contador_bloqueo_entrega[7]~41\,
	combout => \contador_bloqueo_entrega[8]~43_combout\,
	cout => \contador_bloqueo_entrega[8]~44\);

-- Location: FF_X31_Y4_N25
\contador_bloqueo_entrega[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[8]~43_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(8));

-- Location: LCCOMB_X31_Y4_N26
\contador_bloqueo_entrega[9]~45\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[9]~45_combout\ = (contador_bloqueo_entrega(9) & (!\contador_bloqueo_entrega[8]~44\)) # (!contador_bloqueo_entrega(9) & ((\contador_bloqueo_entrega[8]~44\) # (GND)))
-- \contador_bloqueo_entrega[9]~46\ = CARRY((!\contador_bloqueo_entrega[8]~44\) # (!contador_bloqueo_entrega(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(9),
	datad => VCC,
	cin => \contador_bloqueo_entrega[8]~44\,
	combout => \contador_bloqueo_entrega[9]~45_combout\,
	cout => \contador_bloqueo_entrega[9]~46\);

-- Location: FF_X31_Y4_N27
\contador_bloqueo_entrega[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[9]~45_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(9));

-- Location: LCCOMB_X31_Y4_N28
\contador_bloqueo_entrega[10]~47\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[10]~47_combout\ = (contador_bloqueo_entrega(10) & (\contador_bloqueo_entrega[9]~46\ $ (GND))) # (!contador_bloqueo_entrega(10) & (!\contador_bloqueo_entrega[9]~46\ & VCC))
-- \contador_bloqueo_entrega[10]~48\ = CARRY((contador_bloqueo_entrega(10) & !\contador_bloqueo_entrega[9]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo_entrega(10),
	datad => VCC,
	cin => \contador_bloqueo_entrega[9]~46\,
	combout => \contador_bloqueo_entrega[10]~47_combout\,
	cout => \contador_bloqueo_entrega[10]~48\);

-- Location: FF_X31_Y4_N29
\contador_bloqueo_entrega[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[10]~47_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(10));

-- Location: LCCOMB_X31_Y4_N30
\contador_bloqueo_entrega[11]~49\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[11]~49_combout\ = (contador_bloqueo_entrega(11) & (!\contador_bloqueo_entrega[10]~48\)) # (!contador_bloqueo_entrega(11) & ((\contador_bloqueo_entrega[10]~48\) # (GND)))
-- \contador_bloqueo_entrega[11]~50\ = CARRY((!\contador_bloqueo_entrega[10]~48\) # (!contador_bloqueo_entrega(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(11),
	datad => VCC,
	cin => \contador_bloqueo_entrega[10]~48\,
	combout => \contador_bloqueo_entrega[11]~49_combout\,
	cout => \contador_bloqueo_entrega[11]~50\);

-- Location: FF_X31_Y4_N31
\contador_bloqueo_entrega[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[11]~49_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(11));

-- Location: LCCOMB_X31_Y3_N0
\contador_bloqueo_entrega[12]~51\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[12]~51_combout\ = (contador_bloqueo_entrega(12) & (\contador_bloqueo_entrega[11]~50\ $ (GND))) # (!contador_bloqueo_entrega(12) & (!\contador_bloqueo_entrega[11]~50\ & VCC))
-- \contador_bloqueo_entrega[12]~52\ = CARRY((contador_bloqueo_entrega(12) & !\contador_bloqueo_entrega[11]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(12),
	datad => VCC,
	cin => \contador_bloqueo_entrega[11]~50\,
	combout => \contador_bloqueo_entrega[12]~51_combout\,
	cout => \contador_bloqueo_entrega[12]~52\);

-- Location: FF_X31_Y3_N1
\contador_bloqueo_entrega[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[12]~51_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(12));

-- Location: LCCOMB_X31_Y3_N2
\contador_bloqueo_entrega[13]~53\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[13]~53_combout\ = (contador_bloqueo_entrega(13) & (!\contador_bloqueo_entrega[12]~52\)) # (!contador_bloqueo_entrega(13) & ((\contador_bloqueo_entrega[12]~52\) # (GND)))
-- \contador_bloqueo_entrega[13]~54\ = CARRY((!\contador_bloqueo_entrega[12]~52\) # (!contador_bloqueo_entrega(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(13),
	datad => VCC,
	cin => \contador_bloqueo_entrega[12]~52\,
	combout => \contador_bloqueo_entrega[13]~53_combout\,
	cout => \contador_bloqueo_entrega[13]~54\);

-- Location: FF_X31_Y3_N3
\contador_bloqueo_entrega[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[13]~53_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(13));

-- Location: LCCOMB_X31_Y3_N4
\contador_bloqueo_entrega[14]~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[14]~55_combout\ = (contador_bloqueo_entrega(14) & (\contador_bloqueo_entrega[13]~54\ $ (GND))) # (!contador_bloqueo_entrega(14) & (!\contador_bloqueo_entrega[13]~54\ & VCC))
-- \contador_bloqueo_entrega[14]~56\ = CARRY((contador_bloqueo_entrega(14) & !\contador_bloqueo_entrega[13]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(14),
	datad => VCC,
	cin => \contador_bloqueo_entrega[13]~54\,
	combout => \contador_bloqueo_entrega[14]~55_combout\,
	cout => \contador_bloqueo_entrega[14]~56\);

-- Location: FF_X31_Y3_N5
\contador_bloqueo_entrega[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[14]~55_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(14));

-- Location: LCCOMB_X31_Y3_N6
\contador_bloqueo_entrega[15]~57\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[15]~57_combout\ = (contador_bloqueo_entrega(15) & (!\contador_bloqueo_entrega[14]~56\)) # (!contador_bloqueo_entrega(15) & ((\contador_bloqueo_entrega[14]~56\) # (GND)))
-- \contador_bloqueo_entrega[15]~58\ = CARRY((!\contador_bloqueo_entrega[14]~56\) # (!contador_bloqueo_entrega(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo_entrega(15),
	datad => VCC,
	cin => \contador_bloqueo_entrega[14]~56\,
	combout => \contador_bloqueo_entrega[15]~57_combout\,
	cout => \contador_bloqueo_entrega[15]~58\);

-- Location: FF_X31_Y3_N7
\contador_bloqueo_entrega[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[15]~57_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(15));

-- Location: LCCOMB_X31_Y3_N8
\contador_bloqueo_entrega[16]~59\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[16]~59_combout\ = (contador_bloqueo_entrega(16) & (\contador_bloqueo_entrega[15]~58\ $ (GND))) # (!contador_bloqueo_entrega(16) & (!\contador_bloqueo_entrega[15]~58\ & VCC))
-- \contador_bloqueo_entrega[16]~60\ = CARRY((contador_bloqueo_entrega(16) & !\contador_bloqueo_entrega[15]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(16),
	datad => VCC,
	cin => \contador_bloqueo_entrega[15]~58\,
	combout => \contador_bloqueo_entrega[16]~59_combout\,
	cout => \contador_bloqueo_entrega[16]~60\);

-- Location: FF_X31_Y3_N9
\contador_bloqueo_entrega[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[16]~59_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(16));

-- Location: LCCOMB_X31_Y3_N10
\contador_bloqueo_entrega[17]~61\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[17]~61_combout\ = (contador_bloqueo_entrega(17) & (!\contador_bloqueo_entrega[16]~60\)) # (!contador_bloqueo_entrega(17) & ((\contador_bloqueo_entrega[16]~60\) # (GND)))
-- \contador_bloqueo_entrega[17]~62\ = CARRY((!\contador_bloqueo_entrega[16]~60\) # (!contador_bloqueo_entrega(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(17),
	datad => VCC,
	cin => \contador_bloqueo_entrega[16]~60\,
	combout => \contador_bloqueo_entrega[17]~61_combout\,
	cout => \contador_bloqueo_entrega[17]~62\);

-- Location: FF_X31_Y3_N11
\contador_bloqueo_entrega[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[17]~61_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(17));

-- Location: LCCOMB_X31_Y3_N12
\contador_bloqueo_entrega[18]~63\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[18]~63_combout\ = (contador_bloqueo_entrega(18) & (\contador_bloqueo_entrega[17]~62\ $ (GND))) # (!contador_bloqueo_entrega(18) & (!\contador_bloqueo_entrega[17]~62\ & VCC))
-- \contador_bloqueo_entrega[18]~64\ = CARRY((contador_bloqueo_entrega(18) & !\contador_bloqueo_entrega[17]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo_entrega(18),
	datad => VCC,
	cin => \contador_bloqueo_entrega[17]~62\,
	combout => \contador_bloqueo_entrega[18]~63_combout\,
	cout => \contador_bloqueo_entrega[18]~64\);

-- Location: FF_X31_Y3_N13
\contador_bloqueo_entrega[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[18]~63_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(18));

-- Location: LCCOMB_X31_Y3_N14
\contador_bloqueo_entrega[19]~65\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[19]~65_combout\ = (contador_bloqueo_entrega(19) & (!\contador_bloqueo_entrega[18]~64\)) # (!contador_bloqueo_entrega(19) & ((\contador_bloqueo_entrega[18]~64\) # (GND)))
-- \contador_bloqueo_entrega[19]~66\ = CARRY((!\contador_bloqueo_entrega[18]~64\) # (!contador_bloqueo_entrega(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(19),
	datad => VCC,
	cin => \contador_bloqueo_entrega[18]~64\,
	combout => \contador_bloqueo_entrega[19]~65_combout\,
	cout => \contador_bloqueo_entrega[19]~66\);

-- Location: FF_X31_Y3_N15
\contador_bloqueo_entrega[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[19]~65_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(19));

-- Location: LCCOMB_X31_Y3_N16
\contador_bloqueo_entrega[20]~67\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[20]~67_combout\ = (contador_bloqueo_entrega(20) & (\contador_bloqueo_entrega[19]~66\ $ (GND))) # (!contador_bloqueo_entrega(20) & (!\contador_bloqueo_entrega[19]~66\ & VCC))
-- \contador_bloqueo_entrega[20]~68\ = CARRY((contador_bloqueo_entrega(20) & !\contador_bloqueo_entrega[19]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(20),
	datad => VCC,
	cin => \contador_bloqueo_entrega[19]~66\,
	combout => \contador_bloqueo_entrega[20]~67_combout\,
	cout => \contador_bloqueo_entrega[20]~68\);

-- Location: FF_X31_Y3_N17
\contador_bloqueo_entrega[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[20]~67_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(20));

-- Location: LCCOMB_X31_Y3_N18
\contador_bloqueo_entrega[21]~69\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[21]~69_combout\ = (contador_bloqueo_entrega(21) & (!\contador_bloqueo_entrega[20]~68\)) # (!contador_bloqueo_entrega(21) & ((\contador_bloqueo_entrega[20]~68\) # (GND)))
-- \contador_bloqueo_entrega[21]~70\ = CARRY((!\contador_bloqueo_entrega[20]~68\) # (!contador_bloqueo_entrega(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo_entrega(21),
	datad => VCC,
	cin => \contador_bloqueo_entrega[20]~68\,
	combout => \contador_bloqueo_entrega[21]~69_combout\,
	cout => \contador_bloqueo_entrega[21]~70\);

-- Location: FF_X31_Y3_N19
\contador_bloqueo_entrega[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[21]~69_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(21));

-- Location: LCCOMB_X31_Y3_N20
\contador_bloqueo_entrega[22]~71\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[22]~71_combout\ = (contador_bloqueo_entrega(22) & (\contador_bloqueo_entrega[21]~70\ $ (GND))) # (!contador_bloqueo_entrega(22) & (!\contador_bloqueo_entrega[21]~70\ & VCC))
-- \contador_bloqueo_entrega[22]~72\ = CARRY((contador_bloqueo_entrega(22) & !\contador_bloqueo_entrega[21]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(22),
	datad => VCC,
	cin => \contador_bloqueo_entrega[21]~70\,
	combout => \contador_bloqueo_entrega[22]~71_combout\,
	cout => \contador_bloqueo_entrega[22]~72\);

-- Location: FF_X31_Y3_N21
\contador_bloqueo_entrega[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[22]~71_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(22));

-- Location: LCCOMB_X31_Y3_N22
\contador_bloqueo_entrega[23]~73\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_bloqueo_entrega[23]~73_combout\ = contador_bloqueo_entrega(23) $ (\contador_bloqueo_entrega[22]~72\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo_entrega(23),
	cin => \contador_bloqueo_entrega[22]~72\,
	combout => \contador_bloqueo_entrega[23]~73_combout\);

-- Location: FF_X31_Y3_N23
\contador_bloqueo_entrega[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_bloqueo_entrega[23]~73_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \contador_bloqueo_entrega[11]~75_combout\,
	ena => \contador_bloqueo_entrega[11]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_bloqueo_entrega(23));

-- Location: LCCOMB_X31_Y3_N24
\bloqueo_entrega_int~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \bloqueo_entrega_int~2_combout\ = (!contador_bloqueo_entrega(18) & (!contador_bloqueo_entrega(17) & !contador_bloqueo_entrega(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo_entrega(18),
	datab => contador_bloqueo_entrega(17),
	datac => contador_bloqueo_entrega(16),
	combout => \bloqueo_entrega_int~2_combout\);

-- Location: LCCOMB_X31_Y4_N2
\LessThan1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (((!contador_bloqueo_entrega(7) & !contador_bloqueo_entrega(8))) # (!contador_bloqueo_entrega(10))) # (!contador_bloqueo_entrega(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo_entrega(7),
	datab => contador_bloqueo_entrega(8),
	datac => contador_bloqueo_entrega(9),
	datad => contador_bloqueo_entrega(10),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X31_Y3_N28
\LessThan1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = ((!contador_bloqueo_entrega(11) & \LessThan1~0_combout\)) # (!contador_bloqueo_entrega(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contador_bloqueo_entrega(12),
	datac => contador_bloqueo_entrega(11),
	datad => \LessThan1~0_combout\,
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X31_Y3_N26
\LessThan1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = ((!contador_bloqueo_entrega(13) & (!contador_bloqueo_entrega(14) & \LessThan1~1_combout\))) # (!contador_bloqueo_entrega(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo_entrega(15),
	datab => contador_bloqueo_entrega(13),
	datac => contador_bloqueo_entrega(14),
	datad => \LessThan1~1_combout\,
	combout => \LessThan1~2_combout\);

-- Location: LCCOMB_X31_Y3_N30
\bloqueo_entrega_int~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \bloqueo_entrega_int~3_combout\ = (((\bloqueo_entrega_int~2_combout\ & \LessThan1~2_combout\)) # (!contador_bloqueo_entrega(19))) # (!contador_bloqueo_entrega(20))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bloqueo_entrega_int~2_combout\,
	datab => contador_bloqueo_entrega(20),
	datac => \LessThan1~2_combout\,
	datad => contador_bloqueo_entrega(19),
	combout => \bloqueo_entrega_int~3_combout\);

-- Location: LCCOMB_X31_Y4_N0
\bloqueo_entrega_int~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \bloqueo_entrega_int~4_combout\ = ((!contador_bloqueo_entrega(21) & (!contador_bloqueo_entrega(22) & \bloqueo_entrega_int~3_combout\))) # (!contador_bloqueo_entrega(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_bloqueo_entrega(23),
	datab => contador_bloqueo_entrega(21),
	datac => contador_bloqueo_entrega(22),
	datad => \bloqueo_entrega_int~3_combout\,
	combout => \bloqueo_entrega_int~4_combout\);

-- Location: LCCOMB_X31_Y4_N4
\bloqueo_entrega_int~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \bloqueo_entrega_int~5_combout\ = (\bloqueo_entrega_int~q\ & (((\bloqueo_entrega_int~4_combout\)))) # (!\bloqueo_entrega_int~q\ & (!\entrega_prev~q\ & (\entrega_estable~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrega_prev~q\,
	datab => \entrega_estable~q\,
	datac => \bloqueo_entrega_int~q\,
	datad => \bloqueo_entrega_int~4_combout\,
	combout => \bloqueo_entrega_int~5_combout\);

-- Location: FF_X31_Y4_N5
bloqueo_entrega_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \bloqueo_entrega_int~5_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bloqueo_entrega_int~q\);

-- Location: LCCOMB_X30_Y4_N28
\entrega_detectada_int~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \entrega_detectada_int~0_combout\ = (\entrega_estable~q\ & (!\entrega_prev~q\ & !\bloqueo_entrega_int~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \entrega_estable~q\,
	datac => \entrega_prev~q\,
	datad => \bloqueo_entrega_int~q\,
	combout => \entrega_detectada_int~0_combout\);

-- Location: FF_X30_Y4_N29
entrega_detectada_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \entrega_detectada_int~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \entrega_detectada_int~q\);

ww_moneda_5_detectada <= \moneda_5_detectada~output_o\;

ww_moneda_10_detectada <= \moneda_10_detectada~output_o\;

ww_entrega_detectada <= \entrega_detectada~output_o\;

ww_credito_total(0) <= \credito_total[0]~output_o\;

ww_credito_total(1) <= \credito_total[1]~output_o\;

ww_credito_total(2) <= \credito_total[2]~output_o\;

ww_credito_total(3) <= \credito_total[3]~output_o\;

ww_credito_total(4) <= \credito_total[4]~output_o\;

ww_credito_total(5) <= \credito_total[5]~output_o\;

ww_credito_total(6) <= \credito_total[6]~output_o\;

ww_bloqueo_monedas <= \bloqueo_monedas~output_o\;

ww_bloqueo_entrega <= \bloqueo_entrega~output_o\;
END structure;


