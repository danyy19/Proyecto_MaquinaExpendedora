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

-- DATE "10/30/2025 08:41:41"

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

ENTITY 	ControlTecladoStock IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	teclado_filas : IN std_logic_vector(3 DOWNTO 0);
	actualizar_stock : IN std_logic;
	fila_compra : IN STD.STANDARD.integer range 0 TO 6;
	columna_compra : IN STD.STANDARD.integer range 0 TO 2;
	teclado_columnas : OUT std_logic_vector(3 DOWNTO 0);
	digito_decenas : OUT STD.STANDARD.integer range 0 TO 9;
	digito_unidades : OUT STD.STANDARD.integer range 0 TO 9;
	codigo_ingresado : OUT STD.STANDARD.integer range 0 TO 99;
	precio_actual : OUT STD.STANDARD.integer range 0 TO 127;
	stock_disponible : OUT std_logic;
	key_valid : OUT std_logic;
	confirmar_pulsado : OUT std_logic;
	devolver_pulsado : OUT std_logic
	);
END ControlTecladoStock;

-- Design Ports Information
-- teclado_columnas[0]	=>  Location: PIN_Y7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- teclado_columnas[1]	=>  Location: PIN_AB4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- teclado_columnas[2]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- teclado_columnas[3]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- digito_decenas[0]	=>  Location: PIN_H20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- digito_decenas[1]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- digito_decenas[2]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- digito_decenas[3]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- digito_unidades[0]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- digito_unidades[1]	=>  Location: PIN_W13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- digito_unidades[2]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- digito_unidades[3]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- codigo_ingresado[0]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- codigo_ingresado[1]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- codigo_ingresado[2]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- codigo_ingresado[3]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- codigo_ingresado[4]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- codigo_ingresado[5]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- codigo_ingresado[6]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- precio_actual[0]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- precio_actual[1]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- precio_actual[2]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- precio_actual[3]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- precio_actual[4]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- precio_actual[5]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- precio_actual[6]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- stock_disponible	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- key_valid	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- confirmar_pulsado	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- devolver_pulsado	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- teclado_filas[0]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- teclado_filas[1]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- teclado_filas[2]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- teclado_filas[3]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fila_compra[2]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- columna_compra[0]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- columna_compra[1]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fila_compra[0]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fila_compra[1]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- actualizar_stock	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ControlTecladoStock IS
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
SIGNAL ww_teclado_filas : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_actualizar_stock : std_logic;
SIGNAL ww_fila_compra : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_columna_compra : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_teclado_columnas : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_digito_decenas : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_digito_unidades : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_codigo_ingresado : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_precio_actual : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_stock_disponible : std_logic;
SIGNAL ww_key_valid : std_logic;
SIGNAL ww_confirmar_pulsado : std_logic;
SIGNAL ww_devolver_pulsado : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \slow_clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \teclado_columnas[0]~output_o\ : std_logic;
SIGNAL \teclado_columnas[1]~output_o\ : std_logic;
SIGNAL \teclado_columnas[2]~output_o\ : std_logic;
SIGNAL \teclado_columnas[3]~output_o\ : std_logic;
SIGNAL \digito_decenas[0]~output_o\ : std_logic;
SIGNAL \digito_decenas[1]~output_o\ : std_logic;
SIGNAL \digito_decenas[2]~output_o\ : std_logic;
SIGNAL \digito_decenas[3]~output_o\ : std_logic;
SIGNAL \digito_unidades[0]~output_o\ : std_logic;
SIGNAL \digito_unidades[1]~output_o\ : std_logic;
SIGNAL \digito_unidades[2]~output_o\ : std_logic;
SIGNAL \digito_unidades[3]~output_o\ : std_logic;
SIGNAL \codigo_ingresado[0]~output_o\ : std_logic;
SIGNAL \codigo_ingresado[1]~output_o\ : std_logic;
SIGNAL \codigo_ingresado[2]~output_o\ : std_logic;
SIGNAL \codigo_ingresado[3]~output_o\ : std_logic;
SIGNAL \codigo_ingresado[4]~output_o\ : std_logic;
SIGNAL \codigo_ingresado[5]~output_o\ : std_logic;
SIGNAL \codigo_ingresado[6]~output_o\ : std_logic;
SIGNAL \precio_actual[0]~output_o\ : std_logic;
SIGNAL \precio_actual[1]~output_o\ : std_logic;
SIGNAL \precio_actual[2]~output_o\ : std_logic;
SIGNAL \precio_actual[3]~output_o\ : std_logic;
SIGNAL \precio_actual[4]~output_o\ : std_logic;
SIGNAL \precio_actual[5]~output_o\ : std_logic;
SIGNAL \precio_actual[6]~output_o\ : std_logic;
SIGNAL \stock_disponible~output_o\ : std_logic;
SIGNAL \key_valid~output_o\ : std_logic;
SIGNAL \confirmar_pulsado~output_o\ : std_logic;
SIGNAL \devolver_pulsado~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \div_counter[0]~57_combout\ : std_logic;
SIGNAL \div_counter[1]~19_combout\ : std_logic;
SIGNAL \div_counter[1]~20\ : std_logic;
SIGNAL \div_counter[2]~21_combout\ : std_logic;
SIGNAL \div_counter[2]~22\ : std_logic;
SIGNAL \div_counter[3]~23_combout\ : std_logic;
SIGNAL \div_counter[3]~24\ : std_logic;
SIGNAL \div_counter[4]~25_combout\ : std_logic;
SIGNAL \div_counter[4]~26\ : std_logic;
SIGNAL \div_counter[5]~27_combout\ : std_logic;
SIGNAL \div_counter[5]~28\ : std_logic;
SIGNAL \div_counter[6]~29_combout\ : std_logic;
SIGNAL \div_counter[6]~30\ : std_logic;
SIGNAL \div_counter[7]~31_combout\ : std_logic;
SIGNAL \div_counter[7]~32\ : std_logic;
SIGNAL \div_counter[8]~33_combout\ : std_logic;
SIGNAL \div_counter[8]~34\ : std_logic;
SIGNAL \div_counter[9]~35_combout\ : std_logic;
SIGNAL \div_counter[9]~36\ : std_logic;
SIGNAL \div_counter[10]~37_combout\ : std_logic;
SIGNAL \div_counter[10]~38\ : std_logic;
SIGNAL \div_counter[11]~39_combout\ : std_logic;
SIGNAL \div_counter[11]~40\ : std_logic;
SIGNAL \div_counter[12]~41_combout\ : std_logic;
SIGNAL \div_counter[12]~42\ : std_logic;
SIGNAL \div_counter[13]~43_combout\ : std_logic;
SIGNAL \div_counter[13]~44\ : std_logic;
SIGNAL \div_counter[14]~45_combout\ : std_logic;
SIGNAL \div_counter[14]~46\ : std_logic;
SIGNAL \div_counter[15]~47_combout\ : std_logic;
SIGNAL \div_counter[15]~48\ : std_logic;
SIGNAL \div_counter[16]~49_combout\ : std_logic;
SIGNAL \div_counter[16]~50\ : std_logic;
SIGNAL \div_counter[17]~51_combout\ : std_logic;
SIGNAL \div_counter[17]~52\ : std_logic;
SIGNAL \div_counter[18]~53_combout\ : std_logic;
SIGNAL \div_counter[18]~54\ : std_logic;
SIGNAL \div_counter[19]~55_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \slow_clk~0_combout\ : std_logic;
SIGNAL \slow_clk~feeder_combout\ : std_logic;
SIGNAL \slow_clk~q\ : std_logic;
SIGNAL \slow_clk~clkctrl_outclk\ : std_logic;
SIGNAL \col_sel[0]~1_combout\ : std_logic;
SIGNAL \col_sel[1]~0_combout\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \teclado_filas[1]~input_o\ : std_logic;
SIGNAL \teclado_filas[3]~input_o\ : std_logic;
SIGNAL \teclado_filas[2]~input_o\ : std_logic;
SIGNAL \teclado_filas[0]~input_o\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux15~1_combout\ : std_logic;
SIGNAL \Mux15~2_combout\ : std_logic;
SIGNAL \Mux14~0_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux16~0_combout\ : std_logic;
SIGNAL \Mux16~1_combout\ : std_logic;
SIGNAL \Mux18~0_combout\ : std_logic;
SIGNAL \Mux18~1_combout\ : std_logic;
SIGNAL \Mux18~2_combout\ : std_logic;
SIGNAL \Mux17~0_combout\ : std_logic;
SIGNAL \Mux17~1_combout\ : std_logic;
SIGNAL \Mux17~2_combout\ : std_logic;
SIGNAL \Mux17~3_combout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \Equal1~5_combout\ : std_logic;
SIGNAL \Equal1~4_combout\ : std_logic;
SIGNAL \debounce_count[0]~21_combout\ : std_logic;
SIGNAL \debounce_count[0]~22\ : std_logic;
SIGNAL \debounce_count[1]~23_combout\ : std_logic;
SIGNAL \debounce_count[1]~24\ : std_logic;
SIGNAL \debounce_count[2]~25_combout\ : std_logic;
SIGNAL \debounce_count[2]~26\ : std_logic;
SIGNAL \debounce_count[3]~27_combout\ : std_logic;
SIGNAL \debounce_count[3]~28\ : std_logic;
SIGNAL \debounce_count[4]~29_combout\ : std_logic;
SIGNAL \debounce_count[4]~30\ : std_logic;
SIGNAL \debounce_count[5]~31_combout\ : std_logic;
SIGNAL \debounce_count[5]~32\ : std_logic;
SIGNAL \debounce_count[6]~33_combout\ : std_logic;
SIGNAL \debounce_count[6]~34\ : std_logic;
SIGNAL \debounce_count[7]~35_combout\ : std_logic;
SIGNAL \debounce_count[7]~36\ : std_logic;
SIGNAL \debounce_count[8]~37_combout\ : std_logic;
SIGNAL \debounce_count[8]~feeder_combout\ : std_logic;
SIGNAL \debounce_count[8]~38\ : std_logic;
SIGNAL \debounce_count[9]~39_combout\ : std_logic;
SIGNAL \debounce_count[9]~40\ : std_logic;
SIGNAL \debounce_count[10]~41_combout\ : std_logic;
SIGNAL \debounce_count[10]~42\ : std_logic;
SIGNAL \debounce_count[11]~43_combout\ : std_logic;
SIGNAL \debounce_count[11]~44\ : std_logic;
SIGNAL \debounce_count[12]~45_combout\ : std_logic;
SIGNAL \debounce_count[12]~46\ : std_logic;
SIGNAL \debounce_count[13]~47_combout\ : std_logic;
SIGNAL \debounce_count[13]~48\ : std_logic;
SIGNAL \debounce_count[14]~49_combout\ : std_logic;
SIGNAL \debounce_count[14]~50\ : std_logic;
SIGNAL \debounce_count[15]~51_combout\ : std_logic;
SIGNAL \debounce_count[15]~52\ : std_logic;
SIGNAL \debounce_count[16]~53_combout\ : std_logic;
SIGNAL \debounce_count[16]~54\ : std_logic;
SIGNAL \debounce_count[17]~55_combout\ : std_logic;
SIGNAL \debounce_count[17]~56\ : std_logic;
SIGNAL \debounce_count[18]~57_combout\ : std_logic;
SIGNAL \key_stable[0]~3_combout\ : std_logic;
SIGNAL \debounce_count[18]~58\ : std_logic;
SIGNAL \debounce_count[19]~59_combout\ : std_logic;
SIGNAL \debounce_count[19]~60\ : std_logic;
SIGNAL \debounce_count[20]~61_combout\ : std_logic;
SIGNAL \key_stable[0]~1_combout\ : std_logic;
SIGNAL \key_stable[0]~0_combout\ : std_logic;
SIGNAL \key_stable[0]~2_combout\ : std_logic;
SIGNAL \key_stable[0]~4_combout\ : std_logic;
SIGNAL \Equal1~3_combout\ : std_logic;
SIGNAL \key_stable[0]~5_combout\ : std_logic;
SIGNAL \key_stable[0]~feeder_combout\ : std_logic;
SIGNAL \Mux58~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \Equal2~1_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \process_3~0_combout\ : std_logic;
SIGNAL \key_valid_int~q\ : std_logic;
SIGNAL \digito_unidades_int[1]~0_combout\ : std_logic;
SIGNAL \codigo_ingresado_int[1]~6_combout\ : std_logic;
SIGNAL \Mux47~0_combout\ : std_logic;
SIGNAL \digito_unidades_int[1]~1_combout\ : std_logic;
SIGNAL \digito_unidades_int[1]~2_combout\ : std_logic;
SIGNAL \Mux46~0_combout\ : std_logic;
SIGNAL \Mux49~0_combout\ : std_logic;
SIGNAL \Mux45~0_combout\ : std_logic;
SIGNAL \Mux48~0_combout\ : std_logic;
SIGNAL \Mux44~0_combout\ : std_logic;
SIGNAL \codigo_ingresado_int[1]~7_combout\ : std_logic;
SIGNAL \codigo_ingresado_int[1]~9_combout\ : std_logic;
SIGNAL \codigo_ingresado_int[1]~8\ : std_logic;
SIGNAL \codigo_ingresado_int[2]~10_combout\ : std_logic;
SIGNAL \Add4~0_combout\ : std_logic;
SIGNAL \codigo_ingresado_int[2]~11\ : std_logic;
SIGNAL \codigo_ingresado_int[3]~12_combout\ : std_logic;
SIGNAL \Add4~1_combout\ : std_logic;
SIGNAL \codigo_ingresado_int[3]~13\ : std_logic;
SIGNAL \codigo_ingresado_int[4]~14_combout\ : std_logic;
SIGNAL \Add4~2_combout\ : std_logic;
SIGNAL \codigo_ingresado_int[4]~15\ : std_logic;
SIGNAL \codigo_ingresado_int[5]~16_combout\ : std_logic;
SIGNAL \Add4~3_combout\ : std_logic;
SIGNAL \codigo_ingresado_int[5]~17\ : std_logic;
SIGNAL \codigo_ingresado_int[6]~18_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~27_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[17]~29_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[17]~28_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~30_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~31_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[15]~33_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[15]~32_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[23]~47_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[23]~34_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[22]~48_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[22]~35_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[21]~36_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[21]~37_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[20]~38_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[20]~39_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[28]~40_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[28]~46_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[27]~41_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[27]~49_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[26]~42_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[26]~43_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[25]~44_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[25]~45_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[24]~39_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[24]~38_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[23]~40_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[23]~41_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[22]~42_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[22]~43_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[21]~44_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[21]~45_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[32]~65_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[32]~46_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[31]~47_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[31]~66_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[30]~67_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[30]~48_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[29]~50_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[29]~49_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[28]~51_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[28]~52_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[35]~53_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[40]~62_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[40]~55_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[39]~56_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[39]~63_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[38]~57_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[38]~64_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[37]~68_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[37]~58_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[36]~59_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[36]~60_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~9_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~11_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ : std_logic;
SIGNAL \Mux60~0_combout\ : std_logic;
SIGNAL \precio_actual~12_combout\ : std_logic;
SIGNAL \precio_actual~25_combout\ : std_logic;
SIGNAL \precio_actual~9_combout\ : std_logic;
SIGNAL \precio_actual~10_combout\ : std_logic;
SIGNAL \precio_actual~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\ : std_logic;
SIGNAL \precio_actual~11_combout\ : std_logic;
SIGNAL \precio_actual~13_combout\ : std_logic;
SIGNAL \precio_actual[0]~reg0_q\ : std_logic;
SIGNAL \precio_actual~15_combout\ : std_logic;
SIGNAL \precio_actual~14_combout\ : std_logic;
SIGNAL \Mux67~0_combout\ : std_logic;
SIGNAL \precio_actual~16_combout\ : std_logic;
SIGNAL \precio_actual[1]~reg0_q\ : std_logic;
SIGNAL \Mux65~0_combout\ : std_logic;
SIGNAL \Mux65~1_combout\ : std_logic;
SIGNAL \precio_actual~17_combout\ : std_logic;
SIGNAL \precio_actual[2]~reg0_q\ : std_logic;
SIGNAL \Mux67~1_combout\ : std_logic;
SIGNAL \precio_actual~18_combout\ : std_logic;
SIGNAL \precio_actual~19_combout\ : std_logic;
SIGNAL \precio_actual~20_combout\ : std_logic;
SIGNAL \precio_actual~21_combout\ : std_logic;
SIGNAL \precio_actual[3]~reg0_q\ : std_logic;
SIGNAL \precio_actual~22_combout\ : std_logic;
SIGNAL \precio_actual~23_combout\ : std_logic;
SIGNAL \precio_actual[4]~reg0_q\ : std_logic;
SIGNAL \precio_actual~24_combout\ : std_logic;
SIGNAL \precio_actual[5]~reg0_q\ : std_logic;
SIGNAL \Mux91~22_combout\ : std_logic;
SIGNAL \fila_compra[2]~input_o\ : std_logic;
SIGNAL \fila_compra[0]~input_o\ : std_logic;
SIGNAL \columna_compra[1]~input_o\ : std_logic;
SIGNAL \fila_compra[1]~input_o\ : std_logic;
SIGNAL \Mux40~8_combout\ : std_logic;
SIGNAL \columna_compra[0]~input_o\ : std_logic;
SIGNAL \almacen[0][1][0]~0_combout\ : std_logic;
SIGNAL \almacen[0][1][0]~feeder_combout\ : std_logic;
SIGNAL \almacen[4][0][2]~0_combout\ : std_logic;
SIGNAL \almacen[6][2][1]~0_combout\ : std_logic;
SIGNAL \almacen[4][2][2]~2_combout\ : std_logic;
SIGNAL \actualizar_stock~input_o\ : std_logic;
SIGNAL \almacen[4][0][2]~feeder_combout\ : std_logic;
SIGNAL \almacen[4][0][2]~2_combout\ : std_logic;
SIGNAL \almacen[4][0][2]~q\ : std_logic;
SIGNAL \Mux40~0_combout\ : std_logic;
SIGNAL \Mux40~1_combout\ : std_logic;
SIGNAL \almacen[2][0][2]~0_combout\ : std_logic;
SIGNAL \almacen[2][1][2]~0_combout\ : std_logic;
SIGNAL \almacen[2][1][2]~q\ : std_logic;
SIGNAL \Mux40~4_combout\ : std_logic;
SIGNAL \almacen[2][2][2]~0_combout\ : std_logic;
SIGNAL \almacen[2][2][2]~q\ : std_logic;
SIGNAL \almacen[3][2][2]~0_combout\ : std_logic;
SIGNAL \almacen[3][2][2]~q\ : std_logic;
SIGNAL \almacen[3][1][2]~0_combout\ : std_logic;
SIGNAL \almacen[3][1][2]~q\ : std_logic;
SIGNAL \Mux40~3_combout\ : std_logic;
SIGNAL \almacen[3][0][2]~feeder_combout\ : std_logic;
SIGNAL \almacen[3][0][2]~0_combout\ : std_logic;
SIGNAL \almacen[3][0][2]~q\ : std_logic;
SIGNAL \Mux40~12_combout\ : std_logic;
SIGNAL \Mux40~13_combout\ : std_logic;
SIGNAL \Mux40~5_combout\ : std_logic;
SIGNAL \almacen[1][1][2]~feeder_combout\ : std_logic;
SIGNAL \almacen[1][1][2]~0_combout\ : std_logic;
SIGNAL \almacen[1][1][2]~q\ : std_logic;
SIGNAL \almacen[1][2][2]~0_combout\ : std_logic;
SIGNAL \almacen[1][2][2]~q\ : std_logic;
SIGNAL \almacen[0][2][2]~2_combout\ : std_logic;
SIGNAL \almacen[0][2][2]~q\ : std_logic;
SIGNAL \almacen[1][0][2]~0_combout\ : std_logic;
SIGNAL \almacen[1][0][2]~q\ : std_logic;
SIGNAL \Mux40~9_combout\ : std_logic;
SIGNAL \Mux40~10_combout\ : std_logic;
SIGNAL \almacen[2][0][2]~1_combout\ : std_logic;
SIGNAL \almacen[2][0][2]~q\ : std_logic;
SIGNAL \Mux40~2_combout\ : std_logic;
SIGNAL \Mux40~11_combout\ : std_logic;
SIGNAL \Mux40~14_combout\ : std_logic;
SIGNAL \Mux40~15_combout\ : std_logic;
SIGNAL \almacen[4][1][2]~feeder_combout\ : std_logic;
SIGNAL \almacen[4][1][2]~0_combout\ : std_logic;
SIGNAL \almacen[4][1][2]~q\ : std_logic;
SIGNAL \almacen[6][0][2]~0_combout\ : std_logic;
SIGNAL \almacen[6][0][2]~1_combout\ : std_logic;
SIGNAL \almacen[6][0][2]~q\ : std_logic;
SIGNAL \Mux40~6_combout\ : std_logic;
SIGNAL \Mux40~7_combout\ : std_logic;
SIGNAL \almacen[5][0][2]~0_combout\ : std_logic;
SIGNAL \almacen[5][1][2]~0_combout\ : std_logic;
SIGNAL \almacen[5][1][2]~q\ : std_logic;
SIGNAL \almacen[5][2][2]~0_combout\ : std_logic;
SIGNAL \almacen[5][2][2]~q\ : std_logic;
SIGNAL \almacen[4][2][2]~feeder_combout\ : std_logic;
SIGNAL \almacen[4][2][2]~4_combout\ : std_logic;
SIGNAL \almacen[4][2][2]~q\ : std_logic;
SIGNAL \almacen[5][0][2]~feeder_combout\ : std_logic;
SIGNAL \almacen[5][0][2]~1_combout\ : std_logic;
SIGNAL \almacen[5][0][2]~q\ : std_logic;
SIGNAL \Mux40~16_combout\ : std_logic;
SIGNAL \Mux40~17_combout\ : std_logic;
SIGNAL \Mux40~18_combout\ : std_logic;
SIGNAL \almacen[6][2][2]~feeder_combout\ : std_logic;
SIGNAL \almacen[6][2][2]~q\ : std_logic;
SIGNAL \almacen[6][1][2]~0_combout\ : std_logic;
SIGNAL \almacen[6][1][2]~q\ : std_logic;
SIGNAL \Mux40~19_combout\ : std_logic;
SIGNAL \Mux40~20_combout\ : std_logic;
SIGNAL \Add3~3_combout\ : std_logic;
SIGNAL \almacen[0][1][2]~1_combout\ : std_logic;
SIGNAL \almacen[0][1][2]~q\ : std_logic;
SIGNAL \almacen[0][0][2]~0_combout\ : std_logic;
SIGNAL \almacen[0][0][2]~1_combout\ : std_logic;
SIGNAL \almacen[0][0][2]~q\ : std_logic;
SIGNAL \Mux40~21_combout\ : std_logic;
SIGNAL \Mux40~22_combout\ : std_logic;
SIGNAL \almacen[4][2][2]~3_combout\ : std_logic;
SIGNAL \almacen[6][2][2]~0_combout\ : std_logic;
SIGNAL \almacen[6][2][1]~q\ : std_logic;
SIGNAL \almacen[5][0][1]~0_combout\ : std_logic;
SIGNAL \almacen[5][0][1]~q\ : std_logic;
SIGNAL \almacen[5][1][1]~0_combout\ : std_logic;
SIGNAL \almacen[5][1][1]~q\ : std_logic;
SIGNAL \Mux41~7_combout\ : std_logic;
SIGNAL \almacen[4][2][1]~q\ : std_logic;
SIGNAL \almacen[5][2][1]~0_combout\ : std_logic;
SIGNAL \almacen[5][2][1]~q\ : std_logic;
SIGNAL \Mux41~8_combout\ : std_logic;
SIGNAL \almacen[6][0][1]~0_combout\ : std_logic;
SIGNAL \almacen[6][0][1]~q\ : std_logic;
SIGNAL \almacen[6][1][1]~0_combout\ : std_logic;
SIGNAL \almacen[6][1][1]~q\ : std_logic;
SIGNAL \Mux41~9_combout\ : std_logic;
SIGNAL \Mux41~10_combout\ : std_logic;
SIGNAL \almacen[4][0][1]~feeder_combout\ : std_logic;
SIGNAL \almacen[4][0][1]~q\ : std_logic;
SIGNAL \almacen[4][1][1]~0_combout\ : std_logic;
SIGNAL \almacen[4][1][1]~q\ : std_logic;
SIGNAL \Mux41~6_combout\ : std_logic;
SIGNAL \almacen[2][1][1]~q\ : std_logic;
SIGNAL \almacen[2][0][1]~q\ : std_logic;
SIGNAL \Mux41~2_combout\ : std_logic;
SIGNAL \almacen[0][2][1]~q\ : std_logic;
SIGNAL \almacen[1][2][1]~feeder_combout\ : std_logic;
SIGNAL \almacen[1][2][1]~q\ : std_logic;
SIGNAL \almacen[1][0][1]~q\ : std_logic;
SIGNAL \almacen[1][1][1]~0_combout\ : std_logic;
SIGNAL \almacen[1][1][1]~q\ : std_logic;
SIGNAL \Mux41~0_combout\ : std_logic;
SIGNAL \Mux41~1_combout\ : std_logic;
SIGNAL \almacen[3][0][1]~q\ : std_logic;
SIGNAL \almacen[2][2][1]~0_combout\ : std_logic;
SIGNAL \almacen[2][2][1]~q\ : std_logic;
SIGNAL \Mux41~3_combout\ : std_logic;
SIGNAL \almacen[3][2][1]~q\ : std_logic;
SIGNAL \almacen[3][1][1]~feeder_combout\ : std_logic;
SIGNAL \almacen[3][1][1]~q\ : std_logic;
SIGNAL \Mux41~4_combout\ : std_logic;
SIGNAL \Mux41~5_combout\ : std_logic;
SIGNAL \Mux41~11_combout\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \almacen[0][0][1]~feeder_combout\ : std_logic;
SIGNAL \almacen[0][0][1]~q\ : std_logic;
SIGNAL \almacen[0][1][1]~feeder_combout\ : std_logic;
SIGNAL \almacen[0][1][1]~q\ : std_logic;
SIGNAL \Mux41~12_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \almacen[4][0][2]~1_combout\ : std_logic;
SIGNAL \almacen[0][1][2]~0_combout\ : std_logic;
SIGNAL \almacen[0][1][0]~q\ : std_logic;
SIGNAL \Mux42~12_combout\ : std_logic;
SIGNAL \almacen[3][2][0]~0_combout\ : std_logic;
SIGNAL \almacen[3][2][0]~q\ : std_logic;
SIGNAL \almacen[2][2][0]~q\ : std_logic;
SIGNAL \almacen[3][0][0]~feeder_combout\ : std_logic;
SIGNAL \almacen[3][0][0]~q\ : std_logic;
SIGNAL \almacen[3][1][0]~q\ : std_logic;
SIGNAL \Mux42~3_combout\ : std_logic;
SIGNAL \Mux42~4_combout\ : std_logic;
SIGNAL \almacen[2][1][0]~q\ : std_logic;
SIGNAL \almacen[2][0][0]~0_combout\ : std_logic;
SIGNAL \almacen[2][0][0]~q\ : std_logic;
SIGNAL \almacen[1][2][0]~0_combout\ : std_logic;
SIGNAL \almacen[1][2][0]~feeder_combout\ : std_logic;
SIGNAL \almacen[1][2][0]~q\ : std_logic;
SIGNAL \almacen[0][2][0]~q\ : std_logic;
SIGNAL \almacen[1][0][0]~q\ : std_logic;
SIGNAL \Mux42~0_combout\ : std_logic;
SIGNAL \almacen[1][1][0]~q\ : std_logic;
SIGNAL \Mux42~1_combout\ : std_logic;
SIGNAL \Mux42~2_combout\ : std_logic;
SIGNAL \Mux42~5_combout\ : std_logic;
SIGNAL \almacen[4][0][0]~0_combout\ : std_logic;
SIGNAL \almacen[4][0][0]~q\ : std_logic;
SIGNAL \Mux42~6_combout\ : std_logic;
SIGNAL \almacen[6][0][0]~0_combout\ : std_logic;
SIGNAL \almacen[6][0][0]~q\ : std_logic;
SIGNAL \almacen[4][2][0]~q\ : std_logic;
SIGNAL \almacen[5][0][0]~0_combout\ : std_logic;
SIGNAL \almacen[5][0][0]~q\ : std_logic;
SIGNAL \Mux42~7_combout\ : std_logic;
SIGNAL \almacen[5][2][0]~0_combout\ : std_logic;
SIGNAL \almacen[5][2][0]~q\ : std_logic;
SIGNAL \almacen[5][1][0]~0_combout\ : std_logic;
SIGNAL \almacen[5][1][0]~q\ : std_logic;
SIGNAL \Mux42~8_combout\ : std_logic;
SIGNAL \Mux42~9_combout\ : std_logic;
SIGNAL \almacen[6][2][0]~0_combout\ : std_logic;
SIGNAL \almacen[6][2][0]~q\ : std_logic;
SIGNAL \almacen[6][1][0]~0_combout\ : std_logic;
SIGNAL \almacen[6][1][0]~q\ : std_logic;
SIGNAL \Mux42~10_combout\ : std_logic;
SIGNAL \almacen[4][1][0]~feeder_combout\ : std_logic;
SIGNAL \almacen[4][1][0]~q\ : std_logic;
SIGNAL \Mux42~11_combout\ : std_logic;
SIGNAL \Mux42~13_combout\ : std_logic;
SIGNAL \almacen[0][0][0]~0_combout\ : std_logic;
SIGNAL \almacen[0][0][0]~q\ : std_logic;
SIGNAL \LessThan5~2_combout\ : std_logic;
SIGNAL \LessThan5~1_combout\ : std_logic;
SIGNAL \LessThan5~3_combout\ : std_logic;
SIGNAL \Mux91~7_combout\ : std_logic;
SIGNAL \Mux91~2_combout\ : std_logic;
SIGNAL \Mux90~6_combout\ : std_logic;
SIGNAL \Mux91~3_combout\ : std_logic;
SIGNAL \Mux91~8_combout\ : std_logic;
SIGNAL \Mux90~9_combout\ : std_logic;
SIGNAL \Mux91~5_combout\ : std_logic;
SIGNAL \Mux91~6_combout\ : std_logic;
SIGNAL \Mux90~7_combout\ : std_logic;
SIGNAL \Mux90~8_combout\ : std_logic;
SIGNAL \Mux90~10_combout\ : std_logic;
SIGNAL \Mux91~11_combout\ : std_logic;
SIGNAL \Mux90~3_combout\ : std_logic;
SIGNAL \Mux90~4_combout\ : std_logic;
SIGNAL \Mux90~0_combout\ : std_logic;
SIGNAL \Mux90~1_combout\ : std_logic;
SIGNAL \Mux91~4_combout\ : std_logic;
SIGNAL \Mux90~2_combout\ : std_logic;
SIGNAL \Mux90~5_combout\ : std_logic;
SIGNAL \Mux90~11_combout\ : std_logic;
SIGNAL \Mux91~17_combout\ : std_logic;
SIGNAL \Mux91~18_combout\ : std_logic;
SIGNAL \Mux91~19_combout\ : std_logic;
SIGNAL \Mux91~20_combout\ : std_logic;
SIGNAL \Mux91~9_combout\ : std_logic;
SIGNAL \Mux91~10_combout\ : std_logic;
SIGNAL \Mux91~12_combout\ : std_logic;
SIGNAL \Mux91~13_combout\ : std_logic;
SIGNAL \Mux91~14_combout\ : std_logic;
SIGNAL \Mux91~15_combout\ : std_logic;
SIGNAL \Mux91~16_combout\ : std_logic;
SIGNAL \Mux91~21_combout\ : std_logic;
SIGNAL \Mux89~2_combout\ : std_logic;
SIGNAL \Mux89~4_combout\ : std_logic;
SIGNAL \Mux89~0_combout\ : std_logic;
SIGNAL \Mux89~1_combout\ : std_logic;
SIGNAL \Mux89~3_combout\ : std_logic;
SIGNAL \Mux89~5_combout\ : std_logic;
SIGNAL \Mux89~6_combout\ : std_logic;
SIGNAL \Mux89~7_combout\ : std_logic;
SIGNAL \Mux89~8_combout\ : std_logic;
SIGNAL \Mux89~9_combout\ : std_logic;
SIGNAL \Mux89~10_combout\ : std_logic;
SIGNAL \Mux89~11_combout\ : std_logic;
SIGNAL \Mux89~12_combout\ : std_logic;
SIGNAL \Mux89~13_combout\ : std_logic;
SIGNAL \Mux89~14_combout\ : std_logic;
SIGNAL \LessThan5~0_combout\ : std_logic;
SIGNAL \stock_disponible~0_combout\ : std_logic;
SIGNAL \stock_disponible~reg0_q\ : std_logic;
SIGNAL \Mux43~0_combout\ : std_logic;
SIGNAL \confirmar_pulsado_int~q\ : std_logic;
SIGNAL \Mux59~0_combout\ : std_logic;
SIGNAL \Mux59~1_combout\ : std_logic;
SIGNAL \devolver_pulsado_int~q\ : std_logic;
SIGNAL key_stable : std_logic_vector(3 DOWNTO 0);
SIGNAL key_prev_stable : std_logic_vector(3 DOWNTO 0);
SIGNAL key_prev_raw : std_logic_vector(3 DOWNTO 0);
SIGNAL div_counter : std_logic_vector(19 DOWNTO 0);
SIGNAL digito_unidades_int : std_logic_vector(3 DOWNTO 0);
SIGNAL digito_decenas_int : std_logic_vector(3 DOWNTO 0);
SIGNAL debounce_count : std_logic_vector(20 DOWNTO 0);
SIGNAL col_sel : std_logic_vector(1 DOWNTO 0);
SIGNAL codigo_ingresado_int : std_logic_vector(6 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_key_stable[0]~5_combout\ : std_logic;
SIGNAL \ALT_INV_key_valid_int~q\ : std_logic;
SIGNAL \ALT_INV_Mux15~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_teclado_filas <= teclado_filas;
ww_actualizar_stock <= actualizar_stock;
ww_fila_compra <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(fila_compra, 3);
ww_columna_compra <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(columna_compra, 2);
teclado_columnas <= ww_teclado_columnas;
digito_decenas <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_digito_decenas));
digito_unidades <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_digito_unidades));
codigo_ingresado <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_codigo_ingresado));
precio_actual <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_precio_actual));
stock_disponible <= ww_stock_disponible;
key_valid <= ww_key_valid;
confirmar_pulsado <= ww_confirmar_pulsado;
devolver_pulsado <= ww_devolver_pulsado;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\slow_clk~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \slow_clk~q\);

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_key_stable[0]~5_combout\ <= NOT \key_stable[0]~5_combout\;
\ALT_INV_key_valid_int~q\ <= NOT \key_valid_int~q\;
\ALT_INV_Mux15~0_combout\ <= NOT \Mux15~0_combout\;

-- Location: IOOBUF_X9_Y0_N9
\teclado_columnas[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux15~0_combout\,
	devoe => ww_devoe,
	o => \teclado_columnas[0]~output_o\);

-- Location: IOOBUF_X7_Y0_N2
\teclado_columnas[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux2~0_combout\,
	devoe => ww_devoe,
	o => \teclado_columnas[1]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\teclado_columnas[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~0_combout\,
	devoe => ww_devoe,
	o => \teclado_columnas[2]~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\teclado_columnas[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux0~0_combout\,
	devoe => ww_devoe,
	o => \teclado_columnas[3]~output_o\);

-- Location: IOOBUF_X41_Y22_N2
\digito_decenas[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => digito_decenas_int(0),
	devoe => ww_devoe,
	o => \digito_decenas[0]~output_o\);

-- Location: IOOBUF_X41_Y22_N16
\digito_decenas[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => digito_decenas_int(1),
	devoe => ww_devoe,
	o => \digito_decenas[1]~output_o\);

-- Location: IOOBUF_X23_Y29_N9
\digito_decenas[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => digito_decenas_int(2),
	devoe => ww_devoe,
	o => \digito_decenas[2]~output_o\);

-- Location: IOOBUF_X23_Y29_N23
\digito_decenas[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => digito_decenas_int(3),
	devoe => ww_devoe,
	o => \digito_decenas[3]~output_o\);

-- Location: IOOBUF_X23_Y29_N2
\digito_unidades[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => codigo_ingresado_int(0),
	devoe => ww_devoe,
	o => \digito_unidades[0]~output_o\);

-- Location: IOOBUF_X26_Y0_N30
\digito_unidades[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => digito_unidades_int(1),
	devoe => ww_devoe,
	o => \digito_unidades[1]~output_o\);

-- Location: IOOBUF_X23_Y29_N16
\digito_unidades[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => digito_unidades_int(2),
	devoe => ww_devoe,
	o => \digito_unidades[2]~output_o\);

-- Location: IOOBUF_X23_Y29_N30
\digito_unidades[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => digito_unidades_int(3),
	devoe => ww_devoe,
	o => \digito_unidades[3]~output_o\);

-- Location: IOOBUF_X26_Y29_N30
\codigo_ingresado[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => codigo_ingresado_int(0),
	devoe => ww_devoe,
	o => \codigo_ingresado[0]~output_o\);

-- Location: IOOBUF_X30_Y29_N9
\codigo_ingresado[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => codigo_ingresado_int(1),
	devoe => ww_devoe,
	o => \codigo_ingresado[1]~output_o\);

-- Location: IOOBUF_X30_Y29_N30
\codigo_ingresado[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => codigo_ingresado_int(2),
	devoe => ww_devoe,
	o => \codigo_ingresado[2]~output_o\);

-- Location: IOOBUF_X26_Y29_N23
\codigo_ingresado[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => codigo_ingresado_int(3),
	devoe => ww_devoe,
	o => \codigo_ingresado[3]~output_o\);

-- Location: IOOBUF_X28_Y29_N16
\codigo_ingresado[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => codigo_ingresado_int(4),
	devoe => ww_devoe,
	o => \codigo_ingresado[4]~output_o\);

-- Location: IOOBUF_X28_Y29_N9
\codigo_ingresado[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => codigo_ingresado_int(5),
	devoe => ww_devoe,
	o => \codigo_ingresado[5]~output_o\);

-- Location: IOOBUF_X26_Y29_N2
\codigo_ingresado[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => codigo_ingresado_int(6),
	devoe => ww_devoe,
	o => \codigo_ingresado[6]~output_o\);

-- Location: IOOBUF_X41_Y25_N2
\precio_actual[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \precio_actual[0]~reg0_q\,
	devoe => ww_devoe,
	o => \precio_actual[0]~output_o\);

-- Location: IOOBUF_X26_Y29_N16
\precio_actual[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \precio_actual[1]~reg0_q\,
	devoe => ww_devoe,
	o => \precio_actual[1]~output_o\);

-- Location: IOOBUF_X30_Y29_N23
\precio_actual[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \precio_actual[2]~reg0_q\,
	devoe => ww_devoe,
	o => \precio_actual[2]~output_o\);

-- Location: IOOBUF_X28_Y29_N30
\precio_actual[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \precio_actual[3]~reg0_q\,
	devoe => ww_devoe,
	o => \precio_actual[3]~output_o\);

-- Location: IOOBUF_X28_Y29_N23
\precio_actual[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \precio_actual[4]~reg0_q\,
	devoe => ww_devoe,
	o => \precio_actual[4]~output_o\);

-- Location: IOOBUF_X26_Y29_N9
\precio_actual[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \precio_actual[5]~reg0_q\,
	devoe => ww_devoe,
	o => \precio_actual[5]~output_o\);

-- Location: IOOBUF_X26_Y0_N23
\precio_actual[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \precio_actual[6]~output_o\);

-- Location: IOOBUF_X28_Y29_N2
\stock_disponible~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \stock_disponible~reg0_q\,
	devoe => ww_devoe,
	o => \stock_disponible~output_o\);

-- Location: IOOBUF_X9_Y0_N16
\key_valid~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \key_valid_int~q\,
	devoe => ww_devoe,
	o => \key_valid~output_o\);

-- Location: IOOBUF_X9_Y29_N2
\confirmar_pulsado~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \confirmar_pulsado_int~q\,
	devoe => ww_devoe,
	o => \confirmar_pulsado~output_o\);

-- Location: IOOBUF_X9_Y0_N2
\devolver_pulsado~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \devolver_pulsado_int~q\,
	devoe => ww_devoe,
	o => \devolver_pulsado~output_o\);

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

-- Location: LCCOMB_X22_Y27_N8
\div_counter[0]~57\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[0]~57_combout\ = !div_counter(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => div_counter(0),
	combout => \div_counter[0]~57_combout\);

-- Location: FF_X22_Y27_N9
\div_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[0]~57_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(0));

-- Location: LCCOMB_X22_Y27_N14
\div_counter[1]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[1]~19_combout\ = (div_counter(0) & (div_counter(1) $ (VCC))) # (!div_counter(0) & (div_counter(1) & VCC))
-- \div_counter[1]~20\ = CARRY((div_counter(0) & div_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_counter(0),
	datab => div_counter(1),
	datad => VCC,
	combout => \div_counter[1]~19_combout\,
	cout => \div_counter[1]~20\);

-- Location: FF_X22_Y27_N15
\div_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[1]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(1));

-- Location: LCCOMB_X22_Y27_N16
\div_counter[2]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[2]~21_combout\ = (div_counter(2) & (!\div_counter[1]~20\)) # (!div_counter(2) & ((\div_counter[1]~20\) # (GND)))
-- \div_counter[2]~22\ = CARRY((!\div_counter[1]~20\) # (!div_counter(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => div_counter(2),
	datad => VCC,
	cin => \div_counter[1]~20\,
	combout => \div_counter[2]~21_combout\,
	cout => \div_counter[2]~22\);

-- Location: FF_X22_Y27_N17
\div_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[2]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(2));

-- Location: LCCOMB_X22_Y27_N18
\div_counter[3]~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[3]~23_combout\ = (div_counter(3) & (\div_counter[2]~22\ $ (GND))) # (!div_counter(3) & (!\div_counter[2]~22\ & VCC))
-- \div_counter[3]~24\ = CARRY((div_counter(3) & !\div_counter[2]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => div_counter(3),
	datad => VCC,
	cin => \div_counter[2]~22\,
	combout => \div_counter[3]~23_combout\,
	cout => \div_counter[3]~24\);

-- Location: FF_X22_Y27_N19
\div_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[3]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(3));

-- Location: LCCOMB_X22_Y27_N20
\div_counter[4]~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[4]~25_combout\ = (div_counter(4) & (!\div_counter[3]~24\)) # (!div_counter(4) & ((\div_counter[3]~24\) # (GND)))
-- \div_counter[4]~26\ = CARRY((!\div_counter[3]~24\) # (!div_counter(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => div_counter(4),
	datad => VCC,
	cin => \div_counter[3]~24\,
	combout => \div_counter[4]~25_combout\,
	cout => \div_counter[4]~26\);

-- Location: FF_X22_Y27_N21
\div_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[4]~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(4));

-- Location: LCCOMB_X22_Y27_N22
\div_counter[5]~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[5]~27_combout\ = (div_counter(5) & (\div_counter[4]~26\ $ (GND))) # (!div_counter(5) & (!\div_counter[4]~26\ & VCC))
-- \div_counter[5]~28\ = CARRY((div_counter(5) & !\div_counter[4]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_counter(5),
	datad => VCC,
	cin => \div_counter[4]~26\,
	combout => \div_counter[5]~27_combout\,
	cout => \div_counter[5]~28\);

-- Location: FF_X22_Y27_N23
\div_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[5]~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(5));

-- Location: LCCOMB_X22_Y27_N24
\div_counter[6]~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[6]~29_combout\ = (div_counter(6) & (!\div_counter[5]~28\)) # (!div_counter(6) & ((\div_counter[5]~28\) # (GND)))
-- \div_counter[6]~30\ = CARRY((!\div_counter[5]~28\) # (!div_counter(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => div_counter(6),
	datad => VCC,
	cin => \div_counter[5]~28\,
	combout => \div_counter[6]~29_combout\,
	cout => \div_counter[6]~30\);

-- Location: FF_X22_Y27_N25
\div_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[6]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(6));

-- Location: LCCOMB_X22_Y27_N26
\div_counter[7]~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[7]~31_combout\ = (div_counter(7) & (\div_counter[6]~30\ $ (GND))) # (!div_counter(7) & (!\div_counter[6]~30\ & VCC))
-- \div_counter[7]~32\ = CARRY((div_counter(7) & !\div_counter[6]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => div_counter(7),
	datad => VCC,
	cin => \div_counter[6]~30\,
	combout => \div_counter[7]~31_combout\,
	cout => \div_counter[7]~32\);

-- Location: FF_X22_Y27_N27
\div_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[7]~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(7));

-- Location: LCCOMB_X22_Y27_N28
\div_counter[8]~33\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[8]~33_combout\ = (div_counter(8) & (!\div_counter[7]~32\)) # (!div_counter(8) & ((\div_counter[7]~32\) # (GND)))
-- \div_counter[8]~34\ = CARRY((!\div_counter[7]~32\) # (!div_counter(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => div_counter(8),
	datad => VCC,
	cin => \div_counter[7]~32\,
	combout => \div_counter[8]~33_combout\,
	cout => \div_counter[8]~34\);

-- Location: FF_X22_Y27_N29
\div_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[8]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(8));

-- Location: LCCOMB_X22_Y27_N30
\div_counter[9]~35\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[9]~35_combout\ = (div_counter(9) & (\div_counter[8]~34\ $ (GND))) # (!div_counter(9) & (!\div_counter[8]~34\ & VCC))
-- \div_counter[9]~36\ = CARRY((div_counter(9) & !\div_counter[8]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_counter(9),
	datad => VCC,
	cin => \div_counter[8]~34\,
	combout => \div_counter[9]~35_combout\,
	cout => \div_counter[9]~36\);

-- Location: FF_X22_Y27_N31
\div_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[9]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(9));

-- Location: LCCOMB_X22_Y26_N0
\div_counter[10]~37\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[10]~37_combout\ = (div_counter(10) & (!\div_counter[9]~36\)) # (!div_counter(10) & ((\div_counter[9]~36\) # (GND)))
-- \div_counter[10]~38\ = CARRY((!\div_counter[9]~36\) # (!div_counter(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => div_counter(10),
	datad => VCC,
	cin => \div_counter[9]~36\,
	combout => \div_counter[10]~37_combout\,
	cout => \div_counter[10]~38\);

-- Location: FF_X22_Y26_N1
\div_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[10]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(10));

-- Location: LCCOMB_X22_Y26_N2
\div_counter[11]~39\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[11]~39_combout\ = (div_counter(11) & (\div_counter[10]~38\ $ (GND))) # (!div_counter(11) & (!\div_counter[10]~38\ & VCC))
-- \div_counter[11]~40\ = CARRY((div_counter(11) & !\div_counter[10]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => div_counter(11),
	datad => VCC,
	cin => \div_counter[10]~38\,
	combout => \div_counter[11]~39_combout\,
	cout => \div_counter[11]~40\);

-- Location: FF_X22_Y26_N3
\div_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[11]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(11));

-- Location: LCCOMB_X22_Y26_N4
\div_counter[12]~41\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[12]~41_combout\ = (div_counter(12) & (!\div_counter[11]~40\)) # (!div_counter(12) & ((\div_counter[11]~40\) # (GND)))
-- \div_counter[12]~42\ = CARRY((!\div_counter[11]~40\) # (!div_counter(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => div_counter(12),
	datad => VCC,
	cin => \div_counter[11]~40\,
	combout => \div_counter[12]~41_combout\,
	cout => \div_counter[12]~42\);

-- Location: FF_X22_Y26_N5
\div_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(12));

-- Location: LCCOMB_X22_Y26_N6
\div_counter[13]~43\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[13]~43_combout\ = (div_counter(13) & (\div_counter[12]~42\ $ (GND))) # (!div_counter(13) & (!\div_counter[12]~42\ & VCC))
-- \div_counter[13]~44\ = CARRY((div_counter(13) & !\div_counter[12]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_counter(13),
	datad => VCC,
	cin => \div_counter[12]~42\,
	combout => \div_counter[13]~43_combout\,
	cout => \div_counter[13]~44\);

-- Location: FF_X22_Y26_N7
\div_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[13]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(13));

-- Location: LCCOMB_X22_Y26_N8
\div_counter[14]~45\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[14]~45_combout\ = (div_counter(14) & (!\div_counter[13]~44\)) # (!div_counter(14) & ((\div_counter[13]~44\) # (GND)))
-- \div_counter[14]~46\ = CARRY((!\div_counter[13]~44\) # (!div_counter(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => div_counter(14),
	datad => VCC,
	cin => \div_counter[13]~44\,
	combout => \div_counter[14]~45_combout\,
	cout => \div_counter[14]~46\);

-- Location: FF_X22_Y26_N9
\div_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[14]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(14));

-- Location: LCCOMB_X22_Y26_N10
\div_counter[15]~47\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[15]~47_combout\ = (div_counter(15) & (\div_counter[14]~46\ $ (GND))) # (!div_counter(15) & (!\div_counter[14]~46\ & VCC))
-- \div_counter[15]~48\ = CARRY((div_counter(15) & !\div_counter[14]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_counter(15),
	datad => VCC,
	cin => \div_counter[14]~46\,
	combout => \div_counter[15]~47_combout\,
	cout => \div_counter[15]~48\);

-- Location: FF_X22_Y26_N11
\div_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[15]~47_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(15));

-- Location: LCCOMB_X22_Y26_N12
\div_counter[16]~49\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[16]~49_combout\ = (div_counter(16) & (!\div_counter[15]~48\)) # (!div_counter(16) & ((\div_counter[15]~48\) # (GND)))
-- \div_counter[16]~50\ = CARRY((!\div_counter[15]~48\) # (!div_counter(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => div_counter(16),
	datad => VCC,
	cin => \div_counter[15]~48\,
	combout => \div_counter[16]~49_combout\,
	cout => \div_counter[16]~50\);

-- Location: FF_X22_Y26_N13
\div_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[16]~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(16));

-- Location: LCCOMB_X22_Y26_N14
\div_counter[17]~51\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[17]~51_combout\ = (div_counter(17) & (\div_counter[16]~50\ $ (GND))) # (!div_counter(17) & (!\div_counter[16]~50\ & VCC))
-- \div_counter[17]~52\ = CARRY((div_counter(17) & !\div_counter[16]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => div_counter(17),
	datad => VCC,
	cin => \div_counter[16]~50\,
	combout => \div_counter[17]~51_combout\,
	cout => \div_counter[17]~52\);

-- Location: FF_X22_Y26_N15
\div_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[17]~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(17));

-- Location: LCCOMB_X22_Y26_N16
\div_counter[18]~53\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[18]~53_combout\ = (div_counter(18) & (!\div_counter[17]~52\)) # (!div_counter(18) & ((\div_counter[17]~52\) # (GND)))
-- \div_counter[18]~54\ = CARRY((!\div_counter[17]~52\) # (!div_counter(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => div_counter(18),
	datad => VCC,
	cin => \div_counter[17]~52\,
	combout => \div_counter[18]~53_combout\,
	cout => \div_counter[18]~54\);

-- Location: FF_X22_Y26_N17
\div_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[18]~53_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(18));

-- Location: LCCOMB_X22_Y26_N18
\div_counter[19]~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \div_counter[19]~55_combout\ = \div_counter[18]~54\ $ (!div_counter(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => div_counter(19),
	cin => \div_counter[18]~54\,
	combout => \div_counter[19]~55_combout\);

-- Location: FF_X22_Y26_N19
\div_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \div_counter[19]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_counter(19));

-- Location: LCCOMB_X22_Y26_N20
\Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!div_counter(16) & (!div_counter(18) & (!div_counter(17) & !div_counter(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_counter(16),
	datab => div_counter(18),
	datac => div_counter(17),
	datad => div_counter(19),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X22_Y26_N26
\Equal0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (!div_counter(15) & (!div_counter(14) & (!div_counter(12) & !div_counter(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_counter(15),
	datab => div_counter(14),
	datac => div_counter(12),
	datad => div_counter(13),
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X22_Y26_N28
\Equal0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (!div_counter(9) & (!div_counter(11) & (!div_counter(8) & !div_counter(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_counter(9),
	datab => div_counter(11),
	datac => div_counter(8),
	datad => div_counter(10),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X22_Y27_N12
\Equal0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!div_counter(5) & (!div_counter(6) & (!div_counter(7) & !div_counter(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_counter(5),
	datab => div_counter(6),
	datac => div_counter(7),
	datad => div_counter(4),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X22_Y27_N6
\Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!div_counter(0) & (!div_counter(3) & (!div_counter(1) & !div_counter(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => div_counter(0),
	datab => div_counter(3),
	datac => div_counter(1),
	datad => div_counter(2),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X22_Y26_N24
\Equal0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (\Equal0~4_combout\ & (\Equal0~3_combout\ & (\Equal0~2_combout\ & \Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~4_combout\,
	datab => \Equal0~3_combout\,
	datac => \Equal0~2_combout\,
	datad => \Equal0~1_combout\,
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X22_Y26_N22
\slow_clk~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \slow_clk~0_combout\ = \slow_clk~q\ $ (((\Equal0~0_combout\ & \Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~0_combout\,
	datac => \slow_clk~q\,
	datad => \Equal0~5_combout\,
	combout => \slow_clk~0_combout\);

-- Location: LCCOMB_X22_Y26_N30
\slow_clk~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \slow_clk~feeder_combout\ = \slow_clk~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \slow_clk~0_combout\,
	combout => \slow_clk~feeder_combout\);

-- Location: FF_X22_Y26_N31
slow_clk : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \slow_clk~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \slow_clk~q\);

-- Location: CLKCTRL_G14
\slow_clk~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \slow_clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \slow_clk~clkctrl_outclk\);

-- Location: LCCOMB_X11_Y7_N28
\col_sel[0]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \col_sel[0]~1_combout\ = !col_sel(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => col_sel(0),
	combout => \col_sel[0]~1_combout\);

-- Location: FF_X11_Y7_N29
\col_sel[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \slow_clk~clkctrl_outclk\,
	d => \col_sel[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => col_sel(0));

-- Location: LCCOMB_X11_Y7_N6
\col_sel[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \col_sel[1]~0_combout\ = col_sel(1) $ (col_sel(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => col_sel(1),
	datad => col_sel(0),
	combout => \col_sel[1]~0_combout\);

-- Location: FF_X11_Y7_N7
\col_sel[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \slow_clk~clkctrl_outclk\,
	d => \col_sel[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => col_sel(1));

-- Location: LCCOMB_X11_Y7_N0
\Mux15~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = (!col_sel(1) & !col_sel(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => col_sel(1),
	datac => col_sel(0),
	combout => \Mux15~0_combout\);

-- Location: LCCOMB_X9_Y8_N8
\Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (col_sel(1)) # (!col_sel(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => col_sel(1),
	datad => col_sel(0),
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X10_Y7_N24
\Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (col_sel(0)) # (!col_sel(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => col_sel(0),
	datac => col_sel(1),
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X9_Y8_N2
\Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (!col_sel(0)) # (!col_sel(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => col_sel(1),
	datad => col_sel(0),
	combout => \Mux0~0_combout\);

-- Location: IOIBUF_X11_Y0_N8
\teclado_filas[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_teclado_filas(1),
	o => \teclado_filas[1]~input_o\);

-- Location: IOIBUF_X11_Y0_N1
\teclado_filas[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_teclado_filas(3),
	o => \teclado_filas[3]~input_o\);

-- Location: IOIBUF_X11_Y0_N15
\teclado_filas[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_teclado_filas(2),
	o => \teclado_filas[2]~input_o\);

-- Location: IOIBUF_X11_Y29_N1
\teclado_filas[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_teclado_filas(0),
	o => \teclado_filas[0]~input_o\);

-- Location: LCCOMB_X11_Y7_N22
\Mux10~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\teclado_filas[3]~input_o\ & (\teclado_filas[2]~input_o\ & (\teclado_filas[1]~input_o\ $ (\teclado_filas[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \teclado_filas[1]~input_o\,
	datab => \teclado_filas[3]~input_o\,
	datac => \teclado_filas[2]~input_o\,
	datad => \teclado_filas[0]~input_o\,
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X11_Y7_N18
\Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\teclado_filas[3]~input_o\ & ((\teclado_filas[1]~input_o\ & (\teclado_filas[2]~input_o\ $ (\teclado_filas[0]~input_o\))) # (!\teclado_filas[1]~input_o\ & (\teclado_filas[2]~input_o\ & \teclado_filas[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \teclado_filas[1]~input_o\,
	datab => \teclado_filas[3]~input_o\,
	datac => \teclado_filas[2]~input_o\,
	datad => \teclado_filas[0]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X11_Y7_N8
\Mux7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\teclado_filas[2]~input_o\ & ((\teclado_filas[1]~input_o\ & (\teclado_filas[3]~input_o\ $ (\teclado_filas[0]~input_o\))) # (!\teclado_filas[1]~input_o\ & (\teclado_filas[3]~input_o\ & \teclado_filas[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \teclado_filas[1]~input_o\,
	datab => \teclado_filas[3]~input_o\,
	datac => \teclado_filas[2]~input_o\,
	datad => \teclado_filas[0]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X11_Y7_N2
\Mux15~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux15~1_combout\ = (col_sel(1) & (((col_sel(0))))) # (!col_sel(1) & ((col_sel(0) & ((!\Mux7~0_combout\))) # (!col_sel(0) & (!\Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4~0_combout\,
	datab => \Mux7~0_combout\,
	datac => col_sel(1),
	datad => col_sel(0),
	combout => \Mux15~1_combout\);

-- Location: LCCOMB_X10_Y7_N28
\Mux15~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux15~2_combout\ = (!\Mux15~1_combout\ & ((\Mux10~0_combout\) # (!col_sel(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux10~0_combout\,
	datac => col_sel(1),
	datad => \Mux15~1_combout\,
	combout => \Mux15~2_combout\);

-- Location: LCCOMB_X11_Y7_N20
\Mux14~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux14~0_combout\ = (\teclado_filas[1]~input_o\ & (\teclado_filas[3]~input_o\ & (\teclado_filas[2]~input_o\ $ (\teclado_filas[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \teclado_filas[1]~input_o\,
	datab => \teclado_filas[3]~input_o\,
	datac => \teclado_filas[2]~input_o\,
	datad => \teclado_filas[0]~input_o\,
	combout => \Mux14~0_combout\);

-- Location: LCCOMB_X11_Y7_N26
\Mux9~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (\teclado_filas[1]~input_o\ & ((\teclado_filas[3]~input_o\ & (\teclado_filas[2]~input_o\ $ (\teclado_filas[0]~input_o\))) # (!\teclado_filas[3]~input_o\ & (\teclado_filas[2]~input_o\ & \teclado_filas[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \teclado_filas[1]~input_o\,
	datab => \teclado_filas[3]~input_o\,
	datac => \teclado_filas[2]~input_o\,
	datad => \teclado_filas[0]~input_o\,
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X11_Y7_N14
\Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\teclado_filas[1]~input_o\ & (\teclado_filas[3]~input_o\ & (\teclado_filas[2]~input_o\ & !\teclado_filas[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \teclado_filas[1]~input_o\,
	datab => \teclado_filas[3]~input_o\,
	datac => \teclado_filas[2]~input_o\,
	datad => \teclado_filas[0]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X11_Y7_N4
\Mux16~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux16~0_combout\ = (col_sel(1) & (((col_sel(0))))) # (!col_sel(1) & ((col_sel(0) & (!\Mux9~0_combout\)) # (!col_sel(0) & ((!\Mux5~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~0_combout\,
	datab => \Mux5~0_combout\,
	datac => col_sel(1),
	datad => col_sel(0),
	combout => \Mux16~0_combout\);

-- Location: LCCOMB_X10_Y7_N22
\Mux16~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux16~1_combout\ = (col_sel(1) & ((\Mux16~0_combout\ & (\Mux10~0_combout\)) # (!\Mux16~0_combout\ & ((\Mux14~0_combout\))))) # (!col_sel(1) & (((!\Mux16~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux10~0_combout\,
	datab => \Mux14~0_combout\,
	datac => col_sel(1),
	datad => \Mux16~0_combout\,
	combout => \Mux16~1_combout\);

-- Location: FF_X10_Y7_N23
\key_prev_raw[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux16~1_combout\,
	ena => \Equal1~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => key_prev_raw(2));

-- Location: LCCOMB_X11_Y7_N10
\Mux18~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux18~0_combout\ = (col_sel(0) & (((col_sel(1))))) # (!col_sel(0) & ((\teclado_filas[1]~input_o\ & (!\teclado_filas[3]~input_o\ & !col_sel(1))) # (!\teclado_filas[1]~input_o\ & (\teclado_filas[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \teclado_filas[1]~input_o\,
	datab => \teclado_filas[3]~input_o\,
	datac => col_sel(0),
	datad => col_sel(1),
	combout => \Mux18~0_combout\);

-- Location: LCCOMB_X11_Y7_N24
\Mux18~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux18~1_combout\ = (col_sel(0) & ((\Mux18~0_combout\ & ((\Mux14~0_combout\))) # (!\Mux18~0_combout\ & (\Mux9~0_combout\)))) # (!col_sel(0) & (((\Mux18~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~0_combout\,
	datab => \Mux14~0_combout\,
	datac => col_sel(0),
	datad => \Mux18~0_combout\,
	combout => \Mux18~1_combout\);

-- Location: LCCOMB_X10_Y7_N8
\Mux18~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux18~2_combout\ = (\Mux18~1_combout\ & ((col_sel(0)) # ((\teclado_filas[2]~input_o\ & \teclado_filas[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \teclado_filas[2]~input_o\,
	datab => \teclado_filas[0]~input_o\,
	datac => col_sel(0),
	datad => \Mux18~1_combout\,
	combout => \Mux18~2_combout\);

-- Location: FF_X10_Y7_N9
\key_prev_raw[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux18~2_combout\,
	ena => \Equal1~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => key_prev_raw(0));

-- Location: LCCOMB_X11_Y7_N12
\Mux17~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux17~0_combout\ = (\teclado_filas[1]~input_o\ & ((col_sel(0)) # ((!\teclado_filas[2]~input_o\ & col_sel(1))))) # (!\teclado_filas[1]~input_o\ & (\teclado_filas[2]~input_o\ & (col_sel(0) & !col_sel(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \teclado_filas[1]~input_o\,
	datab => \teclado_filas[2]~input_o\,
	datac => col_sel(0),
	datad => col_sel(1),
	combout => \Mux17~0_combout\);

-- Location: LCCOMB_X11_Y7_N30
\Mux17~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux17~1_combout\ = (col_sel(1) & (((\teclado_filas[2]~input_o\)) # (!\teclado_filas[1]~input_o\))) # (!col_sel(1) & (col_sel(0) & (\teclado_filas[1]~input_o\ $ (!\teclado_filas[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \teclado_filas[1]~input_o\,
	datab => \teclado_filas[2]~input_o\,
	datac => col_sel(1),
	datad => col_sel(0),
	combout => \Mux17~1_combout\);

-- Location: LCCOMB_X11_Y7_N16
\Mux17~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux17~2_combout\ = \Mux17~1_combout\ $ (((\teclado_filas[3]~input_o\ & \Mux17~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \teclado_filas[3]~input_o\,
	datac => \Mux17~1_combout\,
	datad => \Mux17~0_combout\,
	combout => \Mux17~2_combout\);

-- Location: LCCOMB_X10_Y7_N6
\Mux17~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux17~3_combout\ = (\Mux17~0_combout\ & (((\teclado_filas[0]~input_o\ & \Mux17~2_combout\)))) # (!\Mux17~0_combout\ & (\Mux10~0_combout\ & ((!\Mux17~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux10~0_combout\,
	datab => \teclado_filas[0]~input_o\,
	datac => \Mux17~0_combout\,
	datad => \Mux17~2_combout\,
	combout => \Mux17~3_combout\);

-- Location: FF_X10_Y7_N7
\key_prev_raw[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux17~3_combout\,
	ena => \Equal1~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => key_prev_raw(1));

-- Location: LCCOMB_X10_Y7_N2
\Equal1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = (key_prev_raw(0) & (\Mux18~2_combout\ & (key_prev_raw(1) $ (!\Mux17~3_combout\)))) # (!key_prev_raw(0) & (!\Mux18~2_combout\ & (key_prev_raw(1) $ (!\Mux17~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_prev_raw(0),
	datab => key_prev_raw(1),
	datac => \Mux17~3_combout\,
	datad => \Mux18~2_combout\,
	combout => \Equal1~2_combout\);

-- Location: LCCOMB_X10_Y7_N10
\Equal1~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~5_combout\ = (\Equal1~4_combout\) # ((key_prev_raw(2) $ (\Mux16~1_combout\)) # (!\Equal1~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~4_combout\,
	datab => key_prev_raw(2),
	datac => \Mux16~1_combout\,
	datad => \Equal1~2_combout\,
	combout => \Equal1~5_combout\);

-- Location: FF_X10_Y7_N29
\key_prev_raw[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux15~2_combout\,
	ena => \Equal1~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => key_prev_raw(3));

-- Location: LCCOMB_X10_Y7_N30
\Equal1~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~4_combout\ = key_prev_raw(3) $ (((!\Mux15~1_combout\ & ((\Mux10~0_combout\) # (!col_sel(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_prev_raw(3),
	datab => col_sel(1),
	datac => \Mux10~0_combout\,
	datad => \Mux15~1_combout\,
	combout => \Equal1~4_combout\);

-- Location: LCCOMB_X9_Y8_N12
\debounce_count[0]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[0]~21_combout\ = debounce_count(0) $ (VCC)
-- \debounce_count[0]~22\ = CARRY(debounce_count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(0),
	datad => VCC,
	combout => \debounce_count[0]~21_combout\,
	cout => \debounce_count[0]~22\);

-- Location: FF_X9_Y8_N13
\debounce_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[0]~21_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(0));

-- Location: LCCOMB_X9_Y8_N14
\debounce_count[1]~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[1]~23_combout\ = (debounce_count(1) & (!\debounce_count[0]~22\)) # (!debounce_count(1) & ((\debounce_count[0]~22\) # (GND)))
-- \debounce_count[1]~24\ = CARRY((!\debounce_count[0]~22\) # (!debounce_count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(1),
	datad => VCC,
	cin => \debounce_count[0]~22\,
	combout => \debounce_count[1]~23_combout\,
	cout => \debounce_count[1]~24\);

-- Location: FF_X9_Y8_N15
\debounce_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[1]~23_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(1));

-- Location: LCCOMB_X9_Y8_N16
\debounce_count[2]~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[2]~25_combout\ = (debounce_count(2) & (\debounce_count[1]~24\ $ (GND))) # (!debounce_count(2) & (!\debounce_count[1]~24\ & VCC))
-- \debounce_count[2]~26\ = CARRY((debounce_count(2) & !\debounce_count[1]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(2),
	datad => VCC,
	cin => \debounce_count[1]~24\,
	combout => \debounce_count[2]~25_combout\,
	cout => \debounce_count[2]~26\);

-- Location: FF_X9_Y8_N17
\debounce_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[2]~25_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(2));

-- Location: LCCOMB_X9_Y8_N18
\debounce_count[3]~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[3]~27_combout\ = (debounce_count(3) & (!\debounce_count[2]~26\)) # (!debounce_count(3) & ((\debounce_count[2]~26\) # (GND)))
-- \debounce_count[3]~28\ = CARRY((!\debounce_count[2]~26\) # (!debounce_count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(3),
	datad => VCC,
	cin => \debounce_count[2]~26\,
	combout => \debounce_count[3]~27_combout\,
	cout => \debounce_count[3]~28\);

-- Location: FF_X9_Y8_N19
\debounce_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[3]~27_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(3));

-- Location: LCCOMB_X9_Y8_N20
\debounce_count[4]~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[4]~29_combout\ = (debounce_count(4) & (\debounce_count[3]~28\ $ (GND))) # (!debounce_count(4) & (!\debounce_count[3]~28\ & VCC))
-- \debounce_count[4]~30\ = CARRY((debounce_count(4) & !\debounce_count[3]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(4),
	datad => VCC,
	cin => \debounce_count[3]~28\,
	combout => \debounce_count[4]~29_combout\,
	cout => \debounce_count[4]~30\);

-- Location: FF_X9_Y8_N21
\debounce_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[4]~29_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(4));

-- Location: LCCOMB_X9_Y8_N22
\debounce_count[5]~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[5]~31_combout\ = (debounce_count(5) & (!\debounce_count[4]~30\)) # (!debounce_count(5) & ((\debounce_count[4]~30\) # (GND)))
-- \debounce_count[5]~32\ = CARRY((!\debounce_count[4]~30\) # (!debounce_count(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(5),
	datad => VCC,
	cin => \debounce_count[4]~30\,
	combout => \debounce_count[5]~31_combout\,
	cout => \debounce_count[5]~32\);

-- Location: FF_X9_Y8_N23
\debounce_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[5]~31_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(5));

-- Location: LCCOMB_X9_Y8_N24
\debounce_count[6]~33\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[6]~33_combout\ = (debounce_count(6) & (\debounce_count[5]~32\ $ (GND))) # (!debounce_count(6) & (!\debounce_count[5]~32\ & VCC))
-- \debounce_count[6]~34\ = CARRY((debounce_count(6) & !\debounce_count[5]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(6),
	datad => VCC,
	cin => \debounce_count[5]~32\,
	combout => \debounce_count[6]~33_combout\,
	cout => \debounce_count[6]~34\);

-- Location: FF_X9_Y8_N25
\debounce_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[6]~33_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(6));

-- Location: LCCOMB_X9_Y8_N26
\debounce_count[7]~35\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[7]~35_combout\ = (debounce_count(7) & (!\debounce_count[6]~34\)) # (!debounce_count(7) & ((\debounce_count[6]~34\) # (GND)))
-- \debounce_count[7]~36\ = CARRY((!\debounce_count[6]~34\) # (!debounce_count(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(7),
	datad => VCC,
	cin => \debounce_count[6]~34\,
	combout => \debounce_count[7]~35_combout\,
	cout => \debounce_count[7]~36\);

-- Location: FF_X9_Y8_N27
\debounce_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[7]~35_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(7));

-- Location: LCCOMB_X9_Y8_N28
\debounce_count[8]~37\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[8]~37_combout\ = (debounce_count(8) & (\debounce_count[7]~36\ $ (GND))) # (!debounce_count(8) & (!\debounce_count[7]~36\ & VCC))
-- \debounce_count[8]~38\ = CARRY((debounce_count(8) & !\debounce_count[7]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(8),
	datad => VCC,
	cin => \debounce_count[7]~36\,
	combout => \debounce_count[8]~37_combout\,
	cout => \debounce_count[8]~38\);

-- Location: LCCOMB_X9_Y7_N26
\debounce_count[8]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[8]~feeder_combout\ = \debounce_count[8]~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \debounce_count[8]~37_combout\,
	combout => \debounce_count[8]~feeder_combout\);

-- Location: FF_X9_Y7_N27
\debounce_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[8]~feeder_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(8));

-- Location: LCCOMB_X9_Y8_N30
\debounce_count[9]~39\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[9]~39_combout\ = (debounce_count(9) & (!\debounce_count[8]~38\)) # (!debounce_count(9) & ((\debounce_count[8]~38\) # (GND)))
-- \debounce_count[9]~40\ = CARRY((!\debounce_count[8]~38\) # (!debounce_count(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(9),
	datad => VCC,
	cin => \debounce_count[8]~38\,
	combout => \debounce_count[9]~39_combout\,
	cout => \debounce_count[9]~40\);

-- Location: FF_X9_Y8_N31
\debounce_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[9]~39_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(9));

-- Location: LCCOMB_X9_Y7_N0
\debounce_count[10]~41\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[10]~41_combout\ = (debounce_count(10) & (\debounce_count[9]~40\ $ (GND))) # (!debounce_count(10) & (!\debounce_count[9]~40\ & VCC))
-- \debounce_count[10]~42\ = CARRY((debounce_count(10) & !\debounce_count[9]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(10),
	datad => VCC,
	cin => \debounce_count[9]~40\,
	combout => \debounce_count[10]~41_combout\,
	cout => \debounce_count[10]~42\);

-- Location: FF_X9_Y7_N1
\debounce_count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[10]~41_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(10));

-- Location: LCCOMB_X9_Y7_N2
\debounce_count[11]~43\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[11]~43_combout\ = (debounce_count(11) & (!\debounce_count[10]~42\)) # (!debounce_count(11) & ((\debounce_count[10]~42\) # (GND)))
-- \debounce_count[11]~44\ = CARRY((!\debounce_count[10]~42\) # (!debounce_count(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(11),
	datad => VCC,
	cin => \debounce_count[10]~42\,
	combout => \debounce_count[11]~43_combout\,
	cout => \debounce_count[11]~44\);

-- Location: FF_X9_Y7_N3
\debounce_count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[11]~43_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(11));

-- Location: LCCOMB_X9_Y7_N4
\debounce_count[12]~45\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[12]~45_combout\ = (debounce_count(12) & (\debounce_count[11]~44\ $ (GND))) # (!debounce_count(12) & (!\debounce_count[11]~44\ & VCC))
-- \debounce_count[12]~46\ = CARRY((debounce_count(12) & !\debounce_count[11]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(12),
	datad => VCC,
	cin => \debounce_count[11]~44\,
	combout => \debounce_count[12]~45_combout\,
	cout => \debounce_count[12]~46\);

-- Location: FF_X9_Y7_N5
\debounce_count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[12]~45_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(12));

-- Location: LCCOMB_X9_Y7_N6
\debounce_count[13]~47\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[13]~47_combout\ = (debounce_count(13) & (!\debounce_count[12]~46\)) # (!debounce_count(13) & ((\debounce_count[12]~46\) # (GND)))
-- \debounce_count[13]~48\ = CARRY((!\debounce_count[12]~46\) # (!debounce_count(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(13),
	datad => VCC,
	cin => \debounce_count[12]~46\,
	combout => \debounce_count[13]~47_combout\,
	cout => \debounce_count[13]~48\);

-- Location: FF_X9_Y7_N7
\debounce_count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[13]~47_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(13));

-- Location: LCCOMB_X9_Y7_N8
\debounce_count[14]~49\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[14]~49_combout\ = (debounce_count(14) & (\debounce_count[13]~48\ $ (GND))) # (!debounce_count(14) & (!\debounce_count[13]~48\ & VCC))
-- \debounce_count[14]~50\ = CARRY((debounce_count(14) & !\debounce_count[13]~48\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(14),
	datad => VCC,
	cin => \debounce_count[13]~48\,
	combout => \debounce_count[14]~49_combout\,
	cout => \debounce_count[14]~50\);

-- Location: FF_X9_Y7_N9
\debounce_count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[14]~49_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(14));

-- Location: LCCOMB_X9_Y7_N10
\debounce_count[15]~51\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[15]~51_combout\ = (debounce_count(15) & (!\debounce_count[14]~50\)) # (!debounce_count(15) & ((\debounce_count[14]~50\) # (GND)))
-- \debounce_count[15]~52\ = CARRY((!\debounce_count[14]~50\) # (!debounce_count(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(15),
	datad => VCC,
	cin => \debounce_count[14]~50\,
	combout => \debounce_count[15]~51_combout\,
	cout => \debounce_count[15]~52\);

-- Location: FF_X9_Y7_N11
\debounce_count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[15]~51_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(15));

-- Location: LCCOMB_X9_Y7_N12
\debounce_count[16]~53\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[16]~53_combout\ = (debounce_count(16) & (\debounce_count[15]~52\ $ (GND))) # (!debounce_count(16) & (!\debounce_count[15]~52\ & VCC))
-- \debounce_count[16]~54\ = CARRY((debounce_count(16) & !\debounce_count[15]~52\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(16),
	datad => VCC,
	cin => \debounce_count[15]~52\,
	combout => \debounce_count[16]~53_combout\,
	cout => \debounce_count[16]~54\);

-- Location: FF_X9_Y7_N13
\debounce_count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[16]~53_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(16));

-- Location: LCCOMB_X9_Y7_N14
\debounce_count[17]~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[17]~55_combout\ = (debounce_count(17) & (!\debounce_count[16]~54\)) # (!debounce_count(17) & ((\debounce_count[16]~54\) # (GND)))
-- \debounce_count[17]~56\ = CARRY((!\debounce_count[16]~54\) # (!debounce_count(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(17),
	datad => VCC,
	cin => \debounce_count[16]~54\,
	combout => \debounce_count[17]~55_combout\,
	cout => \debounce_count[17]~56\);

-- Location: FF_X9_Y7_N15
\debounce_count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[17]~55_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(17));

-- Location: LCCOMB_X9_Y7_N16
\debounce_count[18]~57\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[18]~57_combout\ = (debounce_count(18) & (\debounce_count[17]~56\ $ (GND))) # (!debounce_count(18) & (!\debounce_count[17]~56\ & VCC))
-- \debounce_count[18]~58\ = CARRY((debounce_count(18) & !\debounce_count[17]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(18),
	datad => VCC,
	cin => \debounce_count[17]~56\,
	combout => \debounce_count[18]~57_combout\,
	cout => \debounce_count[18]~58\);

-- Location: FF_X9_Y7_N17
\debounce_count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[18]~57_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(18));

-- Location: LCCOMB_X9_Y7_N28
\key_stable[0]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \key_stable[0]~3_combout\ = (debounce_count(16) & (debounce_count(18) & (debounce_count(17) & debounce_count(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(16),
	datab => debounce_count(18),
	datac => debounce_count(17),
	datad => debounce_count(15),
	combout => \key_stable[0]~3_combout\);

-- Location: LCCOMB_X9_Y7_N18
\debounce_count[19]~59\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[19]~59_combout\ = (debounce_count(19) & (!\debounce_count[18]~58\)) # (!debounce_count(19) & ((\debounce_count[18]~58\) # (GND)))
-- \debounce_count[19]~60\ = CARRY((!\debounce_count[18]~58\) # (!debounce_count(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(19),
	datad => VCC,
	cin => \debounce_count[18]~58\,
	combout => \debounce_count[19]~59_combout\,
	cout => \debounce_count[19]~60\);

-- Location: FF_X9_Y7_N19
\debounce_count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[19]~59_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(19));

-- Location: LCCOMB_X9_Y7_N20
\debounce_count[20]~61\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[20]~61_combout\ = \debounce_count[19]~60\ $ (!debounce_count(20))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => debounce_count(20),
	cin => \debounce_count[19]~60\,
	combout => \debounce_count[20]~61_combout\);

-- Location: FF_X9_Y7_N21
\debounce_count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[20]~61_combout\,
	sclr => \Equal1~5_combout\,
	ena => \ALT_INV_key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(20));

-- Location: LCCOMB_X9_Y7_N24
\key_stable[0]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \key_stable[0]~1_combout\ = (debounce_count(9)) # ((debounce_count(11)) # ((debounce_count(12)) # (debounce_count(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(9),
	datab => debounce_count(11),
	datac => debounce_count(12),
	datad => debounce_count(10),
	combout => \key_stable[0]~1_combout\);

-- Location: LCCOMB_X9_Y8_N0
\key_stable[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \key_stable[0]~0_combout\ = (debounce_count(8) & ((debounce_count(7)) # ((debounce_count(6)) # (debounce_count(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(7),
	datab => debounce_count(6),
	datac => debounce_count(5),
	datad => debounce_count(8),
	combout => \key_stable[0]~0_combout\);

-- Location: LCCOMB_X9_Y7_N30
\key_stable[0]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \key_stable[0]~2_combout\ = (debounce_count(14)) # ((debounce_count(13) & ((\key_stable[0]~1_combout\) # (\key_stable[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(13),
	datab => \key_stable[0]~1_combout\,
	datac => debounce_count(14),
	datad => \key_stable[0]~0_combout\,
	combout => \key_stable[0]~2_combout\);

-- Location: LCCOMB_X9_Y7_N22
\key_stable[0]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \key_stable[0]~4_combout\ = (debounce_count(20)) # ((debounce_count(19)) # ((\key_stable[0]~3_combout\ & \key_stable[0]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key_stable[0]~3_combout\,
	datab => debounce_count(20),
	datac => \key_stable[0]~2_combout\,
	datad => debounce_count(19),
	combout => \key_stable[0]~4_combout\);

-- Location: LCCOMB_X10_Y7_N4
\Equal1~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~3_combout\ = key_prev_raw(2) $ (\Mux16~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_prev_raw(2),
	datad => \Mux16~1_combout\,
	combout => \Equal1~3_combout\);

-- Location: LCCOMB_X10_Y7_N0
\key_stable[0]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \key_stable[0]~5_combout\ = (!\Equal1~4_combout\ & (\key_stable[0]~4_combout\ & (!\Equal1~3_combout\ & \Equal1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~4_combout\,
	datab => \key_stable[0]~4_combout\,
	datac => \Equal1~3_combout\,
	datad => \Equal1~2_combout\,
	combout => \key_stable[0]~5_combout\);

-- Location: FF_X10_Y7_N5
\key_stable[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mux15~2_combout\,
	sload => VCC,
	ena => \key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => key_stable(3));

-- Location: FF_X10_Y7_N3
\key_stable[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mux17~3_combout\,
	sload => VCC,
	ena => \key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => key_stable(1));

-- Location: LCCOMB_X10_Y7_N12
\key_stable[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \key_stable[0]~feeder_combout\ = \Mux18~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux18~2_combout\,
	combout => \key_stable[0]~feeder_combout\);

-- Location: FF_X10_Y7_N13
\key_stable[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \key_stable[0]~feeder_combout\,
	ena => \key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => key_stable(0));

-- Location: LCCOMB_X24_Y22_N24
\Mux58~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux58~0_combout\ = (!key_stable(0) & ((key_stable(3)) # (key_stable(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(3),
	datac => key_stable(1),
	datad => key_stable(0),
	combout => \Mux58~0_combout\);

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

-- Location: FF_X10_Y7_N11
\key_stable[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mux16~1_combout\,
	sload => VCC,
	ena => \key_stable[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => key_stable(2));

-- Location: FF_X24_Y22_N11
\key_prev_stable[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => key_stable(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => key_prev_stable(3));

-- Location: FF_X24_Y22_N9
\key_prev_stable[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => key_stable(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => key_prev_stable(2));

-- Location: LCCOMB_X24_Y22_N10
\Equal2~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal2~1_combout\ = (key_stable(2) & (key_prev_stable(2) & (key_stable(3) $ (!key_prev_stable(3))))) # (!key_stable(2) & (!key_prev_stable(2) & (key_stable(3) $ (!key_prev_stable(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(2),
	datab => key_stable(3),
	datac => key_prev_stable(3),
	datad => key_prev_stable(2),
	combout => \Equal2~1_combout\);

-- Location: LCCOMB_X23_Y22_N16
\Equal3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (!key_stable(2) & (!key_stable(0) & (!key_stable(3) & !key_stable(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(2),
	datab => key_stable(0),
	datac => key_stable(3),
	datad => key_stable(1),
	combout => \Equal3~0_combout\);

-- Location: FF_X24_Y22_N7
\key_prev_stable[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => key_stable(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => key_prev_stable(0));

-- Location: FF_X24_Y22_N29
\key_prev_stable[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => key_stable(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => key_prev_stable(1));

-- Location: LCCOMB_X24_Y22_N28
\Equal2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (key_stable(1) & (key_prev_stable(1) & (key_prev_stable(0) $ (!key_stable(0))))) # (!key_stable(1) & (!key_prev_stable(1) & (key_prev_stable(0) $ (!key_stable(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(1),
	datab => key_prev_stable(0),
	datac => key_prev_stable(1),
	datad => key_stable(0),
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X24_Y22_N20
\process_3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \process_3~0_combout\ = (!\Equal3~0_combout\ & ((!\Equal2~0_combout\) # (!\Equal2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~1_combout\,
	datac => \Equal3~0_combout\,
	datad => \Equal2~0_combout\,
	combout => \process_3~0_combout\);

-- Location: FF_X24_Y22_N21
key_valid_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \process_3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key_valid_int~q\);

-- Location: LCCOMB_X10_Y7_N26
\digito_unidades_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \digito_unidades_int[1]~0_combout\ = (key_stable(0) & !key_stable(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(0),
	datad => key_stable(1),
	combout => \digito_unidades_int[1]~0_combout\);

-- Location: LCCOMB_X10_Y8_N24
\codigo_ingresado_int[1]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \codigo_ingresado_int[1]~6_combout\ = (\key_valid_int~q\ & ((key_stable(3)) # ((!\digito_unidades_int[1]~0_combout\ & key_stable(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(3),
	datab => \key_valid_int~q\,
	datac => \digito_unidades_int[1]~0_combout\,
	datad => key_stable(2),
	combout => \codigo_ingresado_int[1]~6_combout\);

-- Location: FF_X24_Y22_N25
\codigo_ingresado_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux58~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \codigo_ingresado_int[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => codigo_ingresado_int(0));

-- Location: LCCOMB_X24_Y22_N16
\Mux47~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux47~0_combout\ = (codigo_ingresado_int(0) & ((key_stable(3)) # (key_stable(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(3),
	datac => key_stable(1),
	datad => codigo_ingresado_int(0),
	combout => \Mux47~0_combout\);

-- Location: FF_X24_Y22_N17
\digito_decenas_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux47~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \codigo_ingresado_int[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digito_decenas_int(0));

-- Location: LCCOMB_X24_Y22_N6
\digito_unidades_int[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \digito_unidades_int[1]~1_combout\ = (key_stable(3) & (((key_stable(1))))) # (!key_stable(3) & (key_stable(2) & ((key_stable(1)) # (!key_stable(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(2),
	datab => key_stable(1),
	datac => key_stable(0),
	datad => key_stable(3),
	combout => \digito_unidades_int[1]~1_combout\);

-- Location: LCCOMB_X24_Y22_N22
\digito_unidades_int[1]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \digito_unidades_int[1]~2_combout\ = (\key_valid_int~q\ & (!\digito_unidades_int[1]~1_combout\ & ((key_stable(3)) # (digito_unidades_int(1))))) # (!\key_valid_int~q\ & (((digito_unidades_int(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \digito_unidades_int[1]~1_combout\,
	datab => key_stable(3),
	datac => digito_unidades_int(1),
	datad => \key_valid_int~q\,
	combout => \digito_unidades_int[1]~2_combout\);

-- Location: FF_X24_Y22_N23
\digito_unidades_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \digito_unidades_int[1]~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digito_unidades_int(1));

-- Location: LCCOMB_X24_Y22_N14
\Mux46~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux46~0_combout\ = (digito_unidades_int(1) & ((key_stable(1)) # (key_stable(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => digito_unidades_int(1),
	datac => key_stable(1),
	datad => key_stable(3),
	combout => \Mux46~0_combout\);

-- Location: FF_X24_Y22_N15
\digito_decenas_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux46~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \codigo_ingresado_int[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digito_decenas_int(1));

-- Location: LCCOMB_X24_Y22_N4
\Mux49~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux49~0_combout\ = (!key_stable(2) & key_stable(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => key_stable(2),
	datad => key_stable(3),
	combout => \Mux49~0_combout\);

-- Location: FF_X24_Y22_N5
\digito_unidades_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux49~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \codigo_ingresado_int[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digito_unidades_int(2));

-- Location: LCCOMB_X24_Y22_N0
\Mux45~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux45~0_combout\ = (digito_unidades_int(2) & ((key_stable(3)) # (key_stable(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(3),
	datac => key_stable(1),
	datad => digito_unidades_int(2),
	combout => \Mux45~0_combout\);

-- Location: FF_X24_Y22_N1
\digito_decenas_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux45~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \codigo_ingresado_int[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digito_decenas_int(2));

-- Location: LCCOMB_X24_Y22_N18
\Mux48~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux48~0_combout\ = (key_stable(1) & !key_stable(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => key_stable(1),
	datad => key_stable(3),
	combout => \Mux48~0_combout\);

-- Location: FF_X24_Y22_N19
\digito_unidades_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux48~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \codigo_ingresado_int[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digito_unidades_int(3));

-- Location: LCCOMB_X24_Y22_N26
\Mux44~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux44~0_combout\ = (digito_unidades_int(3) & ((key_stable(3)) # (key_stable(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(3),
	datac => key_stable(1),
	datad => digito_unidades_int(3),
	combout => \Mux44~0_combout\);

-- Location: FF_X24_Y22_N27
\digito_decenas_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux44~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \codigo_ingresado_int[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digito_decenas_int(3));

-- Location: LCCOMB_X28_Y22_N14
\codigo_ingresado_int[1]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \codigo_ingresado_int[1]~7_combout\ = (key_stable(1) & (codigo_ingresado_int(0) & VCC)) # (!key_stable(1) & (codigo_ingresado_int(0) $ (VCC)))
-- \codigo_ingresado_int[1]~8\ = CARRY((!key_stable(1) & codigo_ingresado_int(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(1),
	datab => codigo_ingresado_int(0),
	datad => VCC,
	combout => \codigo_ingresado_int[1]~7_combout\,
	cout => \codigo_ingresado_int[1]~8\);

-- Location: LCCOMB_X24_Y22_N8
\codigo_ingresado_int[1]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \codigo_ingresado_int[1]~9_combout\ = (!key_stable(1) & (!key_stable(0) & (key_stable(2) & !key_stable(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(1),
	datab => key_stable(0),
	datac => key_stable(2),
	datad => key_stable(3),
	combout => \codigo_ingresado_int[1]~9_combout\);

-- Location: FF_X28_Y22_N15
\codigo_ingresado_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \codigo_ingresado_int[1]~7_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \codigo_ingresado_int[1]~9_combout\,
	ena => \codigo_ingresado_int[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => codigo_ingresado_int(1));

-- Location: LCCOMB_X28_Y22_N16
\codigo_ingresado_int[2]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \codigo_ingresado_int[2]~10_combout\ = (key_stable(2) & ((digito_unidades_int(1) & (!\codigo_ingresado_int[1]~8\)) # (!digito_unidades_int(1) & ((\codigo_ingresado_int[1]~8\) # (GND))))) # (!key_stable(2) & ((digito_unidades_int(1) & 
-- (\codigo_ingresado_int[1]~8\ & VCC)) # (!digito_unidades_int(1) & (!\codigo_ingresado_int[1]~8\))))
-- \codigo_ingresado_int[2]~11\ = CARRY((key_stable(2) & ((!\codigo_ingresado_int[1]~8\) # (!digito_unidades_int(1)))) # (!key_stable(2) & (!digito_unidades_int(1) & !\codigo_ingresado_int[1]~8\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(2),
	datab => digito_unidades_int(1),
	datad => VCC,
	cin => \codigo_ingresado_int[1]~8\,
	combout => \codigo_ingresado_int[2]~10_combout\,
	cout => \codigo_ingresado_int[2]~11\);

-- Location: FF_X28_Y22_N17
\codigo_ingresado_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \codigo_ingresado_int[2]~10_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \codigo_ingresado_int[1]~9_combout\,
	ena => \codigo_ingresado_int[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => codigo_ingresado_int(2));

-- Location: LCCOMB_X28_Y24_N20
\Add4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~0_combout\ = codigo_ingresado_int(0) $ (digito_unidades_int(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => codigo_ingresado_int(0),
	datad => digito_unidades_int(2),
	combout => \Add4~0_combout\);

-- Location: LCCOMB_X28_Y22_N18
\codigo_ingresado_int[3]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \codigo_ingresado_int[3]~12_combout\ = ((\Add4~0_combout\ $ (key_stable(3) $ (\codigo_ingresado_int[2]~11\)))) # (GND)
-- \codigo_ingresado_int[3]~13\ = CARRY((\Add4~0_combout\ & ((!\codigo_ingresado_int[2]~11\) # (!key_stable(3)))) # (!\Add4~0_combout\ & (!key_stable(3) & !\codigo_ingresado_int[2]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~0_combout\,
	datab => key_stable(3),
	datad => VCC,
	cin => \codigo_ingresado_int[2]~11\,
	combout => \codigo_ingresado_int[3]~12_combout\,
	cout => \codigo_ingresado_int[3]~13\);

-- Location: FF_X28_Y22_N19
\codigo_ingresado_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \codigo_ingresado_int[3]~12_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \codigo_ingresado_int[1]~9_combout\,
	ena => \codigo_ingresado_int[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => codigo_ingresado_int(3));

-- Location: LCCOMB_X24_Y22_N30
\Add4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~1_combout\ = digito_unidades_int(3) $ (digito_unidades_int(1) $ (((digito_unidades_int(2) & codigo_ingresado_int(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => digito_unidades_int(2),
	datab => digito_unidades_int(3),
	datac => digito_unidades_int(1),
	datad => codigo_ingresado_int(0),
	combout => \Add4~1_combout\);

-- Location: LCCOMB_X28_Y22_N20
\codigo_ingresado_int[4]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \codigo_ingresado_int[4]~14_combout\ = (\Add4~1_combout\ & (!\codigo_ingresado_int[3]~13\)) # (!\Add4~1_combout\ & ((\codigo_ingresado_int[3]~13\) # (GND)))
-- \codigo_ingresado_int[4]~15\ = CARRY((!\codigo_ingresado_int[3]~13\) # (!\Add4~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add4~1_combout\,
	datad => VCC,
	cin => \codigo_ingresado_int[3]~13\,
	combout => \codigo_ingresado_int[4]~14_combout\,
	cout => \codigo_ingresado_int[4]~15\);

-- Location: FF_X28_Y22_N21
\codigo_ingresado_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \codigo_ingresado_int[4]~14_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \codigo_ingresado_int[1]~9_combout\,
	ena => \codigo_ingresado_int[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => codigo_ingresado_int(4));

-- Location: LCCOMB_X24_Y22_N12
\Add4~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~2_combout\ = (digito_unidades_int(3) & ((digito_unidades_int(1)) # ((digito_unidades_int(2) & codigo_ingresado_int(0))))) # (!digito_unidades_int(3) & (digito_unidades_int(2) & (digito_unidades_int(1) & codigo_ingresado_int(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => digito_unidades_int(2),
	datab => digito_unidades_int(3),
	datac => digito_unidades_int(1),
	datad => codigo_ingresado_int(0),
	combout => \Add4~2_combout\);

-- Location: LCCOMB_X28_Y22_N22
\codigo_ingresado_int[5]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \codigo_ingresado_int[5]~16_combout\ = (\codigo_ingresado_int[4]~15\ & ((digito_unidades_int(2) $ (\Add4~2_combout\)))) # (!\codigo_ingresado_int[4]~15\ & (digito_unidades_int(2) $ (\Add4~2_combout\ $ (VCC))))
-- \codigo_ingresado_int[5]~17\ = CARRY((!\codigo_ingresado_int[4]~15\ & (digito_unidades_int(2) $ (\Add4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => digito_unidades_int(2),
	datab => \Add4~2_combout\,
	datad => VCC,
	cin => \codigo_ingresado_int[4]~15\,
	combout => \codigo_ingresado_int[5]~16_combout\,
	cout => \codigo_ingresado_int[5]~17\);

-- Location: FF_X28_Y22_N23
\codigo_ingresado_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \codigo_ingresado_int[5]~16_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \codigo_ingresado_int[1]~9_combout\,
	ena => \codigo_ingresado_int[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => codigo_ingresado_int(5));

-- Location: LCCOMB_X24_Y22_N2
\Add4~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~3_combout\ = (digito_unidades_int(2) & ((digito_unidades_int(3) & ((digito_unidades_int(1)) # (codigo_ingresado_int(0)))) # (!digito_unidades_int(3) & (digito_unidades_int(1) & codigo_ingresado_int(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => digito_unidades_int(2),
	datab => digito_unidades_int(3),
	datac => digito_unidades_int(1),
	datad => codigo_ingresado_int(0),
	combout => \Add4~3_combout\);

-- Location: LCCOMB_X28_Y22_N24
\codigo_ingresado_int[6]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \codigo_ingresado_int[6]~18_combout\ = \Add4~3_combout\ $ (\codigo_ingresado_int[5]~17\ $ (digito_unidades_int(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add4~3_combout\,
	datad => digito_unidades_int(3),
	cin => \codigo_ingresado_int[5]~17\,
	combout => \codigo_ingresado_int[6]~18_combout\);

-- Location: FF_X28_Y22_N25
\codigo_ingresado_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \codigo_ingresado_int[6]~18_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \codigo_ingresado_int[1]~9_combout\,
	ena => \codigo_ingresado_int[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => codigo_ingresado_int(6));

-- Location: LCCOMB_X28_Y22_N4
\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = codigo_ingresado_int(4) $ (VCC)
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(codigo_ingresado_int(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => codigo_ingresado_int(4),
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X28_Y22_N6
\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (codigo_ingresado_int(5) & (\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!codigo_ingresado_int(5) & 
-- (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!codigo_ingresado_int(5) & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(5),
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X28_Y22_N8
\Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (codigo_ingresado_int(6) & (\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!codigo_ingresado_int(6) & 
-- (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((codigo_ingresado_int(6) & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => codigo_ingresado_int(6),
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X28_Y22_N10
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

-- Location: LCCOMB_X28_Y22_N12
\Div0|auto_generated|divider|divider|StageOut[18]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\ = (codigo_ingresado_int(6) & \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => codigo_ingresado_int(6),
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~26_combout\);

-- Location: LCCOMB_X28_Y22_N2
\Div0|auto_generated|divider|divider|StageOut[18]~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~27_combout\ = (\Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~27_combout\);

-- Location: LCCOMB_X28_Y22_N26
\Div0|auto_generated|divider|divider|StageOut[17]~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[17]~29_combout\ = (\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[17]~29_combout\);

-- Location: LCCOMB_X28_Y22_N28
\Div0|auto_generated|divider|divider|StageOut[17]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[17]~28_combout\ = (codigo_ingresado_int(5) & \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => codigo_ingresado_int(5),
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[17]~28_combout\);

-- Location: LCCOMB_X28_Y22_N0
\Div0|auto_generated|divider|divider|StageOut[16]~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~30_combout\ = (codigo_ingresado_int(4) & \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => codigo_ingresado_int(4),
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[16]~30_combout\);

-- Location: LCCOMB_X28_Y22_N30
\Div0|auto_generated|divider|divider|StageOut[16]~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~31_combout\ = (\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[16]~31_combout\);

-- Location: LCCOMB_X29_Y22_N22
\Div0|auto_generated|divider|divider|StageOut[15]~33\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[15]~33_combout\ = (codigo_ingresado_int(3) & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => codigo_ingresado_int(3),
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[15]~33_combout\);

-- Location: LCCOMB_X29_Y22_N24
\Div0|auto_generated|divider|divider|StageOut[15]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[15]~32_combout\ = (codigo_ingresado_int(3) & \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => codigo_ingresado_int(3),
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[15]~32_combout\);

-- Location: LCCOMB_X29_Y22_N10
\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\Div0|auto_generated|divider|divider|StageOut[15]~33_combout\) # (\Div0|auto_generated|divider|divider|StageOut[15]~32_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[15]~33_combout\) # (\Div0|auto_generated|divider|divider|StageOut[15]~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[15]~33_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[15]~32_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X29_Y22_N12
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

-- Location: LCCOMB_X29_Y22_N14
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

-- Location: LCCOMB_X29_Y22_N16
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

-- Location: LCCOMB_X29_Y22_N18
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

-- Location: LCCOMB_X29_Y22_N0
\Div0|auto_generated|divider|divider|StageOut[23]~47\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[23]~47_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (codigo_ingresado_int(5))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => codigo_ingresado_int(5),
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[23]~47_combout\);

-- Location: LCCOMB_X29_Y22_N20
\Div0|auto_generated|divider|divider|StageOut[23]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[23]~34_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[23]~34_combout\);

-- Location: LCCOMB_X29_Y22_N2
\Div0|auto_generated|divider|divider|StageOut[22]~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[22]~48_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (codigo_ingresado_int(4))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => codigo_ingresado_int(4),
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[22]~48_combout\);

-- Location: LCCOMB_X29_Y22_N6
\Div0|auto_generated|divider|divider|StageOut[22]~35\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[22]~35_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[22]~35_combout\);

-- Location: LCCOMB_X29_Y22_N8
\Div0|auto_generated|divider|divider|StageOut[21]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[21]~36_combout\ = (codigo_ingresado_int(3) & \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => codigo_ingresado_int(3),
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[21]~36_combout\);

-- Location: LCCOMB_X29_Y22_N4
\Div0|auto_generated|divider|divider|StageOut[21]~37\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[21]~37_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[21]~37_combout\);

-- Location: LCCOMB_X29_Y22_N26
\Div0|auto_generated|divider|divider|StageOut[20]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[20]~38_combout\ = (codigo_ingresado_int(2) & \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => codigo_ingresado_int(2),
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[20]~38_combout\);

-- Location: LCCOMB_X29_Y22_N28
\Div0|auto_generated|divider|divider|StageOut[20]~39\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[20]~39_combout\ = (codigo_ingresado_int(2) & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => codigo_ingresado_int(2),
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[20]~39_combout\);

-- Location: LCCOMB_X30_Y22_N0
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

-- Location: LCCOMB_X30_Y22_N2
\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\Div0|auto_generated|divider|divider|StageOut[21]~36_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[21]~37_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\Div0|auto_generated|divider|divider|StageOut[21]~36_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[21]~37_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[21]~36_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[21]~37_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[21]~36_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[21]~37_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X30_Y22_N4
\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\Div0|auto_generated|divider|divider|StageOut[22]~48_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[22]~35_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\Div0|auto_generated|divider|divider|StageOut[22]~48_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[22]~35_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\Div0|auto_generated|divider|divider|StageOut[22]~48_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[22]~35_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[22]~48_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[22]~35_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X30_Y22_N6
\Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[23]~47_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[23]~34_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[23]~47_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[23]~34_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X30_Y22_N8
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

-- Location: LCCOMB_X30_Y22_N30
\Div0|auto_generated|divider|divider|StageOut[28]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[28]~40_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[28]~40_combout\);

-- Location: LCCOMB_X29_Y22_N30
\Div0|auto_generated|divider|divider|StageOut[28]~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[28]~46_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[22]~48_combout\) # 
-- ((!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[22]~48_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[28]~46_combout\);

-- Location: LCCOMB_X30_Y22_N12
\Div0|auto_generated|divider|divider|StageOut[27]~41\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[27]~41_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[27]~41_combout\);

-- Location: LCCOMB_X30_Y22_N14
\Div0|auto_generated|divider|divider|StageOut[27]~49\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[27]~49_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (codigo_ingresado_int(3))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(3),
	datab => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[27]~49_combout\);

-- Location: LCCOMB_X30_Y22_N26
\Div0|auto_generated|divider|divider|StageOut[26]~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[26]~42_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & codigo_ingresado_int(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => codigo_ingresado_int(2),
	combout => \Div0|auto_generated|divider|divider|StageOut[26]~42_combout\);

-- Location: LCCOMB_X31_Y22_N12
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

-- Location: LCCOMB_X30_Y22_N10
\Div0|auto_generated|divider|divider|StageOut[25]~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[25]~44_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & codigo_ingresado_int(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => codigo_ingresado_int(1),
	combout => \Div0|auto_generated|divider|divider|StageOut[25]~44_combout\);

-- Location: LCCOMB_X30_Y22_N28
\Div0|auto_generated|divider|divider|StageOut[25]~45\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[25]~45_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & codigo_ingresado_int(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => codigo_ingresado_int(1),
	combout => \Div0|auto_generated|divider|divider|StageOut[25]~45_combout\);

-- Location: LCCOMB_X30_Y22_N16
\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1_cout\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[25]~44_combout\) # (\Div0|auto_generated|divider|divider|StageOut[25]~45_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[25]~44_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[25]~45_combout\,
	datad => VCC,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1_cout\);

-- Location: LCCOMB_X30_Y22_N18
\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[26]~42_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[26]~43_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[26]~42_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[26]~43_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3_cout\);

-- Location: LCCOMB_X30_Y22_N20
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

-- Location: LCCOMB_X30_Y22_N22
\Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[28]~40_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[28]~46_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[28]~40_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[28]~46_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\);

-- Location: LCCOMB_X30_Y22_N24
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

-- Location: LCCOMB_X27_Y22_N6
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = codigo_ingresado_int(4) $ (VCC)
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(codigo_ingresado_int(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(4),
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X27_Y22_N8
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (codigo_ingresado_int(5) & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!codigo_ingresado_int(5) & 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!codigo_ingresado_int(5) & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => codigo_ingresado_int(5),
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X27_Y22_N10
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (codigo_ingresado_int(6) & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!codigo_ingresado_int(6) & 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((codigo_ingresado_int(6) & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => codigo_ingresado_int(6),
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X27_Y22_N12
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

-- Location: LCCOMB_X27_Y22_N30
\Mod0|auto_generated|divider|divider|StageOut[24]~39\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[24]~39_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[24]~39_combout\);

-- Location: LCCOMB_X27_Y22_N0
\Mod0|auto_generated|divider|divider|StageOut[24]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[24]~38_combout\ = (codigo_ingresado_int(6) & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => codigo_ingresado_int(6),
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[24]~38_combout\);

-- Location: LCCOMB_X27_Y22_N24
\Mod0|auto_generated|divider|divider|StageOut[23]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[23]~40_combout\ = (codigo_ingresado_int(5) & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => codigo_ingresado_int(5),
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[23]~40_combout\);

-- Location: LCCOMB_X27_Y22_N4
\Mod0|auto_generated|divider|divider|StageOut[23]~41\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[23]~41_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[23]~41_combout\);

-- Location: LCCOMB_X27_Y22_N26
\Mod0|auto_generated|divider|divider|StageOut[22]~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[22]~42_combout\ = (codigo_ingresado_int(4) & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => codigo_ingresado_int(4),
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[22]~42_combout\);

-- Location: LCCOMB_X27_Y22_N28
\Mod0|auto_generated|divider|divider|StageOut[22]~43\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[22]~43_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[22]~43_combout\);

-- Location: LCCOMB_X26_Y22_N16
\Mod0|auto_generated|divider|divider|StageOut[21]~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[21]~44_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & codigo_ingresado_int(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => codigo_ingresado_int(3),
	combout => \Mod0|auto_generated|divider|divider|StageOut[21]~44_combout\);

-- Location: LCCOMB_X26_Y22_N6
\Mod0|auto_generated|divider|divider|StageOut[21]~45\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[21]~45_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & codigo_ingresado_int(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => codigo_ingresado_int(3),
	combout => \Mod0|auto_generated|divider|divider|StageOut[21]~45_combout\);

-- Location: LCCOMB_X27_Y22_N14
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[21]~44_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[21]~45_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[21]~44_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[21]~45_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[21]~44_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[21]~45_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X27_Y22_N16
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[22]~42_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[22]~43_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[22]~42_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[22]~43_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[22]~42_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[22]~43_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[22]~42_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[22]~43_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X27_Y22_N18
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[23]~40_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[23]~41_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[23]~40_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[23]~41_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[23]~40_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[23]~41_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[23]~40_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[23]~41_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X27_Y22_N20
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\Mod0|auto_generated|divider|divider|StageOut[24]~39_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[24]~38_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\Mod0|auto_generated|divider|divider|StageOut[24]~39_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[24]~38_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[24]~39_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[24]~38_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[24]~39_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[24]~38_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X27_Y22_N22
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

-- Location: LCCOMB_X27_Y22_N2
\Mod0|auto_generated|divider|divider|StageOut[32]~65\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[32]~65_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (codigo_ingresado_int(6))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => codigo_ingresado_int(6),
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[32]~65_combout\);

-- Location: LCCOMB_X26_Y26_N24
\Mod0|auto_generated|divider|divider|StageOut[32]~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[32]~46_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[32]~46_combout\);

-- Location: LCCOMB_X26_Y26_N30
\Mod0|auto_generated|divider|divider|StageOut[31]~47\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[31]~47_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[31]~47_combout\);

-- Location: LCCOMB_X26_Y26_N8
\Mod0|auto_generated|divider|divider|StageOut[31]~66\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[31]~66_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (codigo_ingresado_int(5))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(5),
	datab => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[31]~66_combout\);

-- Location: LCCOMB_X26_Y26_N10
\Mod0|auto_generated|divider|divider|StageOut[30]~67\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[30]~67_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((codigo_ingresado_int(4)))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datab => codigo_ingresado_int(4),
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[30]~67_combout\);

-- Location: LCCOMB_X26_Y26_N28
\Mod0|auto_generated|divider|divider|StageOut[30]~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[30]~48_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[30]~48_combout\);

-- Location: LCCOMB_X26_Y26_N26
\Mod0|auto_generated|divider|divider|StageOut[29]~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[29]~50_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[29]~50_combout\);

-- Location: LCCOMB_X26_Y22_N0
\Mod0|auto_generated|divider|divider|StageOut[29]~49\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[29]~49_combout\ = (codigo_ingresado_int(3) & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(3),
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[29]~49_combout\);

-- Location: LCCOMB_X26_Y22_N30
\Mod0|auto_generated|divider|divider|StageOut[28]~51\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[28]~51_combout\ = (codigo_ingresado_int(2) & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => codigo_ingresado_int(2),
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[28]~51_combout\);

-- Location: LCCOMB_X26_Y22_N24
\Mod0|auto_generated|divider|divider|StageOut[28]~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[28]~52_combout\ = (codigo_ingresado_int(2) & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => codigo_ingresado_int(2),
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[28]~52_combout\);

-- Location: LCCOMB_X26_Y26_N12
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[28]~51_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[28]~52_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[28]~51_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[28]~52_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[28]~51_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[28]~52_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X26_Y26_N14
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[29]~50_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[29]~49_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[29]~50_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[29]~49_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[29]~50_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[29]~49_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[29]~50_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[29]~49_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X26_Y26_N16
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[30]~67_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[30]~48_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[30]~67_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[30]~48_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[30]~67_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[30]~48_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[30]~67_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[30]~48_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X26_Y26_N18
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ & (((\Mod0|auto_generated|divider|divider|StageOut[31]~47_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[31]~66_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ & (!\Mod0|auto_generated|divider|divider|StageOut[31]~47_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[31]~66_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[31]~47_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[31]~66_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[31]~47_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[31]~66_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\);

-- Location: LCCOMB_X26_Y26_N20
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ & ((((\Mod0|auto_generated|divider|divider|StageOut[32]~65_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[32]~46_combout\))))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ & ((\Mod0|auto_generated|divider|divider|StageOut[32]~65_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|StageOut[32]~46_combout\) # (GND))))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[32]~65_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[32]~46_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[32]~65_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[32]~46_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\);

-- Location: LCCOMB_X26_Y26_N22
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

-- Location: LCCOMB_X27_Y26_N12
\Mod0|auto_generated|divider|divider|StageOut[35]~53\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[35]~53_combout\ = (codigo_ingresado_int(1) & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => codigo_ingresado_int(1),
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[35]~53_combout\);

-- Location: LCCOMB_X27_Y26_N14
\Mod0|auto_generated|divider|divider|StageOut[35]~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\ = (codigo_ingresado_int(1) & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => codigo_ingresado_int(1),
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\);

-- Location: LCCOMB_X27_Y26_N16
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[35]~53_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[35]~53_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[35]~53_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\);

-- Location: LCCOMB_X27_Y26_N6
\Mod0|auto_generated|divider|divider|StageOut[40]~62\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[40]~62_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[32]~65_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[32]~65_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[40]~62_combout\);

-- Location: LCCOMB_X26_Y26_N4
\Mod0|auto_generated|divider|divider|StageOut[40]~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[40]~55_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[40]~55_combout\);

-- Location: LCCOMB_X26_Y26_N2
\Mod0|auto_generated|divider|divider|StageOut[39]~56\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[39]~56_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[39]~56_combout\);

-- Location: LCCOMB_X27_Y26_N0
\Mod0|auto_generated|divider|divider|StageOut[39]~63\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[39]~63_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[31]~66_combout\) # 
-- ((!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[31]~66_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[39]~63_combout\);

-- Location: LCCOMB_X26_Y26_N0
\Mod0|auto_generated|divider|divider|StageOut[38]~57\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[38]~57_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[38]~57_combout\);

-- Location: LCCOMB_X27_Y26_N2
\Mod0|auto_generated|divider|divider|StageOut[38]~64\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[38]~64_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[30]~67_combout\) # 
-- ((!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[30]~67_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[38]~64_combout\);

-- Location: LCCOMB_X27_Y26_N30
\Mod0|auto_generated|divider|divider|StageOut[37]~68\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[37]~68_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((codigo_ingresado_int(3)))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datab => codigo_ingresado_int(3),
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[37]~68_combout\);

-- Location: LCCOMB_X27_Y26_N4
\Mod0|auto_generated|divider|divider|StageOut[37]~58\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[37]~58_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[37]~58_combout\);

-- Location: LCCOMB_X27_Y26_N10
\Mod0|auto_generated|divider|divider|StageOut[36]~59\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[36]~59_combout\ = (codigo_ingresado_int(2) & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => codigo_ingresado_int(2),
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[36]~59_combout\);

-- Location: LCCOMB_X26_Y26_N6
\Mod0|auto_generated|divider|divider|StageOut[36]~60\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[36]~60_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[36]~60_combout\);

-- Location: LCCOMB_X27_Y26_N18
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3_cout\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[36]~59_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[36]~60_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[36]~59_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[36]~60_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3_cout\);

-- Location: LCCOMB_X27_Y26_N20
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5_cout\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3_cout\ & ((\Mod0|auto_generated|divider|divider|StageOut[37]~68_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[37]~58_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[37]~68_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[37]~58_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3_cout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5_cout\);

-- Location: LCCOMB_X27_Y26_N22
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[38]~57_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[38]~64_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[38]~57_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[38]~64_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5_cout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\);

-- Location: LCCOMB_X27_Y26_N24
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~9_cout\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[39]~56_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[39]~63_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[39]~56_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[39]~63_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~9_cout\);

-- Location: LCCOMB_X27_Y26_N26
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~11_cout\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[40]~62_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[40]~55_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[40]~62_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[40]~55_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~9_cout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~11_cout\);

-- Location: LCCOMB_X27_Y26_N28
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ = \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~11_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~11_cout\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\);

-- Location: LCCOMB_X28_Y25_N12
\Mux60~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux60~0_combout\ = (codigo_ingresado_int(0)) # ((\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((codigo_ingresado_int(1)))) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(0),
	datab => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datad => codigo_ingresado_int(1),
	combout => \Mux60~0_combout\);

-- Location: LCCOMB_X29_Y25_N4
\precio_actual~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~12_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ $ (((\Mux60~0_combout\))))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (codigo_ingresado_int(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => codigo_ingresado_int(0),
	datad => \Mux60~0_combout\,
	combout => \precio_actual~12_combout\);

-- Location: LCCOMB_X29_Y25_N30
\precio_actual~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~25_combout\ = ((\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (codigo_ingresado_int(0))) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Mux60~0_combout\)))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => codigo_ingresado_int(0),
	datad => \Mux60~0_combout\,
	combout => \precio_actual~25_combout\);

-- Location: LCCOMB_X28_Y24_N18
\precio_actual~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~9_combout\ = (!codigo_ingresado_int(2)) # (!codigo_ingresado_int(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => codigo_ingresado_int(1),
	datad => codigo_ingresado_int(2),
	combout => \precio_actual~9_combout\);

-- Location: LCCOMB_X28_Y24_N28
\precio_actual~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~10_combout\ = (((\precio_actual~9_combout\) # (!codigo_ingresado_int(4))) # (!codigo_ingresado_int(3))) # (!codigo_ingresado_int(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(5),
	datab => codigo_ingresado_int(3),
	datac => codigo_ingresado_int(4),
	datad => \precio_actual~9_combout\,
	combout => \precio_actual~10_combout\);

-- Location: LCCOMB_X28_Y25_N4
\precio_actual~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~8_combout\ = (!codigo_ingresado_int(6) & ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\) # ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\) # 
-- (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(6),
	datab => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \precio_actual~8_combout\);

-- Location: LCCOMB_X27_Y26_N8
\Mod0|auto_generated|divider|divider|StageOut[43]~61\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((codigo_ingresado_int(1)))) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datac => codigo_ingresado_int(1),
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\);

-- Location: LCCOMB_X28_Y25_N14
\precio_actual~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~11_combout\ = (\precio_actual~8_combout\ & (((\precio_actual~10_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\)) # (!codigo_ingresado_int(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(0),
	datab => \precio_actual~10_combout\,
	datac => \precio_actual~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\,
	combout => \precio_actual~11_combout\);

-- Location: LCCOMB_X29_Y25_N12
\precio_actual~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~13_combout\ = (\precio_actual~11_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (\precio_actual~12_combout\)) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & 
-- ((!\precio_actual~25_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \precio_actual~12_combout\,
	datac => \precio_actual~25_combout\,
	datad => \precio_actual~11_combout\,
	combout => \precio_actual~13_combout\);

-- Location: FF_X29_Y25_N13
\precio_actual[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \precio_actual~13_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \precio_actual[0]~reg0_q\);

-- Location: LCCOMB_X28_Y24_N26
\precio_actual~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~15_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \precio_actual~15_combout\);

-- Location: LCCOMB_X28_Y25_N28
\precio_actual~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~14_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ 
-- (!\Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\,
	combout => \precio_actual~14_combout\);

-- Location: LCCOMB_X28_Y25_N6
\Mux67~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux67~0_combout\ = (\Mux60~0_combout\) # (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mux60~0_combout\,
	combout => \Mux67~0_combout\);

-- Location: LCCOMB_X28_Y25_N20
\precio_actual~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~16_combout\ = (\precio_actual~11_combout\ & ((\precio_actual~14_combout\) # ((\precio_actual~15_combout\ & \Mux67~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \precio_actual~15_combout\,
	datab => \precio_actual~14_combout\,
	datac => \precio_actual~11_combout\,
	datad => \Mux67~0_combout\,
	combout => \precio_actual~16_combout\);

-- Location: FF_X28_Y25_N21
\precio_actual[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \precio_actual~16_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \precio_actual[1]~reg0_q\);

-- Location: LCCOMB_X29_Y25_N0
\Mux65~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux65~0_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ (((\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- \Mux60~0_combout\))))) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mux60~0_combout\,
	combout => \Mux65~0_combout\);

-- Location: LCCOMB_X29_Y25_N14
\Mux65~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux65~1_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mux65~0_combout\) # ((!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & !codigo_ingresado_int(0))))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (codigo_ingresado_int(0) & \Mux65~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => codigo_ingresado_int(0),
	datad => \Mux65~0_combout\,
	combout => \Mux65~1_combout\);

-- Location: LCCOMB_X29_Y25_N2
\precio_actual~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~17_combout\ = (\Mux65~1_combout\ & \precio_actual~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux65~1_combout\,
	datad => \precio_actual~11_combout\,
	combout => \precio_actual~17_combout\);

-- Location: FF_X29_Y25_N3
\precio_actual[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \precio_actual~17_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \precio_actual[2]~reg0_q\);

-- Location: LCCOMB_X28_Y25_N30
\Mux67~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux67~1_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & (!codigo_ingresado_int(1))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(1),
	datab => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mux67~1_combout\);

-- Location: LCCOMB_X28_Y25_N24
\precio_actual~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~18_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ 
-- & ((\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((!\Mux67~0_combout\))) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (\Mux67~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \Mux67~1_combout\,
	datad => \Mux67~0_combout\,
	combout => \precio_actual~18_combout\);

-- Location: LCCOMB_X28_Y25_N22
\precio_actual~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~19_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Mux60~0_combout\))) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (codigo_ingresado_int(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(0),
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mux60~0_combout\,
	combout => \precio_actual~19_combout\);

-- Location: LCCOMB_X28_Y25_N0
\precio_actual~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~20_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\precio_actual~19_combout\ & ((!\precio_actual~18_combout\))) # (!\precio_actual~19_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\) # (\precio_actual~18_combout\))))) # (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\ & 
-- ((\precio_actual~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\,
	datac => \precio_actual~19_combout\,
	datad => \precio_actual~18_combout\,
	combout => \precio_actual~20_combout\);

-- Location: LCCOMB_X28_Y25_N26
\precio_actual~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~21_combout\ = (\precio_actual~11_combout\ & (\precio_actual~18_combout\ $ (((\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & \precio_actual~20_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \precio_actual~18_combout\,
	datac => \precio_actual~11_combout\,
	datad => \precio_actual~20_combout\,
	combout => \precio_actual~21_combout\);

-- Location: FF_X28_Y25_N27
\precio_actual[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \precio_actual~21_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \precio_actual[3]~reg0_q\);

-- Location: LCCOMB_X28_Y25_N18
\precio_actual~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~22_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ 
-- & (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\) # (\Mux60~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mux60~0_combout\,
	combout => \precio_actual~22_combout\);

-- Location: LCCOMB_X28_Y25_N8
\precio_actual~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~23_combout\ = (\precio_actual~11_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (\Mux67~1_combout\ & !\precio_actual~22_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\precio_actual~22_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux67~1_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \precio_actual~11_combout\,
	datad => \precio_actual~22_combout\,
	combout => \precio_actual~23_combout\);

-- Location: FF_X28_Y25_N9
\precio_actual[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \precio_actual~23_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \precio_actual[4]~reg0_q\);

-- Location: LCCOMB_X28_Y25_N2
\precio_actual~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \precio_actual~24_combout\ = (\precio_actual~15_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\precio_actual~11_combout\ & \Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \precio_actual~15_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \precio_actual~11_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\,
	combout => \precio_actual~24_combout\);

-- Location: FF_X28_Y25_N3
\precio_actual[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \precio_actual~24_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \precio_actual[5]~reg0_q\);

-- Location: LCCOMB_X28_Y25_N16
\Mux91~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~22_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\) # (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\,
	combout => \Mux91~22_combout\);

-- Location: IOIBUF_X32_Y29_N22
\fila_compra[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fila_compra(2),
	o => \fila_compra[2]~input_o\);

-- Location: IOIBUF_X30_Y29_N1
\fila_compra[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fila_compra(0),
	o => \fila_compra[0]~input_o\);

-- Location: IOIBUF_X32_Y29_N8
\columna_compra[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_columna_compra(1),
	o => \columna_compra[1]~input_o\);

-- Location: IOIBUF_X30_Y29_N15
\fila_compra[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fila_compra(1),
	o => \fila_compra[1]~input_o\);

-- Location: LCCOMB_X31_Y25_N14
\Mux40~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~8_combout\ = (\fila_compra[2]~input_o\) # ((\fila_compra[0]~input_o\) # ((\columna_compra[1]~input_o\) # (\fila_compra[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[2]~input_o\,
	datab => \fila_compra[0]~input_o\,
	datac => \columna_compra[1]~input_o\,
	datad => \fila_compra[1]~input_o\,
	combout => \Mux40~8_combout\);

-- Location: IOIBUF_X32_Y29_N29
\columna_compra[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_columna_compra(0),
	o => \columna_compra[0]~input_o\);

-- Location: LCCOMB_X29_Y27_N30
\almacen[0][1][0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[0][1][0]~0_combout\ = !\Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux42~13_combout\,
	combout => \almacen[0][1][0]~0_combout\);

-- Location: LCCOMB_X30_Y27_N18
\almacen[0][1][0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[0][1][0]~feeder_combout\ = \almacen[0][1][0]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \almacen[0][1][0]~0_combout\,
	combout => \almacen[0][1][0]~feeder_combout\);

-- Location: LCCOMB_X31_Y27_N14
\almacen[4][0][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][0][2]~0_combout\ = (!\fila_compra[0]~input_o\ & !\fila_compra[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fila_compra[0]~input_o\,
	datac => \fila_compra[1]~input_o\,
	combout => \almacen[4][0][2]~0_combout\);

-- Location: LCCOMB_X32_Y25_N0
\almacen[6][2][1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[6][2][1]~0_combout\ = !\Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add3~2_combout\,
	combout => \almacen[6][2][1]~0_combout\);

-- Location: LCCOMB_X33_Y26_N20
\almacen[4][2][2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][2][2]~2_combout\ = (\columna_compra[1]~input_o\ & !\columna_compra[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[1]~input_o\,
	datad => \columna_compra[0]~input_o\,
	combout => \almacen[4][2][2]~2_combout\);

-- Location: IOIBUF_X32_Y29_N15
\actualizar_stock~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_actualizar_stock,
	o => \actualizar_stock~input_o\);

-- Location: LCCOMB_X31_Y27_N22
\almacen[4][0][2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][0][2]~feeder_combout\ = \Add3~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add3~3_combout\,
	combout => \almacen[4][0][2]~feeder_combout\);

-- Location: LCCOMB_X31_Y27_N10
\almacen[4][0][2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][0][2]~2_combout\ = (\fila_compra[2]~input_o\ & (!\columna_compra[0]~input_o\ & (\almacen[4][0][2]~0_combout\ & \almacen[4][0][2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[2]~input_o\,
	datab => \columna_compra[0]~input_o\,
	datac => \almacen[4][0][2]~0_combout\,
	datad => \almacen[4][0][2]~1_combout\,
	combout => \almacen[4][0][2]~2_combout\);

-- Location: FF_X31_Y27_N23
\almacen[4][0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[4][0][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[4][0][2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[4][0][2]~q\);

-- Location: LCCOMB_X31_Y25_N24
\Mux40~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~0_combout\ = ((\fila_compra[0]~input_o\) # ((\columna_compra[1]~input_o\) # (\fila_compra[1]~input_o\))) # (!\fila_compra[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[2]~input_o\,
	datab => \fila_compra[0]~input_o\,
	datac => \columna_compra[1]~input_o\,
	datad => \fila_compra[1]~input_o\,
	combout => \Mux40~0_combout\);

-- Location: LCCOMB_X31_Y26_N2
\Mux40~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~1_combout\ = (\Mux40~0_combout\ & (\fila_compra[2]~input_o\)) # (!\Mux40~0_combout\ & ((\columna_compra[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fila_compra[2]~input_o\,
	datac => \Mux40~0_combout\,
	datad => \columna_compra[0]~input_o\,
	combout => \Mux40~1_combout\);

-- Location: LCCOMB_X30_Y26_N28
\almacen[2][0][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[2][0][2]~0_combout\ = (\almacen[4][0][2]~1_combout\ & !\fila_compra[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \almacen[4][0][2]~1_combout\,
	datac => \fila_compra[2]~input_o\,
	combout => \almacen[2][0][2]~0_combout\);

-- Location: LCCOMB_X31_Y26_N22
\almacen[2][1][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[2][1][2]~0_combout\ = (\columna_compra[0]~input_o\ & (!\fila_compra[0]~input_o\ & (\almacen[2][0][2]~0_combout\ & \fila_compra[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[0]~input_o\,
	datab => \fila_compra[0]~input_o\,
	datac => \almacen[2][0][2]~0_combout\,
	datad => \fila_compra[1]~input_o\,
	combout => \almacen[2][1][2]~0_combout\);

-- Location: FF_X31_Y26_N13
\almacen[2][1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[2][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[2][1][2]~q\);

-- Location: LCCOMB_X31_Y26_N20
\Mux40~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~4_combout\ = (\columna_compra[1]~input_o\) # (!\fila_compra[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \columna_compra[1]~input_o\,
	datad => \fila_compra[0]~input_o\,
	combout => \Mux40~4_combout\);

-- Location: LCCOMB_X33_Y26_N4
\almacen[2][2][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[2][2][2]~0_combout\ = (\fila_compra[1]~input_o\ & (!\fila_compra[2]~input_o\ & (!\fila_compra[0]~input_o\ & \almacen[4][2][2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[1]~input_o\,
	datab => \fila_compra[2]~input_o\,
	datac => \fila_compra[0]~input_o\,
	datad => \almacen[4][2][2]~3_combout\,
	combout => \almacen[2][2][2]~0_combout\);

-- Location: FF_X33_Y26_N21
\almacen[2][2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[2][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[2][2][2]~q\);

-- Location: LCCOMB_X33_Y26_N22
\almacen[3][2][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[3][2][2]~0_combout\ = (\fila_compra[1]~input_o\ & (!\fila_compra[2]~input_o\ & (\fila_compra[0]~input_o\ & \almacen[4][2][2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[1]~input_o\,
	datab => \fila_compra[2]~input_o\,
	datac => \fila_compra[0]~input_o\,
	datad => \almacen[4][2][2]~3_combout\,
	combout => \almacen[3][2][2]~0_combout\);

-- Location: FF_X33_Y26_N27
\almacen[3][2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[3][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[3][2][2]~q\);

-- Location: LCCOMB_X30_Y26_N26
\almacen[3][1][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[3][1][2]~0_combout\ = (\fila_compra[1]~input_o\ & (\columna_compra[0]~input_o\ & (\fila_compra[0]~input_o\ & \almacen[2][0][2]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[1]~input_o\,
	datab => \columna_compra[0]~input_o\,
	datac => \fila_compra[0]~input_o\,
	datad => \almacen[2][0][2]~0_combout\,
	combout => \almacen[3][1][2]~0_combout\);

-- Location: FF_X28_Y26_N15
\almacen[3][1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[3][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[3][1][2]~q\);

-- Location: LCCOMB_X30_Y26_N0
\Mux40~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~3_combout\ = (\fila_compra[0]~input_o\ & ((\columna_compra[1]~input_o\) # (\columna_compra[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[1]~input_o\,
	datab => \fila_compra[0]~input_o\,
	datad => \columna_compra[0]~input_o\,
	combout => \Mux40~3_combout\);

-- Location: LCCOMB_X29_Y27_N12
\almacen[3][0][2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[3][0][2]~feeder_combout\ = \Add3~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add3~3_combout\,
	combout => \almacen[3][0][2]~feeder_combout\);

-- Location: LCCOMB_X30_Y27_N8
\almacen[3][0][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[3][0][2]~0_combout\ = (\fila_compra[1]~input_o\ & (\fila_compra[0]~input_o\ & (\almacen[2][0][2]~0_combout\ & !\columna_compra[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[1]~input_o\,
	datab => \fila_compra[0]~input_o\,
	datac => \almacen[2][0][2]~0_combout\,
	datad => \columna_compra[0]~input_o\,
	combout => \almacen[3][0][2]~0_combout\);

-- Location: FF_X29_Y27_N13
\almacen[3][0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[3][0][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[3][0][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[3][0][2]~q\);

-- Location: LCCOMB_X29_Y27_N18
\Mux40~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~12_combout\ = (\Mux40~3_combout\ & ((\almacen[3][1][2]~q\) # ((\Mux40~4_combout\)))) # (!\Mux40~3_combout\ & (((!\Mux40~4_combout\ & \almacen[3][0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[3][1][2]~q\,
	datab => \Mux40~3_combout\,
	datac => \Mux40~4_combout\,
	datad => \almacen[3][0][2]~q\,
	combout => \Mux40~12_combout\);

-- Location: LCCOMB_X33_Y26_N26
\Mux40~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~13_combout\ = (\Mux40~4_combout\ & ((\Mux40~12_combout\ & ((\almacen[3][2][2]~q\))) # (!\Mux40~12_combout\ & (\almacen[2][2][2]~q\)))) # (!\Mux40~4_combout\ & (((\Mux40~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~4_combout\,
	datab => \almacen[2][2][2]~q\,
	datac => \almacen[3][2][2]~q\,
	datad => \Mux40~12_combout\,
	combout => \Mux40~13_combout\);

-- Location: LCCOMB_X31_Y25_N2
\Mux40~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~5_combout\ = ((\columna_compra[1]~input_o\) # (\fila_compra[0]~input_o\)) # (!\fila_compra[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[1]~input_o\,
	datab => \columna_compra[1]~input_o\,
	datad => \fila_compra[0]~input_o\,
	combout => \Mux40~5_combout\);

-- Location: LCCOMB_X31_Y25_N8
\almacen[1][1][2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[1][1][2]~feeder_combout\ = \Add3~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~3_combout\,
	combout => \almacen[1][1][2]~feeder_combout\);

-- Location: LCCOMB_X31_Y25_N18
\almacen[1][1][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[1][1][2]~0_combout\ = (\columna_compra[0]~input_o\ & (\fila_compra[0]~input_o\ & (\almacen[2][0][2]~0_combout\ & !\fila_compra[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[0]~input_o\,
	datab => \fila_compra[0]~input_o\,
	datac => \almacen[2][0][2]~0_combout\,
	datad => \fila_compra[1]~input_o\,
	combout => \almacen[1][1][2]~0_combout\);

-- Location: FF_X31_Y25_N9
\almacen[1][1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[1][1][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[1][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[1][1][2]~q\);

-- Location: LCCOMB_X33_Y26_N14
\almacen[1][2][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[1][2][2]~0_combout\ = (!\fila_compra[1]~input_o\ & (!\fila_compra[2]~input_o\ & (\fila_compra[0]~input_o\ & \almacen[4][2][2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[1]~input_o\,
	datab => \fila_compra[2]~input_o\,
	datac => \fila_compra[0]~input_o\,
	datad => \almacen[4][2][2]~3_combout\,
	combout => \almacen[1][2][2]~0_combout\);

-- Location: FF_X30_Y26_N1
\almacen[1][2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[1][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[1][2][2]~q\);

-- Location: LCCOMB_X33_Y26_N24
\almacen[0][2][2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[0][2][2]~2_combout\ = (!\fila_compra[1]~input_o\ & (!\fila_compra[2]~input_o\ & (!\fila_compra[0]~input_o\ & \almacen[4][2][2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[1]~input_o\,
	datab => \fila_compra[2]~input_o\,
	datac => \fila_compra[0]~input_o\,
	datad => \almacen[4][2][2]~3_combout\,
	combout => \almacen[0][2][2]~2_combout\);

-- Location: FF_X28_Y26_N17
\almacen[0][2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[0][2][2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[0][2][2]~q\);

-- Location: LCCOMB_X31_Y25_N12
\almacen[1][0][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[1][0][2]~0_combout\ = (!\columna_compra[0]~input_o\ & (\fila_compra[0]~input_o\ & (\almacen[2][0][2]~0_combout\ & !\fila_compra[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[0]~input_o\,
	datab => \fila_compra[0]~input_o\,
	datac => \almacen[2][0][2]~0_combout\,
	datad => \fila_compra[1]~input_o\,
	combout => \almacen[1][0][2]~0_combout\);

-- Location: FF_X31_Y25_N3
\almacen[1][0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[1][0][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[1][0][2]~q\);

-- Location: LCCOMB_X31_Y25_N4
\Mux40~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~9_combout\ = (\Mux40~3_combout\ & (((\Mux40~4_combout\)))) # (!\Mux40~3_combout\ & ((\Mux40~4_combout\ & (\almacen[0][2][2]~q\)) # (!\Mux40~4_combout\ & ((\almacen[1][0][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~3_combout\,
	datab => \almacen[0][2][2]~q\,
	datac => \Mux40~4_combout\,
	datad => \almacen[1][0][2]~q\,
	combout => \Mux40~9_combout\);

-- Location: LCCOMB_X30_Y26_N22
\Mux40~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~10_combout\ = (\Mux40~3_combout\ & ((\Mux40~9_combout\ & ((\almacen[1][2][2]~q\))) # (!\Mux40~9_combout\ & (\almacen[1][1][2]~q\)))) # (!\Mux40~3_combout\ & (((\Mux40~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[1][1][2]~q\,
	datab => \Mux40~3_combout\,
	datac => \almacen[1][2][2]~q\,
	datad => \Mux40~9_combout\,
	combout => \Mux40~10_combout\);

-- Location: LCCOMB_X31_Y26_N16
\almacen[2][0][2]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[2][0][2]~1_combout\ = (!\columna_compra[0]~input_o\ & (!\fila_compra[0]~input_o\ & (\almacen[2][0][2]~0_combout\ & \fila_compra[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[0]~input_o\,
	datab => \fila_compra[0]~input_o\,
	datac => \almacen[2][0][2]~0_combout\,
	datad => \fila_compra[1]~input_o\,
	combout => \almacen[2][0][2]~1_combout\);

-- Location: FF_X31_Y26_N31
\almacen[2][0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[2][0][2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[2][0][2]~q\);

-- Location: LCCOMB_X30_Y26_N12
\Mux40~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~2_combout\ = (\fila_compra[1]~input_o\ & ((\columna_compra[1]~input_o\) # ((\fila_compra[0]~input_o\) # (\columna_compra[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[1]~input_o\,
	datab => \fila_compra[0]~input_o\,
	datac => \fila_compra[1]~input_o\,
	datad => \columna_compra[0]~input_o\,
	combout => \Mux40~2_combout\);

-- Location: LCCOMB_X31_Y26_N30
\Mux40~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~11_combout\ = (\Mux40~5_combout\ & ((\Mux40~10_combout\) # ((\Mux40~2_combout\)))) # (!\Mux40~5_combout\ & (((\almacen[2][0][2]~q\ & !\Mux40~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~5_combout\,
	datab => \Mux40~10_combout\,
	datac => \almacen[2][0][2]~q\,
	datad => \Mux40~2_combout\,
	combout => \Mux40~11_combout\);

-- Location: LCCOMB_X31_Y26_N0
\Mux40~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~14_combout\ = (\Mux40~11_combout\ & (((\Mux40~13_combout\) # (!\Mux40~2_combout\)))) # (!\Mux40~11_combout\ & (\almacen[2][1][2]~q\ & ((\Mux40~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[2][1][2]~q\,
	datab => \Mux40~13_combout\,
	datac => \Mux40~11_combout\,
	datad => \Mux40~2_combout\,
	combout => \Mux40~14_combout\);

-- Location: LCCOMB_X31_Y27_N26
\Mux40~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~15_combout\ = (\Mux40~1_combout\ & (((\Mux40~0_combout\)))) # (!\Mux40~1_combout\ & ((\Mux40~0_combout\ & ((\Mux40~14_combout\))) # (!\Mux40~0_combout\ & (\almacen[4][0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[4][0][2]~q\,
	datab => \Mux40~1_combout\,
	datac => \Mux40~0_combout\,
	datad => \Mux40~14_combout\,
	combout => \Mux40~15_combout\);

-- Location: LCCOMB_X31_Y27_N8
\almacen[4][1][2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][1][2]~feeder_combout\ = \Add3~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add3~3_combout\,
	combout => \almacen[4][1][2]~feeder_combout\);

-- Location: LCCOMB_X31_Y27_N0
\almacen[4][1][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][1][2]~0_combout\ = (\fila_compra[2]~input_o\ & (\columna_compra[0]~input_o\ & (\almacen[4][0][2]~0_combout\ & \almacen[4][0][2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[2]~input_o\,
	datab => \columna_compra[0]~input_o\,
	datac => \almacen[4][0][2]~0_combout\,
	datad => \almacen[4][0][2]~1_combout\,
	combout => \almacen[4][1][2]~0_combout\);

-- Location: FF_X31_Y27_N9
\almacen[4][1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[4][1][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[4][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[4][1][2]~q\);

-- Location: LCCOMB_X32_Y27_N6
\almacen[6][0][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[6][0][2]~0_combout\ = (\fila_compra[2]~input_o\ & (\fila_compra[1]~input_o\ & (!\fila_compra[0]~input_o\ & \almacen[4][0][2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[2]~input_o\,
	datab => \fila_compra[1]~input_o\,
	datac => \fila_compra[0]~input_o\,
	datad => \almacen[4][0][2]~1_combout\,
	combout => \almacen[6][0][2]~0_combout\);

-- Location: LCCOMB_X32_Y27_N18
\almacen[6][0][2]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[6][0][2]~1_combout\ = (!\columna_compra[0]~input_o\ & \almacen[6][0][2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[0]~input_o\,
	datad => \almacen[6][0][2]~0_combout\,
	combout => \almacen[6][0][2]~1_combout\);

-- Location: FF_X32_Y27_N19
\almacen[6][0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[6][0][2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[6][0][2]~q\);

-- Location: LCCOMB_X31_Y25_N28
\Mux40~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~6_combout\ = (\fila_compra[1]~input_o\ & ((\columna_compra[1]~input_o\) # (\columna_compra[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[1]~input_o\,
	datab => \columna_compra[1]~input_o\,
	datad => \columna_compra[0]~input_o\,
	combout => \Mux40~6_combout\);

-- Location: LCCOMB_X31_Y25_N6
\Mux40~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~7_combout\ = (\columna_compra[1]~input_o\) # (!\fila_compra[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \columna_compra[1]~input_o\,
	datad => \fila_compra[1]~input_o\,
	combout => \Mux40~7_combout\);

-- Location: LCCOMB_X30_Y27_N14
\almacen[5][0][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[5][0][2]~0_combout\ = (\fila_compra[2]~input_o\ & (\fila_compra[0]~input_o\ & (!\fila_compra[1]~input_o\ & \almacen[4][0][2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[2]~input_o\,
	datab => \fila_compra[0]~input_o\,
	datac => \fila_compra[1]~input_o\,
	datad => \almacen[4][0][2]~1_combout\,
	combout => \almacen[5][0][2]~0_combout\);

-- Location: LCCOMB_X32_Y26_N8
\almacen[5][1][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[5][1][2]~0_combout\ = (\columna_compra[0]~input_o\ & \almacen[5][0][2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[0]~input_o\,
	datad => \almacen[5][0][2]~0_combout\,
	combout => \almacen[5][1][2]~0_combout\);

-- Location: FF_X32_Y26_N9
\almacen[5][1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[5][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[5][1][2]~q\);

-- Location: LCCOMB_X33_Y26_N12
\almacen[5][2][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[5][2][2]~0_combout\ = (!\fila_compra[1]~input_o\ & (\fila_compra[2]~input_o\ & (\fila_compra[0]~input_o\ & \almacen[4][2][2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[1]~input_o\,
	datab => \fila_compra[2]~input_o\,
	datac => \fila_compra[0]~input_o\,
	datad => \almacen[4][2][2]~3_combout\,
	combout => \almacen[5][2][2]~0_combout\);

-- Location: FF_X33_Y27_N31
\almacen[5][2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[5][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[5][2][2]~q\);

-- Location: LCCOMB_X32_Y26_N26
\almacen[4][2][2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][2][2]~feeder_combout\ = \Add3~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~3_combout\,
	combout => \almacen[4][2][2]~feeder_combout\);

-- Location: LCCOMB_X33_Y26_N10
\almacen[4][2][2]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][2][2]~4_combout\ = (!\fila_compra[1]~input_o\ & (\fila_compra[2]~input_o\ & (!\fila_compra[0]~input_o\ & \almacen[4][2][2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[1]~input_o\,
	datab => \fila_compra[2]~input_o\,
	datac => \fila_compra[0]~input_o\,
	datad => \almacen[4][2][2]~3_combout\,
	combout => \almacen[4][2][2]~4_combout\);

-- Location: FF_X32_Y26_N27
\almacen[4][2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[4][2][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[4][2][2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[4][2][2]~q\);

-- Location: LCCOMB_X33_Y27_N0
\almacen[5][0][2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[5][0][2]~feeder_combout\ = \Add3~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~3_combout\,
	combout => \almacen[5][0][2]~feeder_combout\);

-- Location: LCCOMB_X30_Y27_N20
\almacen[5][0][2]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[5][0][2]~1_combout\ = (\almacen[5][0][2]~0_combout\ & !\columna_compra[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \almacen[5][0][2]~0_combout\,
	datad => \columna_compra[0]~input_o\,
	combout => \almacen[5][0][2]~1_combout\);

-- Location: FF_X33_Y27_N1
\almacen[5][0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[5][0][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[5][0][2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[5][0][2]~q\);

-- Location: LCCOMB_X33_Y27_N28
\Mux40~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~16_combout\ = (\Mux40~3_combout\ & (\Mux40~4_combout\)) # (!\Mux40~3_combout\ & ((\Mux40~4_combout\ & (\almacen[4][2][2]~q\)) # (!\Mux40~4_combout\ & ((\almacen[5][0][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~3_combout\,
	datab => \Mux40~4_combout\,
	datac => \almacen[4][2][2]~q\,
	datad => \almacen[5][0][2]~q\,
	combout => \Mux40~16_combout\);

-- Location: LCCOMB_X33_Y27_N30
\Mux40~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~17_combout\ = (\Mux40~3_combout\ & ((\Mux40~16_combout\ & ((\almacen[5][2][2]~q\))) # (!\Mux40~16_combout\ & (\almacen[5][1][2]~q\)))) # (!\Mux40~3_combout\ & (((\Mux40~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[5][1][2]~q\,
	datab => \Mux40~3_combout\,
	datac => \almacen[5][2][2]~q\,
	datad => \Mux40~16_combout\,
	combout => \Mux40~17_combout\);

-- Location: LCCOMB_X32_Y27_N10
\Mux40~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~18_combout\ = (\Mux40~6_combout\ & (((\Mux40~7_combout\)))) # (!\Mux40~6_combout\ & ((\Mux40~7_combout\ & ((\Mux40~17_combout\))) # (!\Mux40~7_combout\ & (\almacen[6][0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[6][0][2]~q\,
	datab => \Mux40~6_combout\,
	datac => \Mux40~7_combout\,
	datad => \Mux40~17_combout\,
	combout => \Mux40~18_combout\);

-- Location: LCCOMB_X32_Y25_N12
\almacen[6][2][2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[6][2][2]~feeder_combout\ = \Add3~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add3~3_combout\,
	combout => \almacen[6][2][2]~feeder_combout\);

-- Location: FF_X32_Y25_N13
\almacen[6][2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[6][2][2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[6][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[6][2][2]~q\);

-- Location: LCCOMB_X32_Y27_N28
\almacen[6][1][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[6][1][2]~0_combout\ = (\columna_compra[0]~input_o\ & \almacen[6][0][2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[0]~input_o\,
	datad => \almacen[6][0][2]~0_combout\,
	combout => \almacen[6][1][2]~0_combout\);

-- Location: FF_X32_Y27_N29
\almacen[6][1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[6][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[6][1][2]~q\);

-- Location: LCCOMB_X32_Y27_N4
\Mux40~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~19_combout\ = (\Mux40~18_combout\ & ((\almacen[6][2][2]~q\) # ((!\Mux40~6_combout\)))) # (!\Mux40~18_combout\ & (((\Mux40~6_combout\ & \almacen[6][1][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~18_combout\,
	datab => \almacen[6][2][2]~q\,
	datac => \Mux40~6_combout\,
	datad => \almacen[6][1][2]~q\,
	combout => \Mux40~19_combout\);

-- Location: LCCOMB_X31_Y27_N12
\Mux40~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~20_combout\ = (\Mux40~15_combout\ & (((\Mux40~19_combout\)) # (!\Mux40~1_combout\))) # (!\Mux40~15_combout\ & (\Mux40~1_combout\ & (\almacen[4][1][2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~15_combout\,
	datab => \Mux40~1_combout\,
	datac => \almacen[4][1][2]~q\,
	datad => \Mux40~19_combout\,
	combout => \Mux40~20_combout\);

-- Location: LCCOMB_X33_Y26_N6
\Add3~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~3_combout\ = \LessThan1~0_combout\ $ (((\Mux40~8_combout\ & ((!\Mux40~20_combout\))) # (!\Mux40~8_combout\ & (!\Mux40~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~21_combout\,
	datab => \Mux40~8_combout\,
	datac => \LessThan1~0_combout\,
	datad => \Mux40~20_combout\,
	combout => \Add3~3_combout\);

-- Location: LCCOMB_X30_Y27_N4
\almacen[0][1][2]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[0][1][2]~1_combout\ = (\almacen[0][1][2]~0_combout\ & ((\Add3~3_combout\))) # (!\almacen[0][1][2]~0_combout\ & (\almacen[0][1][2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[0][1][2]~0_combout\,
	datac => \almacen[0][1][2]~q\,
	datad => \Add3~3_combout\,
	combout => \almacen[0][1][2]~1_combout\);

-- Location: FF_X30_Y27_N5
\almacen[0][1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[0][1][2]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[0][1][2]~q\);

-- Location: LCCOMB_X30_Y27_N0
\almacen[0][0][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[0][0][2]~0_combout\ = (!\columna_compra[0]~input_o\ & (!\fila_compra[2]~input_o\ & (\almacen[4][0][2]~0_combout\ & \almacen[4][0][2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[0]~input_o\,
	datab => \fila_compra[2]~input_o\,
	datac => \almacen[4][0][2]~0_combout\,
	datad => \almacen[4][0][2]~1_combout\,
	combout => \almacen[0][0][2]~0_combout\);

-- Location: LCCOMB_X30_Y27_N16
\almacen[0][0][2]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[0][0][2]~1_combout\ = (\almacen[0][0][2]~0_combout\ & ((\Add3~3_combout\))) # (!\almacen[0][0][2]~0_combout\ & (\almacen[0][0][2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \almacen[0][0][2]~0_combout\,
	datac => \almacen[0][0][2]~q\,
	datad => \Add3~3_combout\,
	combout => \almacen[0][0][2]~1_combout\);

-- Location: FF_X30_Y27_N17
\almacen[0][0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[0][0][2]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[0][0][2]~q\);

-- Location: LCCOMB_X30_Y27_N2
\Mux40~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~21_combout\ = (\columna_compra[0]~input_o\ & (\almacen[0][1][2]~q\)) # (!\columna_compra[0]~input_o\ & ((\almacen[0][0][2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[0]~input_o\,
	datab => \almacen[0][1][2]~q\,
	datad => \almacen[0][0][2]~q\,
	combout => \Mux40~21_combout\);

-- Location: LCCOMB_X33_Y26_N0
\Mux40~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux40~22_combout\ = (\Mux40~8_combout\ & ((\Mux40~20_combout\))) # (!\Mux40~8_combout\ & (\Mux40~21_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux40~8_combout\,
	datac => \Mux40~21_combout\,
	datad => \Mux40~20_combout\,
	combout => \Mux40~22_combout\);

-- Location: LCCOMB_X33_Y26_N28
\almacen[4][2][2]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][2][2]~3_combout\ = (\almacen[4][2][2]~2_combout\ & (\actualizar_stock~input_o\ & ((\LessThan1~0_combout\) # (\Mux40~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[4][2][2]~2_combout\,
	datab => \LessThan1~0_combout\,
	datac => \actualizar_stock~input_o\,
	datad => \Mux40~22_combout\,
	combout => \almacen[4][2][2]~3_combout\);

-- Location: LCCOMB_X32_Y25_N26
\almacen[6][2][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[6][2][2]~0_combout\ = (\fila_compra[2]~input_o\ & (!\fila_compra[0]~input_o\ & (\fila_compra[1]~input_o\ & \almacen[4][2][2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fila_compra[2]~input_o\,
	datab => \fila_compra[0]~input_o\,
	datac => \fila_compra[1]~input_o\,
	datad => \almacen[4][2][2]~3_combout\,
	combout => \almacen[6][2][2]~0_combout\);

-- Location: FF_X32_Y25_N1
\almacen[6][2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[6][2][1]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[6][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[6][2][1]~q\);

-- Location: LCCOMB_X29_Y27_N24
\almacen[5][0][1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[5][0][1]~0_combout\ = !\Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	combout => \almacen[5][0][1]~0_combout\);

-- Location: FF_X29_Y27_N25
\almacen[5][0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[5][0][1]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[5][0][2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[5][0][1]~q\);

-- Location: LCCOMB_X32_Y26_N2
\almacen[5][1][1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[5][1][1]~0_combout\ = !\Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	combout => \almacen[5][1][1]~0_combout\);

-- Location: FF_X32_Y26_N3
\almacen[5][1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[5][1][1]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[5][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[5][1][1]~q\);

-- Location: LCCOMB_X32_Y26_N22
\Mux41~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux41~7_combout\ = (\Mux40~3_combout\ & ((\Mux40~4_combout\) # ((\almacen[5][1][1]~q\)))) # (!\Mux40~3_combout\ & (!\Mux40~4_combout\ & (\almacen[5][0][1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~3_combout\,
	datab => \Mux40~4_combout\,
	datac => \almacen[5][0][1]~q\,
	datad => \almacen[5][1][1]~q\,
	combout => \Mux41~7_combout\);

-- Location: FF_X32_Y26_N5
\almacen[4][2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[4][2][2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[4][2][1]~q\);

-- Location: LCCOMB_X28_Y27_N30
\almacen[5][2][1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[5][2][1]~0_combout\ = !\Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	combout => \almacen[5][2][1]~0_combout\);

-- Location: FF_X28_Y27_N31
\almacen[5][2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[5][2][1]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[5][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[5][2][1]~q\);

-- Location: LCCOMB_X32_Y26_N4
\Mux41~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux41~8_combout\ = (\Mux41~7_combout\ & (((\almacen[5][2][1]~q\)) # (!\Mux40~4_combout\))) # (!\Mux41~7_combout\ & (\Mux40~4_combout\ & (!\almacen[4][2][1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux41~7_combout\,
	datab => \Mux40~4_combout\,
	datac => \almacen[4][2][1]~q\,
	datad => \almacen[5][2][1]~q\,
	combout => \Mux41~8_combout\);

-- Location: LCCOMB_X32_Y27_N22
\almacen[6][0][1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[6][0][1]~0_combout\ = !\Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	combout => \almacen[6][0][1]~0_combout\);

-- Location: FF_X32_Y27_N23
\almacen[6][0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[6][0][1]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[6][0][2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[6][0][1]~q\);

-- Location: LCCOMB_X32_Y27_N12
\almacen[6][1][1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[6][1][1]~0_combout\ = !\Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	combout => \almacen[6][1][1]~0_combout\);

-- Location: FF_X32_Y27_N13
\almacen[6][1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[6][1][1]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[6][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[6][1][1]~q\);

-- Location: LCCOMB_X32_Y27_N8
\Mux41~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux41~9_combout\ = (\Mux40~6_combout\ & (((\Mux40~7_combout\) # (\almacen[6][1][1]~q\)))) # (!\Mux40~6_combout\ & (\almacen[6][0][1]~q\ & (!\Mux40~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[6][0][1]~q\,
	datab => \Mux40~6_combout\,
	datac => \Mux40~7_combout\,
	datad => \almacen[6][1][1]~q\,
	combout => \Mux41~9_combout\);

-- Location: LCCOMB_X32_Y26_N20
\Mux41~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux41~10_combout\ = (\Mux40~7_combout\ & ((\Mux41~9_combout\ & (\almacen[6][2][1]~q\)) # (!\Mux41~9_combout\ & ((\Mux41~8_combout\))))) # (!\Mux40~7_combout\ & (((\Mux41~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[6][2][1]~q\,
	datab => \Mux40~7_combout\,
	datac => \Mux41~8_combout\,
	datad => \Mux41~9_combout\,
	combout => \Mux41~10_combout\);

-- Location: LCCOMB_X31_Y27_N6
\almacen[4][0][1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][0][1]~feeder_combout\ = \Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	combout => \almacen[4][0][1]~feeder_combout\);

-- Location: FF_X31_Y27_N7
\almacen[4][0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[4][0][1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[4][0][2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[4][0][1]~q\);

-- Location: LCCOMB_X31_Y27_N24
\almacen[4][1][1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][1][1]~0_combout\ = !\Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	combout => \almacen[4][1][1]~0_combout\);

-- Location: FF_X31_Y27_N25
\almacen[4][1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[4][1][1]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[4][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[4][1][1]~q\);

-- Location: LCCOMB_X31_Y27_N4
\Mux41~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux41~6_combout\ = (\Mux40~1_combout\ & (((\Mux40~0_combout\) # (\almacen[4][1][1]~q\)))) # (!\Mux40~1_combout\ & (!\almacen[4][0][1]~q\ & (!\Mux40~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[4][0][1]~q\,
	datab => \Mux40~1_combout\,
	datac => \Mux40~0_combout\,
	datad => \almacen[4][1][1]~q\,
	combout => \Mux41~6_combout\);

-- Location: FF_X31_Y26_N27
\almacen[2][1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[2][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[2][1][1]~q\);

-- Location: FF_X31_Y26_N29
\almacen[2][0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[2][0][2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[2][0][1]~q\);

-- Location: LCCOMB_X31_Y26_N28
\Mux41~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux41~2_combout\ = (\Mux40~5_combout\ & (((\Mux40~2_combout\)))) # (!\Mux40~5_combout\ & ((\Mux40~2_combout\ & (!\almacen[2][1][1]~q\)) # (!\Mux40~2_combout\ & ((!\almacen[2][0][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~5_combout\,
	datab => \almacen[2][1][1]~q\,
	datac => \almacen[2][0][1]~q\,
	datad => \Mux40~2_combout\,
	combout => \Mux41~2_combout\);

-- Location: FF_X28_Y26_N25
\almacen[0][2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[0][2][2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[0][2][1]~q\);

-- Location: LCCOMB_X30_Y26_N4
\almacen[1][2][1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[1][2][1]~feeder_combout\ = \Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	combout => \almacen[1][2][1]~feeder_combout\);

-- Location: FF_X30_Y26_N5
\almacen[1][2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[1][2][1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[1][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[1][2][1]~q\);

-- Location: FF_X31_Y25_N11
\almacen[1][0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[1][0][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[1][0][1]~q\);

-- Location: LCCOMB_X31_Y25_N20
\almacen[1][1][1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[1][1][1]~0_combout\ = !\Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	combout => \almacen[1][1][1]~0_combout\);

-- Location: FF_X31_Y25_N21
\almacen[1][1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[1][1][1]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[1][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[1][1][1]~q\);

-- Location: LCCOMB_X31_Y25_N10
\Mux41~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux41~0_combout\ = (\Mux40~3_combout\ & ((\Mux40~4_combout\) # ((\almacen[1][1][1]~q\)))) # (!\Mux40~3_combout\ & (!\Mux40~4_combout\ & (!\almacen[1][0][1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~3_combout\,
	datab => \Mux40~4_combout\,
	datac => \almacen[1][0][1]~q\,
	datad => \almacen[1][1][1]~q\,
	combout => \Mux41~0_combout\);

-- Location: LCCOMB_X30_Y25_N16
\Mux41~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux41~1_combout\ = (\Mux40~4_combout\ & ((\Mux41~0_combout\ & ((!\almacen[1][2][1]~q\))) # (!\Mux41~0_combout\ & (!\almacen[0][2][1]~q\)))) # (!\Mux40~4_combout\ & (((\Mux41~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~4_combout\,
	datab => \almacen[0][2][1]~q\,
	datac => \almacen[1][2][1]~q\,
	datad => \Mux41~0_combout\,
	combout => \Mux41~1_combout\);

-- Location: FF_X29_Y27_N31
\almacen[3][0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[3][0][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[3][0][1]~q\);

-- Location: LCCOMB_X33_Y26_N16
\almacen[2][2][1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[2][2][1]~0_combout\ = !\Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	combout => \almacen[2][2][1]~0_combout\);

-- Location: FF_X33_Y26_N17
\almacen[2][2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[2][2][1]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[2][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[2][2][1]~q\);

-- Location: LCCOMB_X29_Y27_N8
\Mux41~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux41~3_combout\ = (\Mux40~3_combout\ & (((\Mux40~4_combout\)))) # (!\Mux40~3_combout\ & ((\Mux40~4_combout\ & ((\almacen[2][2][1]~q\))) # (!\Mux40~4_combout\ & (!\almacen[3][0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[3][0][1]~q\,
	datab => \Mux40~3_combout\,
	datac => \Mux40~4_combout\,
	datad => \almacen[2][2][1]~q\,
	combout => \Mux41~3_combout\);

-- Location: FF_X33_Y26_N31
\almacen[3][2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add3~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[3][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[3][2][1]~q\);

-- Location: LCCOMB_X30_Y26_N20
\almacen[3][1][1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[3][1][1]~feeder_combout\ = \Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	combout => \almacen[3][1][1]~feeder_combout\);

-- Location: FF_X30_Y26_N21
\almacen[3][1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[3][1][1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[3][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[3][1][1]~q\);

-- Location: LCCOMB_X33_Y26_N30
\Mux41~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux41~4_combout\ = (\Mux40~3_combout\ & ((\Mux41~3_combout\ & (!\almacen[3][2][1]~q\)) # (!\Mux41~3_combout\ & ((!\almacen[3][1][1]~q\))))) # (!\Mux40~3_combout\ & (\Mux41~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~3_combout\,
	datab => \Mux41~3_combout\,
	datac => \almacen[3][2][1]~q\,
	datad => \almacen[3][1][1]~q\,
	combout => \Mux41~4_combout\);

-- Location: LCCOMB_X31_Y25_N16
\Mux41~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux41~5_combout\ = (\Mux40~5_combout\ & ((\Mux41~2_combout\ & ((\Mux41~4_combout\))) # (!\Mux41~2_combout\ & (\Mux41~1_combout\)))) # (!\Mux40~5_combout\ & (\Mux41~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~5_combout\,
	datab => \Mux41~2_combout\,
	datac => \Mux41~1_combout\,
	datad => \Mux41~4_combout\,
	combout => \Mux41~5_combout\);

-- Location: LCCOMB_X31_Y25_N30
\Mux41~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux41~11_combout\ = (\Mux40~0_combout\ & ((\Mux41~6_combout\ & (\Mux41~10_combout\)) # (!\Mux41~6_combout\ & ((\Mux41~5_combout\))))) # (!\Mux40~0_combout\ & (((\Mux41~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux41~10_combout\,
	datab => \Mux40~0_combout\,
	datac => \Mux41~6_combout\,
	datad => \Mux41~5_combout\,
	combout => \Mux41~11_combout\);

-- Location: LCCOMB_X32_Y25_N24
\Add3~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = \Mux42~13_combout\ $ (((\Mux40~8_combout\ & (\Mux41~11_combout\)) # (!\Mux40~8_combout\ & ((\Mux41~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~8_combout\,
	datab => \Mux41~11_combout\,
	datac => \Mux42~13_combout\,
	datad => \Mux41~12_combout\,
	combout => \Add3~2_combout\);

-- Location: LCCOMB_X28_Y27_N10
\almacen[0][0][1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[0][0][1]~feeder_combout\ = \Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	combout => \almacen[0][0][1]~feeder_combout\);

-- Location: FF_X28_Y27_N11
\almacen[0][0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[0][0][1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[0][0][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[0][0][1]~q\);

-- Location: LCCOMB_X30_Y27_N24
\almacen[0][1][1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[0][1][1]~feeder_combout\ = \Add3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	combout => \almacen[0][1][1]~feeder_combout\);

-- Location: FF_X30_Y27_N25
\almacen[0][1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[0][1][1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[0][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[0][1][1]~q\);

-- Location: LCCOMB_X30_Y27_N12
\Mux41~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux41~12_combout\ = (\columna_compra[0]~input_o\ & ((!\almacen[0][1][1]~q\))) # (!\columna_compra[0]~input_o\ & (!\almacen[0][0][1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[0]~input_o\,
	datac => \almacen[0][0][1]~q\,
	datad => \almacen[0][1][1]~q\,
	combout => \Mux41~12_combout\);

-- Location: LCCOMB_X32_Y26_N6
\LessThan1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (\Mux42~13_combout\) # ((\Mux40~8_combout\ & ((\Mux41~11_combout\))) # (!\Mux40~8_combout\ & (\Mux41~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~8_combout\,
	datab => \Mux41~12_combout\,
	datac => \Mux41~11_combout\,
	datad => \Mux42~13_combout\,
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X33_Y26_N2
\almacen[4][0][2]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][0][2]~1_combout\ = (!\columna_compra[1]~input_o\ & (\actualizar_stock~input_o\ & ((\LessThan1~0_combout\) # (\Mux40~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[1]~input_o\,
	datab => \LessThan1~0_combout\,
	datac => \actualizar_stock~input_o\,
	datad => \Mux40~22_combout\,
	combout => \almacen[4][0][2]~1_combout\);

-- Location: LCCOMB_X30_Y27_N22
\almacen[0][1][2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[0][1][2]~0_combout\ = (\columna_compra[0]~input_o\ & (!\fila_compra[2]~input_o\ & (\almacen[4][0][2]~0_combout\ & \almacen[4][0][2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[0]~input_o\,
	datab => \fila_compra[2]~input_o\,
	datac => \almacen[4][0][2]~0_combout\,
	datad => \almacen[4][0][2]~1_combout\,
	combout => \almacen[0][1][2]~0_combout\);

-- Location: FF_X30_Y27_N19
\almacen[0][1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[0][1][0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[0][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[0][1][0]~q\);

-- Location: LCCOMB_X30_Y27_N30
\Mux42~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~12_combout\ = (\columna_compra[0]~input_o\ & ((\almacen[0][1][0]~q\))) # (!\columna_compra[0]~input_o\ & (\almacen[0][0][0]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \columna_compra[0]~input_o\,
	datac => \almacen[0][0][0]~q\,
	datad => \almacen[0][1][0]~q\,
	combout => \Mux42~12_combout\);

-- Location: LCCOMB_X33_Y26_N18
\almacen[3][2][0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[3][2][0]~0_combout\ = !\Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux42~13_combout\,
	combout => \almacen[3][2][0]~0_combout\);

-- Location: FF_X33_Y26_N19
\almacen[3][2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[3][2][0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[3][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[3][2][0]~q\);

-- Location: FF_X33_Y26_N9
\almacen[2][2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mux42~13_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[2][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[2][2][0]~q\);

-- Location: LCCOMB_X29_Y27_N14
\almacen[3][0][0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[3][0][0]~feeder_combout\ = \Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux42~13_combout\,
	combout => \almacen[3][0][0]~feeder_combout\);

-- Location: FF_X29_Y27_N15
\almacen[3][0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[3][0][0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[3][0][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[3][0][0]~q\);

-- Location: FF_X28_Y26_N23
\almacen[3][1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mux42~13_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[3][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[3][1][0]~q\);

-- Location: LCCOMB_X29_Y27_N6
\Mux42~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~3_combout\ = (\Mux40~3_combout\ & (((\Mux40~4_combout\) # (!\almacen[3][1][0]~q\)))) # (!\Mux40~3_combout\ & (!\almacen[3][0][0]~q\ & (!\Mux40~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[3][0][0]~q\,
	datab => \Mux40~3_combout\,
	datac => \Mux40~4_combout\,
	datad => \almacen[3][1][0]~q\,
	combout => \Mux42~3_combout\);

-- Location: LCCOMB_X33_Y26_N8
\Mux42~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~4_combout\ = (\Mux40~4_combout\ & ((\Mux42~3_combout\ & (\almacen[3][2][0]~q\)) # (!\Mux42~3_combout\ & ((!\almacen[2][2][0]~q\))))) # (!\Mux40~4_combout\ & (((\Mux42~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~4_combout\,
	datab => \almacen[3][2][0]~q\,
	datac => \almacen[2][2][0]~q\,
	datad => \Mux42~3_combout\,
	combout => \Mux42~4_combout\);

-- Location: FF_X31_Y26_N25
\almacen[2][1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mux42~13_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[2][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[2][1][0]~q\);

-- Location: LCCOMB_X31_Y26_N4
\almacen[2][0][0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[2][0][0]~0_combout\ = !\Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux42~13_combout\,
	combout => \almacen[2][0][0]~0_combout\);

-- Location: FF_X31_Y26_N5
\almacen[2][0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[2][0][0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[2][0][2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[2][0][0]~q\);

-- Location: LCCOMB_X31_Y26_N14
\almacen[1][2][0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[1][2][0]~0_combout\ = !\Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux42~13_combout\,
	combout => \almacen[1][2][0]~0_combout\);

-- Location: LCCOMB_X30_Y26_N14
\almacen[1][2][0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[1][2][0]~feeder_combout\ = \almacen[1][2][0]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \almacen[1][2][0]~0_combout\,
	combout => \almacen[1][2][0]~feeder_combout\);

-- Location: FF_X30_Y26_N15
\almacen[1][2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[1][2][0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[1][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[1][2][0]~q\);

-- Location: FF_X28_Y26_N9
\almacen[0][2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mux42~13_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[0][2][2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[0][2][0]~q\);

-- Location: FF_X31_Y25_N7
\almacen[1][0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mux42~13_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[1][0][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[1][0][0]~q\);

-- Location: LCCOMB_X31_Y25_N22
\Mux42~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~0_combout\ = (\Mux40~3_combout\ & (\Mux40~4_combout\)) # (!\Mux40~3_combout\ & ((\Mux40~4_combout\ & (!\almacen[0][2][0]~q\)) # (!\Mux40~4_combout\ & ((!\almacen[1][0][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~3_combout\,
	datab => \Mux40~4_combout\,
	datac => \almacen[0][2][0]~q\,
	datad => \almacen[1][0][0]~q\,
	combout => \Mux42~0_combout\);

-- Location: FF_X31_Y25_N29
\almacen[1][1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mux42~13_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[1][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[1][1][0]~q\);

-- Location: LCCOMB_X31_Y25_N0
\Mux42~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~1_combout\ = (\Mux40~3_combout\ & ((\Mux42~0_combout\ & (\almacen[1][2][0]~q\)) # (!\Mux42~0_combout\ & ((!\almacen[1][1][0]~q\))))) # (!\Mux40~3_combout\ & (((\Mux42~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~3_combout\,
	datab => \almacen[1][2][0]~q\,
	datac => \Mux42~0_combout\,
	datad => \almacen[1][1][0]~q\,
	combout => \Mux42~1_combout\);

-- Location: LCCOMB_X31_Y26_N6
\Mux42~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~2_combout\ = (\Mux40~2_combout\ & (((\Mux40~5_combout\)))) # (!\Mux40~2_combout\ & ((\Mux40~5_combout\ & ((\Mux42~1_combout\))) # (!\Mux40~5_combout\ & (\almacen[2][0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~2_combout\,
	datab => \almacen[2][0][0]~q\,
	datac => \Mux40~5_combout\,
	datad => \Mux42~1_combout\,
	combout => \Mux42~2_combout\);

-- Location: LCCOMB_X31_Y26_N24
\Mux42~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~5_combout\ = (\Mux40~2_combout\ & ((\Mux42~2_combout\ & (\Mux42~4_combout\)) # (!\Mux42~2_combout\ & ((!\almacen[2][1][0]~q\))))) # (!\Mux40~2_combout\ & (((\Mux42~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~2_combout\,
	datab => \Mux42~4_combout\,
	datac => \almacen[2][1][0]~q\,
	datad => \Mux42~2_combout\,
	combout => \Mux42~5_combout\);

-- Location: LCCOMB_X31_Y27_N30
\almacen[4][0][0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][0][0]~0_combout\ = !\Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux42~13_combout\,
	combout => \almacen[4][0][0]~0_combout\);

-- Location: FF_X31_Y27_N31
\almacen[4][0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[4][0][0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[4][0][2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[4][0][0]~q\);

-- Location: LCCOMB_X31_Y26_N8
\Mux42~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~6_combout\ = (\Mux40~0_combout\ & ((\Mux42~5_combout\) # ((\Mux40~1_combout\)))) # (!\Mux40~0_combout\ & (((!\Mux40~1_combout\ & \almacen[4][0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~0_combout\,
	datab => \Mux42~5_combout\,
	datac => \Mux40~1_combout\,
	datad => \almacen[4][0][0]~q\,
	combout => \Mux42~6_combout\);

-- Location: LCCOMB_X32_Y27_N30
\almacen[6][0][0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[6][0][0]~0_combout\ = !\Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux42~13_combout\,
	combout => \almacen[6][0][0]~0_combout\);

-- Location: FF_X32_Y27_N31
\almacen[6][0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[6][0][0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[6][0][2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[6][0][0]~q\);

-- Location: FF_X32_Y26_N15
\almacen[4][2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mux42~13_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \almacen[4][2][2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[4][2][0]~q\);

-- Location: LCCOMB_X29_Y27_N4
\almacen[5][0][0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[5][0][0]~0_combout\ = !\Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux42~13_combout\,
	combout => \almacen[5][0][0]~0_combout\);

-- Location: FF_X29_Y27_N5
\almacen[5][0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[5][0][0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[5][0][2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[5][0][0]~q\);

-- Location: LCCOMB_X32_Y26_N14
\Mux42~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~7_combout\ = (\Mux40~3_combout\ & (\Mux40~4_combout\)) # (!\Mux40~3_combout\ & ((\Mux40~4_combout\ & (!\almacen[4][2][0]~q\)) # (!\Mux40~4_combout\ & ((\almacen[5][0][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001110110001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~3_combout\,
	datab => \Mux40~4_combout\,
	datac => \almacen[4][2][0]~q\,
	datad => \almacen[5][0][0]~q\,
	combout => \Mux42~7_combout\);

-- Location: LCCOMB_X28_Y27_N8
\almacen[5][2][0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[5][2][0]~0_combout\ = !\Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux42~13_combout\,
	combout => \almacen[5][2][0]~0_combout\);

-- Location: FF_X28_Y27_N9
\almacen[5][2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[5][2][0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[5][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[5][2][0]~q\);

-- Location: LCCOMB_X32_Y26_N24
\almacen[5][1][0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[5][1][0]~0_combout\ = !\Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux42~13_combout\,
	combout => \almacen[5][1][0]~0_combout\);

-- Location: FF_X32_Y26_N25
\almacen[5][1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[5][1][0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[5][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[5][1][0]~q\);

-- Location: LCCOMB_X32_Y26_N28
\Mux42~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~8_combout\ = (\Mux40~3_combout\ & ((\Mux42~7_combout\ & (\almacen[5][2][0]~q\)) # (!\Mux42~7_combout\ & ((\almacen[5][1][0]~q\))))) # (!\Mux40~3_combout\ & (\Mux42~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~3_combout\,
	datab => \Mux42~7_combout\,
	datac => \almacen[5][2][0]~q\,
	datad => \almacen[5][1][0]~q\,
	combout => \Mux42~8_combout\);

-- Location: LCCOMB_X32_Y26_N30
\Mux42~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~9_combout\ = (\Mux40~7_combout\ & (((\Mux40~6_combout\) # (\Mux42~8_combout\)))) # (!\Mux40~7_combout\ & (\almacen[6][0][0]~q\ & (!\Mux40~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[6][0][0]~q\,
	datab => \Mux40~7_combout\,
	datac => \Mux40~6_combout\,
	datad => \Mux42~8_combout\,
	combout => \Mux42~9_combout\);

-- Location: LCCOMB_X32_Y25_N6
\almacen[6][2][0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[6][2][0]~0_combout\ = !\Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux42~13_combout\,
	combout => \almacen[6][2][0]~0_combout\);

-- Location: FF_X32_Y25_N7
\almacen[6][2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[6][2][0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[6][2][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[6][2][0]~q\);

-- Location: LCCOMB_X32_Y27_N0
\almacen[6][1][0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[6][1][0]~0_combout\ = !\Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux42~13_combout\,
	combout => \almacen[6][1][0]~0_combout\);

-- Location: FF_X32_Y27_N1
\almacen[6][1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[6][1][0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[6][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[6][1][0]~q\);

-- Location: LCCOMB_X32_Y26_N0
\Mux42~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~10_combout\ = (\Mux42~9_combout\ & ((\almacen[6][2][0]~q\) # ((!\Mux40~6_combout\)))) # (!\Mux42~9_combout\ & (((\Mux40~6_combout\ & \almacen[6][1][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux42~9_combout\,
	datab => \almacen[6][2][0]~q\,
	datac => \Mux40~6_combout\,
	datad => \almacen[6][1][0]~q\,
	combout => \Mux42~10_combout\);

-- Location: LCCOMB_X31_Y27_N28
\almacen[4][1][0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[4][1][0]~feeder_combout\ = \Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux42~13_combout\,
	combout => \almacen[4][1][0]~feeder_combout\);

-- Location: FF_X31_Y27_N29
\almacen[4][1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[4][1][0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[4][1][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[4][1][0]~q\);

-- Location: LCCOMB_X31_Y26_N18
\Mux42~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~11_combout\ = (\Mux40~1_combout\ & ((\Mux42~6_combout\ & (\Mux42~10_combout\)) # (!\Mux42~6_combout\ & ((!\almacen[4][1][0]~q\))))) # (!\Mux40~1_combout\ & (\Mux42~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~1_combout\,
	datab => \Mux42~6_combout\,
	datac => \Mux42~10_combout\,
	datad => \almacen[4][1][0]~q\,
	combout => \Mux42~11_combout\);

-- Location: LCCOMB_X31_Y26_N12
\Mux42~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux42~13_combout\ = (\Mux40~8_combout\ & ((\Mux42~11_combout\))) # (!\Mux40~8_combout\ & (\Mux42~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~8_combout\,
	datab => \Mux42~12_combout\,
	datad => \Mux42~11_combout\,
	combout => \Mux42~13_combout\);

-- Location: LCCOMB_X28_Y27_N20
\almacen[0][0][0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \almacen[0][0][0]~0_combout\ = !\Mux42~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux42~13_combout\,
	combout => \almacen[0][0][0]~0_combout\);

-- Location: FF_X28_Y27_N21
\almacen[0][0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \almacen[0][0][0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \almacen[0][0][2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \almacen[0][0][0]~q\);

-- Location: LCCOMB_X30_Y27_N6
\LessThan5~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan5~2_combout\ = (\almacen[0][0][0]~q\) # ((\almacen[0][0][2]~q\) # (!\almacen[0][0][1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[0][0][0]~q\,
	datab => \almacen[0][0][1]~q\,
	datad => \almacen[0][0][2]~q\,
	combout => \LessThan5~2_combout\);

-- Location: LCCOMB_X30_Y27_N26
\LessThan5~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan5~1_combout\ = (\almacen[0][1][0]~q\) # ((\almacen[0][1][2]~q\) # (!\almacen[0][1][1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \almacen[0][1][0]~q\,
	datac => \almacen[0][1][2]~q\,
	datad => \almacen[0][1][1]~q\,
	combout => \LessThan5~1_combout\);

-- Location: LCCOMB_X30_Y27_N28
\LessThan5~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan5~3_combout\ = (codigo_ingresado_int(0) & ((\LessThan5~1_combout\))) # (!codigo_ingresado_int(0) & (\LessThan5~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan5~2_combout\,
	datab => codigo_ingresado_int(0),
	datac => \LessThan5~1_combout\,
	combout => \LessThan5~3_combout\);

-- Location: LCCOMB_X28_Y24_N22
\Mux91~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~7_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\) # (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mux91~7_combout\);

-- Location: LCCOMB_X28_Y24_N24
\Mux91~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~2_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((codigo_ingresado_int(0)) # ((\Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\) # (!\precio_actual~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(0),
	datab => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\,
	datad => \precio_actual~15_combout\,
	combout => \Mux91~2_combout\);

-- Location: LCCOMB_X28_Y24_N0
\Mux90~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux90~6_combout\ = (\Mux91~7_combout\ & (((\Mux91~2_combout\)))) # (!\Mux91~7_combout\ & ((\Mux91~2_combout\ & (\almacen[4][1][1]~q\)) # (!\Mux91~2_combout\ & ((!\almacen[4][0][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[4][1][1]~q\,
	datab => \almacen[4][0][1]~q\,
	datac => \Mux91~7_combout\,
	datad => \Mux91~2_combout\,
	combout => \Mux90~6_combout\);

-- Location: LCCOMB_X28_Y26_N12
\Mux91~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~3_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & (!codigo_ingresado_int(1))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(1),
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mux91~3_combout\);

-- Location: LCCOMB_X28_Y26_N10
\Mux91~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~8_combout\ = (\Mux91~3_combout\ & (codigo_ingresado_int(0))) # (!\Mux91~3_combout\ & ((!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => codigo_ingresado_int(0),
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Mux91~3_combout\,
	combout => \Mux91~8_combout\);

-- Location: LCCOMB_X28_Y26_N4
\Mux90~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux90~9_combout\ = (\Mux91~3_combout\ & ((\Mux91~8_combout\ & (\almacen[6][1][1]~q\)) # (!\Mux91~8_combout\ & ((\almacen[6][0][1]~q\))))) # (!\Mux91~3_combout\ & (((\Mux91~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~3_combout\,
	datab => \almacen[6][1][1]~q\,
	datac => \almacen[6][0][1]~q\,
	datad => \Mux91~8_combout\,
	combout => \Mux90~9_combout\);

-- Location: LCCOMB_X28_Y26_N18
\Mux91~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~5_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\) # ((\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((codigo_ingresado_int(1)))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datab => codigo_ingresado_int(1),
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mux91~5_combout\);

-- Location: LCCOMB_X28_Y26_N24
\Mux91~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~6_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((codigo_ingresado_int(0)) # (\Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datab => codigo_ingresado_int(0),
	datad => \Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\,
	combout => \Mux91~6_combout\);

-- Location: LCCOMB_X28_Y26_N0
\Mux90~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux90~7_combout\ = (\Mux91~5_combout\ & (((\Mux91~6_combout\)))) # (!\Mux91~5_combout\ & ((\Mux91~6_combout\ & ((\almacen[5][1][1]~q\))) # (!\Mux91~6_combout\ & (\almacen[5][0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[5][0][1]~q\,
	datab => \almacen[5][1][1]~q\,
	datac => \Mux91~5_combout\,
	datad => \Mux91~6_combout\,
	combout => \Mux90~7_combout\);

-- Location: LCCOMB_X28_Y26_N2
\Mux90~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux90~8_combout\ = (\Mux91~5_combout\ & ((\Mux90~7_combout\ & (\almacen[5][2][1]~q\)) # (!\Mux90~7_combout\ & ((!\almacen[4][2][1]~q\))))) # (!\Mux91~5_combout\ & (((\Mux90~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[5][2][1]~q\,
	datab => \almacen[4][2][1]~q\,
	datac => \Mux91~5_combout\,
	datad => \Mux90~7_combout\,
	combout => \Mux90~8_combout\);

-- Location: LCCOMB_X28_Y26_N26
\Mux90~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux90~10_combout\ = (\Mux91~3_combout\ & (((\Mux90~9_combout\)))) # (!\Mux91~3_combout\ & ((\Mux90~9_combout\ & (\almacen[6][2][1]~q\)) # (!\Mux90~9_combout\ & ((\Mux90~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~3_combout\,
	datab => \almacen[6][2][1]~q\,
	datac => \Mux90~9_combout\,
	datad => \Mux90~8_combout\,
	combout => \Mux90~10_combout\);

-- Location: LCCOMB_X31_Y26_N10
\Mux91~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~11_combout\ = (!\Mux91~3_combout\) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mux91~3_combout\,
	combout => \Mux91~11_combout\);

-- Location: LCCOMB_X30_Y26_N2
\Mux90~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux90~3_combout\ = (\Mux91~5_combout\ & ((\almacen[2][2][1]~q\) # ((\Mux91~6_combout\)))) # (!\Mux91~5_combout\ & (((!\almacen[3][0][1]~q\ & !\Mux91~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[2][2][1]~q\,
	datab => \almacen[3][0][1]~q\,
	datac => \Mux91~5_combout\,
	datad => \Mux91~6_combout\,
	combout => \Mux90~3_combout\);

-- Location: LCCOMB_X30_Y26_N8
\Mux90~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux90~4_combout\ = (\Mux91~6_combout\ & ((\Mux90~3_combout\ & ((!\almacen[3][2][1]~q\))) # (!\Mux90~3_combout\ & (!\almacen[3][1][1]~q\)))) # (!\Mux91~6_combout\ & (((\Mux90~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[3][1][1]~q\,
	datab => \almacen[3][2][1]~q\,
	datac => \Mux91~6_combout\,
	datad => \Mux90~3_combout\,
	combout => \Mux90~4_combout\);

-- Location: LCCOMB_X30_Y26_N18
\Mux90~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux90~0_combout\ = (\Mux91~5_combout\ & (((\Mux91~6_combout\)))) # (!\Mux91~5_combout\ & ((\Mux91~6_combout\ & ((\almacen[1][1][1]~q\))) # (!\Mux91~6_combout\ & (!\almacen[1][0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[1][0][1]~q\,
	datab => \almacen[1][1][1]~q\,
	datac => \Mux91~5_combout\,
	datad => \Mux91~6_combout\,
	combout => \Mux90~0_combout\);

-- Location: LCCOMB_X30_Y26_N30
\Mux90~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux90~1_combout\ = (\Mux91~5_combout\ & ((\Mux90~0_combout\ & ((!\almacen[1][2][1]~q\))) # (!\Mux90~0_combout\ & (!\almacen[0][2][1]~q\)))) # (!\Mux91~5_combout\ & (((\Mux90~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[0][2][1]~q\,
	datab => \almacen[1][2][1]~q\,
	datac => \Mux91~5_combout\,
	datad => \Mux90~0_combout\,
	combout => \Mux90~1_combout\);

-- Location: LCCOMB_X29_Y26_N22
\Mux91~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Mux91~3_combout\ & ((codigo_ingresado_int(0)))) # (!\Mux91~3_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => codigo_ingresado_int(0),
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mux91~3_combout\,
	combout => \Mux91~4_combout\);

-- Location: LCCOMB_X31_Y26_N26
\Mux90~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux90~2_combout\ = (\Mux91~11_combout\ & (((\Mux91~4_combout\)))) # (!\Mux91~11_combout\ & ((\Mux91~4_combout\ & ((!\almacen[2][1][1]~q\))) # (!\Mux91~4_combout\ & (!\almacen[2][0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~11_combout\,
	datab => \almacen[2][0][1]~q\,
	datac => \almacen[2][1][1]~q\,
	datad => \Mux91~4_combout\,
	combout => \Mux90~2_combout\);

-- Location: LCCOMB_X30_Y26_N6
\Mux90~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux90~5_combout\ = (\Mux91~11_combout\ & ((\Mux90~2_combout\ & (\Mux90~4_combout\)) # (!\Mux90~2_combout\ & ((\Mux90~1_combout\))))) # (!\Mux91~11_combout\ & (((\Mux90~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~11_combout\,
	datab => \Mux90~4_combout\,
	datac => \Mux90~1_combout\,
	datad => \Mux90~2_combout\,
	combout => \Mux90~5_combout\);

-- Location: LCCOMB_X29_Y26_N20
\Mux90~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux90~11_combout\ = (\Mux91~7_combout\ & ((\Mux90~6_combout\ & (\Mux90~10_combout\)) # (!\Mux90~6_combout\ & ((\Mux90~5_combout\))))) # (!\Mux91~7_combout\ & (\Mux90~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~7_combout\,
	datab => \Mux90~6_combout\,
	datac => \Mux90~10_combout\,
	datad => \Mux90~5_combout\,
	combout => \Mux90~11_combout\);

-- Location: LCCOMB_X28_Y26_N28
\Mux91~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~17_combout\ = (\Mux91~5_combout\ & (((\Mux91~6_combout\)) # (!\almacen[4][2][0]~q\))) # (!\Mux91~5_combout\ & (((\almacen[5][0][0]~q\ & !\Mux91~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[4][2][0]~q\,
	datab => \almacen[5][0][0]~q\,
	datac => \Mux91~5_combout\,
	datad => \Mux91~6_combout\,
	combout => \Mux91~17_combout\);

-- Location: LCCOMB_X28_Y26_N30
\Mux91~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~18_combout\ = (\Mux91~6_combout\ & ((\Mux91~17_combout\ & (\almacen[5][2][0]~q\)) # (!\Mux91~17_combout\ & ((\almacen[5][1][0]~q\))))) # (!\Mux91~6_combout\ & (((\Mux91~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[5][2][0]~q\,
	datab => \Mux91~6_combout\,
	datac => \almacen[5][1][0]~q\,
	datad => \Mux91~17_combout\,
	combout => \Mux91~18_combout\);

-- Location: LCCOMB_X28_Y26_N20
\Mux91~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~19_combout\ = (\Mux91~3_combout\ & (\almacen[6][0][0]~q\ & ((!\Mux91~8_combout\)))) # (!\Mux91~3_combout\ & (((\Mux91~18_combout\) # (\Mux91~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~3_combout\,
	datab => \almacen[6][0][0]~q\,
	datac => \Mux91~18_combout\,
	datad => \Mux91~8_combout\,
	combout => \Mux91~19_combout\);

-- Location: LCCOMB_X28_Y26_N6
\Mux91~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~20_combout\ = (\Mux91~8_combout\ & ((\Mux91~19_combout\ & ((\almacen[6][2][0]~q\))) # (!\Mux91~19_combout\ & (\almacen[6][1][0]~q\)))) # (!\Mux91~8_combout\ & (((\Mux91~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~8_combout\,
	datab => \almacen[6][1][0]~q\,
	datac => \almacen[6][2][0]~q\,
	datad => \Mux91~19_combout\,
	combout => \Mux91~20_combout\);

-- Location: LCCOMB_X28_Y26_N8
\Mux91~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~9_combout\ = (\Mux91~5_combout\ & ((\Mux91~6_combout\ & (!\almacen[1][2][0]~q\)) # (!\Mux91~6_combout\ & ((\almacen[0][2][0]~q\))))) # (!\Mux91~5_combout\ & (((\Mux91~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[1][2][0]~q\,
	datab => \Mux91~5_combout\,
	datac => \almacen[0][2][0]~q\,
	datad => \Mux91~6_combout\,
	combout => \Mux91~9_combout\);

-- Location: LCCOMB_X29_Y26_N2
\Mux91~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~10_combout\ = (\Mux91~5_combout\ & (((!\Mux91~9_combout\)))) # (!\Mux91~5_combout\ & ((\Mux91~9_combout\ & (!\almacen[1][1][0]~q\)) # (!\Mux91~9_combout\ & ((!\almacen[1][0][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[1][1][0]~q\,
	datab => \Mux91~5_combout\,
	datac => \almacen[1][0][0]~q\,
	datad => \Mux91~9_combout\,
	combout => \Mux91~10_combout\);

-- Location: LCCOMB_X29_Y26_N4
\Mux91~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~12_combout\ = (\Mux91~4_combout\ & (((\Mux91~11_combout\)))) # (!\Mux91~4_combout\ & ((\Mux91~11_combout\ & ((\Mux91~10_combout\))) # (!\Mux91~11_combout\ & (\almacen[2][0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~4_combout\,
	datab => \almacen[2][0][0]~q\,
	datac => \Mux91~11_combout\,
	datad => \Mux91~10_combout\,
	combout => \Mux91~12_combout\);

-- Location: LCCOMB_X28_Y26_N22
\Mux91~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~13_combout\ = (\Mux91~5_combout\ & (((\Mux91~6_combout\)))) # (!\Mux91~5_combout\ & ((\Mux91~6_combout\ & ((!\almacen[3][1][0]~q\))) # (!\Mux91~6_combout\ & (!\almacen[3][0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[3][0][0]~q\,
	datab => \Mux91~5_combout\,
	datac => \almacen[3][1][0]~q\,
	datad => \Mux91~6_combout\,
	combout => \Mux91~13_combout\);

-- Location: LCCOMB_X30_Y26_N24
\Mux91~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~14_combout\ = (\Mux91~5_combout\ & ((\Mux91~13_combout\ & (\almacen[3][2][0]~q\)) # (!\Mux91~13_combout\ & ((!\almacen[2][2][0]~q\))))) # (!\Mux91~5_combout\ & (((\Mux91~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[3][2][0]~q\,
	datab => \almacen[2][2][0]~q\,
	datac => \Mux91~5_combout\,
	datad => \Mux91~13_combout\,
	combout => \Mux91~14_combout\);

-- Location: LCCOMB_X29_Y26_N18
\Mux91~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~15_combout\ = (\Mux91~4_combout\ & ((\Mux91~12_combout\ & ((\Mux91~14_combout\))) # (!\Mux91~12_combout\ & (!\almacen[2][1][0]~q\)))) # (!\Mux91~4_combout\ & (((\Mux91~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001001010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~4_combout\,
	datab => \almacen[2][1][0]~q\,
	datac => \Mux91~12_combout\,
	datad => \Mux91~14_combout\,
	combout => \Mux91~15_combout\);

-- Location: LCCOMB_X29_Y26_N16
\Mux91~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~16_combout\ = (\Mux91~7_combout\ & (((\Mux91~2_combout\) # (\Mux91~15_combout\)))) # (!\Mux91~7_combout\ & (\almacen[4][0][0]~q\ & (!\Mux91~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~7_combout\,
	datab => \almacen[4][0][0]~q\,
	datac => \Mux91~2_combout\,
	datad => \Mux91~15_combout\,
	combout => \Mux91~16_combout\);

-- Location: LCCOMB_X29_Y26_N30
\Mux91~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux91~21_combout\ = (\Mux91~2_combout\ & ((\Mux91~16_combout\ & ((\Mux91~20_combout\))) # (!\Mux91~16_combout\ & (!\almacen[4][1][0]~q\)))) # (!\Mux91~2_combout\ & (((\Mux91~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[4][1][0]~q\,
	datab => \Mux91~2_combout\,
	datac => \Mux91~20_combout\,
	datad => \Mux91~16_combout\,
	combout => \Mux91~21_combout\);

-- Location: LCCOMB_X29_Y26_N24
\Mux89~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~2_combout\ = (codigo_ingresado_int(0) & (((!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)))) # (!codigo_ingresado_int(0) & ((\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & 
-- (\almacen[2][0][2]~q\)) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111100101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[2][0][2]~q\,
	datab => codigo_ingresado_int(0),
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[43]~61_combout\,
	combout => \Mux89~2_combout\);

-- Location: LCCOMB_X29_Y26_N8
\Mux89~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (\Mux91~3_combout\ & !\Mux89~2_combout\)) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Mux89~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~3_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mux89~2_combout\,
	combout => \Mux89~4_combout\);

-- Location: LCCOMB_X30_Y26_N10
\Mux89~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~0_combout\ = (\Mux91~5_combout\ & ((\almacen[1][2][2]~q\))) # (!\Mux91~5_combout\ & (\almacen[1][1][2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[1][1][2]~q\,
	datab => \almacen[1][2][2]~q\,
	datad => \Mux91~5_combout\,
	combout => \Mux89~0_combout\);

-- Location: LCCOMB_X28_Y26_N16
\Mux89~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~1_combout\ = (\Mux91~5_combout\ & ((\almacen[0][2][2]~q\))) # (!\Mux91~5_combout\ & (\almacen[1][0][2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[1][0][2]~q\,
	datac => \almacen[0][2][2]~q\,
	datad => \Mux91~5_combout\,
	combout => \Mux89~1_combout\);

-- Location: LCCOMB_X29_Y26_N10
\Mux89~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~3_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Mux91~3_combout\ & ((\Mux89~2_combout\))) # (!\Mux91~3_combout\ & (\Mux89~1_combout\)))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (((\Mux89~1_combout\) # (\Mux89~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~3_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \Mux89~1_combout\,
	datad => \Mux89~2_combout\,
	combout => \Mux89~3_combout\);

-- Location: LCCOMB_X29_Y26_N14
\Mux89~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~5_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (\Mux89~3_combout\ & ((\Mux89~0_combout\) # (!\Mux89~4_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & 
-- (((\Mux89~3_combout\)) # (!\Mux89~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \Mux89~4_combout\,
	datac => \Mux89~0_combout\,
	datad => \Mux89~3_combout\,
	combout => \Mux89~5_combout\);

-- Location: LCCOMB_X28_Y26_N14
\Mux89~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~6_combout\ = (\Mux91~5_combout\ & (((\Mux91~6_combout\)))) # (!\Mux91~5_combout\ & ((\Mux91~6_combout\ & ((\almacen[3][1][2]~q\))) # (!\Mux91~6_combout\ & (\almacen[3][0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[3][0][2]~q\,
	datab => \Mux91~5_combout\,
	datac => \almacen[3][1][2]~q\,
	datad => \Mux91~6_combout\,
	combout => \Mux89~6_combout\);

-- Location: LCCOMB_X30_Y26_N16
\Mux89~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~7_combout\ = (\Mux91~5_combout\ & ((\Mux89~6_combout\ & ((\almacen[3][2][2]~q\))) # (!\Mux89~6_combout\ & (\almacen[2][2][2]~q\)))) # (!\Mux91~5_combout\ & (((\Mux89~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[2][2][2]~q\,
	datab => \almacen[3][2][2]~q\,
	datac => \Mux91~5_combout\,
	datad => \Mux89~6_combout\,
	combout => \Mux89~7_combout\);

-- Location: LCCOMB_X29_Y26_N28
\Mux89~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~8_combout\ = (\Mux91~4_combout\ & ((\Mux89~5_combout\ & ((\Mux89~7_combout\))) # (!\Mux89~5_combout\ & (\almacen[2][1][2]~q\)))) # (!\Mux91~4_combout\ & (((\Mux89~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~4_combout\,
	datab => \almacen[2][1][2]~q\,
	datac => \Mux89~5_combout\,
	datad => \Mux89~7_combout\,
	combout => \Mux89~8_combout\);

-- Location: LCCOMB_X29_Y26_N26
\Mux89~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~9_combout\ = (\Mux91~2_combout\ & (((\Mux91~7_combout\)))) # (!\Mux91~2_combout\ & ((\Mux91~7_combout\ & ((\Mux89~8_combout\))) # (!\Mux91~7_combout\ & (\almacen[4][0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[4][0][2]~q\,
	datab => \Mux91~2_combout\,
	datac => \Mux91~7_combout\,
	datad => \Mux89~8_combout\,
	combout => \Mux89~9_combout\);

-- Location: LCCOMB_X32_Y26_N12
\Mux89~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~10_combout\ = (\Mux91~5_combout\ & ((\almacen[4][2][2]~q\) # ((\Mux91~6_combout\)))) # (!\Mux91~5_combout\ & (((\almacen[5][0][2]~q\ & !\Mux91~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[4][2][2]~q\,
	datab => \almacen[5][0][2]~q\,
	datac => \Mux91~5_combout\,
	datad => \Mux91~6_combout\,
	combout => \Mux89~10_combout\);

-- Location: LCCOMB_X32_Y26_N10
\Mux89~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~11_combout\ = (\Mux91~6_combout\ & ((\Mux89~10_combout\ & ((\almacen[5][2][2]~q\))) # (!\Mux89~10_combout\ & (\almacen[5][1][2]~q\)))) # (!\Mux91~6_combout\ & (((\Mux89~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[5][1][2]~q\,
	datab => \almacen[5][2][2]~q\,
	datac => \Mux91~6_combout\,
	datad => \Mux89~10_combout\,
	combout => \Mux89~11_combout\);

-- Location: LCCOMB_X32_Y26_N16
\Mux89~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~12_combout\ = (\Mux91~3_combout\ & (\almacen[6][0][2]~q\ & (!\Mux91~8_combout\))) # (!\Mux91~3_combout\ & (((\Mux91~8_combout\) # (\Mux89~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110101011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~3_combout\,
	datab => \almacen[6][0][2]~q\,
	datac => \Mux91~8_combout\,
	datad => \Mux89~11_combout\,
	combout => \Mux89~12_combout\);

-- Location: LCCOMB_X32_Y26_N18
\Mux89~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~13_combout\ = (\Mux91~8_combout\ & ((\Mux89~12_combout\ & (\almacen[6][2][2]~q\)) # (!\Mux89~12_combout\ & ((\almacen[6][1][2]~q\))))) # (!\Mux91~8_combout\ & (((\Mux89~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[6][2][2]~q\,
	datab => \almacen[6][1][2]~q\,
	datac => \Mux91~8_combout\,
	datad => \Mux89~12_combout\,
	combout => \Mux89~13_combout\);

-- Location: LCCOMB_X29_Y26_N12
\Mux89~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux89~14_combout\ = (\Mux91~2_combout\ & ((\Mux89~9_combout\ & ((\Mux89~13_combout\))) # (!\Mux89~9_combout\ & (\almacen[4][1][2]~q\)))) # (!\Mux91~2_combout\ & (((\Mux89~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \almacen[4][1][2]~q\,
	datab => \Mux91~2_combout\,
	datac => \Mux89~9_combout\,
	datad => \Mux89~13_combout\,
	combout => \Mux89~14_combout\);

-- Location: LCCOMB_X29_Y26_N6
\LessThan5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan5~0_combout\ = (\Mux91~22_combout\ & ((\Mux90~11_combout\) # ((\Mux91~21_combout\) # (\Mux89~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux91~22_combout\,
	datab => \Mux90~11_combout\,
	datac => \Mux91~21_combout\,
	datad => \Mux89~14_combout\,
	combout => \LessThan5~0_combout\);

-- Location: LCCOMB_X29_Y26_N0
\stock_disponible~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \stock_disponible~0_combout\ = (\precio_actual~11_combout\ & ((\LessThan5~0_combout\) # ((!\Mux91~22_combout\ & \LessThan5~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \precio_actual~11_combout\,
	datab => \Mux91~22_combout\,
	datac => \LessThan5~3_combout\,
	datad => \LessThan5~0_combout\,
	combout => \stock_disponible~0_combout\);

-- Location: FF_X29_Y26_N1
\stock_disponible~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_disponible~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stock_disponible~reg0_q\);

-- Location: LCCOMB_X10_Y8_N0
\Mux43~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux43~0_combout\ = (!key_stable(3) & ((key_stable(2) & (\digito_unidades_int[1]~0_combout\)) # (!key_stable(2) & ((\confirmar_pulsado_int~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(3),
	datab => \digito_unidades_int[1]~0_combout\,
	datac => \confirmar_pulsado_int~q\,
	datad => key_stable(2),
	combout => \Mux43~0_combout\);

-- Location: FF_X10_Y8_N1
confirmar_pulsado_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux43~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_key_valid_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \confirmar_pulsado_int~q\);

-- Location: LCCOMB_X10_Y7_N16
\Mux59~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux59~0_combout\ = (key_stable(0) & (\devolver_pulsado_int~q\ & ((!key_stable(1)) # (!key_stable(2))))) # (!key_stable(0) & (!key_stable(2) & ((\devolver_pulsado_int~q\) # (key_stable(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => key_stable(0),
	datab => key_stable(2),
	datac => \devolver_pulsado_int~q\,
	datad => key_stable(1),
	combout => \Mux59~0_combout\);

-- Location: LCCOMB_X10_Y8_N30
\Mux59~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux59~1_combout\ = (!key_stable(3) & \Mux59~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => key_stable(3),
	datad => \Mux59~0_combout\,
	combout => \Mux59~1_combout\);

-- Location: FF_X10_Y8_N31
devolver_pulsado_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux59~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_key_valid_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \devolver_pulsado_int~q\);

ww_teclado_columnas(0) <= \teclado_columnas[0]~output_o\;

ww_teclado_columnas(1) <= \teclado_columnas[1]~output_o\;

ww_teclado_columnas(2) <= \teclado_columnas[2]~output_o\;

ww_teclado_columnas(3) <= \teclado_columnas[3]~output_o\;

ww_digito_decenas(0) <= \digito_decenas[0]~output_o\;

ww_digito_decenas(1) <= \digito_decenas[1]~output_o\;

ww_digito_decenas(2) <= \digito_decenas[2]~output_o\;

ww_digito_decenas(3) <= \digito_decenas[3]~output_o\;

ww_digito_unidades(0) <= \digito_unidades[0]~output_o\;

ww_digito_unidades(1) <= \digito_unidades[1]~output_o\;

ww_digito_unidades(2) <= \digito_unidades[2]~output_o\;

ww_digito_unidades(3) <= \digito_unidades[3]~output_o\;

ww_codigo_ingresado(0) <= \codigo_ingresado[0]~output_o\;

ww_codigo_ingresado(1) <= \codigo_ingresado[1]~output_o\;

ww_codigo_ingresado(2) <= \codigo_ingresado[2]~output_o\;

ww_codigo_ingresado(3) <= \codigo_ingresado[3]~output_o\;

ww_codigo_ingresado(4) <= \codigo_ingresado[4]~output_o\;

ww_codigo_ingresado(5) <= \codigo_ingresado[5]~output_o\;

ww_codigo_ingresado(6) <= \codigo_ingresado[6]~output_o\;

ww_precio_actual(0) <= \precio_actual[0]~output_o\;

ww_precio_actual(1) <= \precio_actual[1]~output_o\;

ww_precio_actual(2) <= \precio_actual[2]~output_o\;

ww_precio_actual(3) <= \precio_actual[3]~output_o\;

ww_precio_actual(4) <= \precio_actual[4]~output_o\;

ww_precio_actual(5) <= \precio_actual[5]~output_o\;

ww_precio_actual(6) <= \precio_actual[6]~output_o\;

ww_stock_disponible <= \stock_disponible~output_o\;

ww_key_valid <= \key_valid~output_o\;

ww_confirmar_pulsado <= \confirmar_pulsado~output_o\;

ww_devolver_pulsado <= \devolver_pulsado~output_o\;
END structure;


