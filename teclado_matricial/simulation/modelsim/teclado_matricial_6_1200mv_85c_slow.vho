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

-- DATE "10/28/2025 19:50:45"

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

ENTITY 	teclado_matricial IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	filas_in : IN std_logic_vector(3 DOWNTO 0);
	columnas_out : OUT std_logic_vector(3 DOWNTO 0);
	tecla_valida : OUT std_logic;
	numero_tecla : OUT STD.STANDARD.integer range 0 TO 15
	);
END teclado_matricial;

-- Design Ports Information
-- columnas_out[0]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- columnas_out[1]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- columnas_out[2]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- columnas_out[3]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tecla_valida	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- numero_tecla[0]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- numero_tecla[1]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- numero_tecla[2]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- numero_tecla[3]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- filas_in[1]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- filas_in[3]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- filas_in[0]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- filas_in[2]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF teclado_matricial IS
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
SIGNAL ww_filas_in : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_columnas_out : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_tecla_valida : std_logic;
SIGNAL ww_numero_tecla : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \columnas_out[0]~output_o\ : std_logic;
SIGNAL \columnas_out[1]~output_o\ : std_logic;
SIGNAL \columnas_out[2]~output_o\ : std_logic;
SIGNAL \columnas_out[3]~output_o\ : std_logic;
SIGNAL \tecla_valida~output_o\ : std_logic;
SIGNAL \numero_tecla[0]~output_o\ : std_logic;
SIGNAL \numero_tecla[1]~output_o\ : std_logic;
SIGNAL \numero_tecla[2]~output_o\ : std_logic;
SIGNAL \numero_tecla[3]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \columna_actual[0]~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \contador_scan[0]~13_combout\ : std_logic;
SIGNAL \contador_scan[0]~14\ : std_logic;
SIGNAL \contador_scan[1]~15_combout\ : std_logic;
SIGNAL \contador_scan[1]~16\ : std_logic;
SIGNAL \contador_scan[2]~17_combout\ : std_logic;
SIGNAL \contador_scan[2]~18\ : std_logic;
SIGNAL \contador_scan[3]~19_combout\ : std_logic;
SIGNAL \contador_scan[3]~20\ : std_logic;
SIGNAL \contador_scan[4]~21_combout\ : std_logic;
SIGNAL \contador_scan[4]~22\ : std_logic;
SIGNAL \contador_scan[5]~23_combout\ : std_logic;
SIGNAL \contador_scan[5]~24\ : std_logic;
SIGNAL \contador_scan[6]~25_combout\ : std_logic;
SIGNAL \contador_scan[6]~26\ : std_logic;
SIGNAL \contador_scan[7]~27_combout\ : std_logic;
SIGNAL \contador_scan[7]~28\ : std_logic;
SIGNAL \contador_scan[8]~29_combout\ : std_logic;
SIGNAL \contador_scan[8]~30\ : std_logic;
SIGNAL \contador_scan[9]~31_combout\ : std_logic;
SIGNAL \contador_scan[9]~32\ : std_logic;
SIGNAL \contador_scan[10]~33_combout\ : std_logic;
SIGNAL \contador_scan[10]~34\ : std_logic;
SIGNAL \contador_scan[11]~35_combout\ : std_logic;
SIGNAL \contador_scan[11]~36\ : std_logic;
SIGNAL \contador_scan[12]~37_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \columnas_out[0]~reg0_q\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \columnas_out[1]~reg0_q\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \columnas_out[2]~reg0_q\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \columnas_out[3]~reg0_q\ : std_logic;
SIGNAL \filas_in[2]~input_o\ : std_logic;
SIGNAL \filas_in[3]~input_o\ : std_logic;
SIGNAL \filas_in[0]~input_o\ : std_logic;
SIGNAL \filas_in[1]~input_o\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Mux5~4_combout\ : std_logic;
SIGNAL \tecla_actual~1_combout\ : std_logic;
SIGNAL \Mux5~5_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux4~1_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Mux6~2_combout\ : std_logic;
SIGNAL \tecla_actual~0_combout\ : std_logic;
SIGNAL \Mux6~3_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \Equal5~0_combout\ : std_logic;
SIGNAL \debounce_count[0]~16_combout\ : std_logic;
SIGNAL \tecla_anterior[2]~feeder_combout\ : std_logic;
SIGNAL \Equal4~1_combout\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \Equal4~2_combout\ : std_logic;
SIGNAL \debounce_count[13]~44_combout\ : std_logic;
SIGNAL \debounce_count[0]~17\ : std_logic;
SIGNAL \debounce_count[1]~18_combout\ : std_logic;
SIGNAL \debounce_count[1]~19\ : std_logic;
SIGNAL \debounce_count[2]~20_combout\ : std_logic;
SIGNAL \debounce_count[2]~21\ : std_logic;
SIGNAL \debounce_count[3]~22_combout\ : std_logic;
SIGNAL \debounce_count[3]~23\ : std_logic;
SIGNAL \debounce_count[4]~24_combout\ : std_logic;
SIGNAL \debounce_count[4]~25\ : std_logic;
SIGNAL \debounce_count[5]~26_combout\ : std_logic;
SIGNAL \debounce_count[5]~27\ : std_logic;
SIGNAL \debounce_count[6]~28_combout\ : std_logic;
SIGNAL \debounce_count[6]~29\ : std_logic;
SIGNAL \debounce_count[7]~30_combout\ : std_logic;
SIGNAL \debounce_count[7]~31\ : std_logic;
SIGNAL \debounce_count[8]~32_combout\ : std_logic;
SIGNAL \debounce_count[8]~33\ : std_logic;
SIGNAL \debounce_count[9]~34_combout\ : std_logic;
SIGNAL \debounce_count[9]~35\ : std_logic;
SIGNAL \debounce_count[10]~36_combout\ : std_logic;
SIGNAL \debounce_count[10]~37\ : std_logic;
SIGNAL \debounce_count[11]~38_combout\ : std_logic;
SIGNAL \debounce_count[11]~39\ : std_logic;
SIGNAL \debounce_count[12]~40_combout\ : std_logic;
SIGNAL \debounce_count[12]~41\ : std_logic;
SIGNAL \debounce_count[13]~42_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \tecla_valida~0_combout\ : std_logic;
SIGNAL \tecla_valida~1_combout\ : std_logic;
SIGNAL \numero_tecla[0]~0_combout\ : std_logic;
SIGNAL \tecla_valida~reg0_q\ : std_logic;
SIGNAL \numero_tecla[0]~1_combout\ : std_logic;
SIGNAL \numero_tecla[0]~reg0_q\ : std_logic;
SIGNAL \numero_tecla[1]~reg0feeder_combout\ : std_logic;
SIGNAL \numero_tecla[1]~reg0_q\ : std_logic;
SIGNAL \numero_tecla[2]~reg0feeder_combout\ : std_logic;
SIGNAL \numero_tecla[2]~reg0_q\ : std_logic;
SIGNAL \numero_tecla[3]~reg0feeder_combout\ : std_logic;
SIGNAL \numero_tecla[3]~reg0_q\ : std_logic;
SIGNAL tecla_anterior : std_logic_vector(3 DOWNTO 0);
SIGNAL tecla_actual : std_logic_vector(3 DOWNTO 0);
SIGNAL debounce_count : std_logic_vector(13 DOWNTO 0);
SIGNAL contador_scan : std_logic_vector(12 DOWNTO 0);
SIGNAL columna_actual : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_columnas_out[3]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_columnas_out[2]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_columnas_out[1]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_Equal4~2_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~2_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_filas_in <= filas_in;
columnas_out <= ww_columnas_out;
tecla_valida <= ww_tecla_valida;
numero_tecla <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_numero_tecla));
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);
\ALT_INV_columnas_out[3]~reg0_q\ <= NOT \columnas_out[3]~reg0_q\;
\ALT_INV_columnas_out[2]~reg0_q\ <= NOT \columnas_out[2]~reg0_q\;
\ALT_INV_columnas_out[1]~reg0_q\ <= NOT \columnas_out[1]~reg0_q\;
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_Equal4~2_combout\ <= NOT \Equal4~2_combout\;
\ALT_INV_LessThan0~2_combout\ <= NOT \LessThan0~2_combout\;

-- Location: IOOBUF_X30_Y29_N30
\columnas_out[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \columnas_out[0]~reg0_q\,
	devoe => ww_devoe,
	o => \columnas_out[0]~output_o\);

-- Location: IOOBUF_X30_Y29_N23
\columnas_out[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_columnas_out[1]~reg0_q\,
	devoe => ww_devoe,
	o => \columnas_out[1]~output_o\);

-- Location: IOOBUF_X32_Y29_N23
\columnas_out[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_columnas_out[2]~reg0_q\,
	devoe => ww_devoe,
	o => \columnas_out[2]~output_o\);

-- Location: IOOBUF_X35_Y29_N23
\columnas_out[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_columnas_out[3]~reg0_q\,
	devoe => ww_devoe,
	o => \columnas_out[3]~output_o\);

-- Location: IOOBUF_X30_Y29_N9
\tecla_valida~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tecla_valida~reg0_q\,
	devoe => ww_devoe,
	o => \tecla_valida~output_o\);

-- Location: IOOBUF_X30_Y29_N2
\numero_tecla[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \numero_tecla[0]~reg0_q\,
	devoe => ww_devoe,
	o => \numero_tecla[0]~output_o\);

-- Location: IOOBUF_X28_Y29_N9
\numero_tecla[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \numero_tecla[1]~reg0_q\,
	devoe => ww_devoe,
	o => \numero_tecla[1]~output_o\);

-- Location: IOOBUF_X30_Y29_N16
\numero_tecla[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \numero_tecla[2]~reg0_q\,
	devoe => ww_devoe,
	o => \numero_tecla[2]~output_o\);

-- Location: IOOBUF_X41_Y23_N16
\numero_tecla[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \numero_tecla[3]~reg0_q\,
	devoe => ww_devoe,
	o => \numero_tecla[3]~output_o\);

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

-- Location: LCCOMB_X32_Y25_N18
\columna_actual[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \columna_actual[0]~0_combout\ = !columna_actual(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => columna_actual(0),
	combout => \columna_actual[0]~0_combout\);

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

-- Location: LCCOMB_X32_Y23_N4
\contador_scan[0]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_scan[0]~13_combout\ = contador_scan(0) $ (VCC)
-- \contador_scan[0]~14\ = CARRY(contador_scan(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => contador_scan(0),
	datad => VCC,
	combout => \contador_scan[0]~13_combout\,
	cout => \contador_scan[0]~14\);

-- Location: FF_X32_Y23_N5
\contador_scan[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_scan[0]~13_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_scan(0));

-- Location: LCCOMB_X32_Y23_N6
\contador_scan[1]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_scan[1]~15_combout\ = (contador_scan(1) & (!\contador_scan[0]~14\)) # (!contador_scan(1) & ((\contador_scan[0]~14\) # (GND)))
-- \contador_scan[1]~16\ = CARRY((!\contador_scan[0]~14\) # (!contador_scan(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_scan(1),
	datad => VCC,
	cin => \contador_scan[0]~14\,
	combout => \contador_scan[1]~15_combout\,
	cout => \contador_scan[1]~16\);

-- Location: FF_X32_Y23_N7
\contador_scan[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_scan[1]~15_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_scan(1));

-- Location: LCCOMB_X32_Y23_N8
\contador_scan[2]~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_scan[2]~17_combout\ = (contador_scan(2) & (\contador_scan[1]~16\ $ (GND))) # (!contador_scan(2) & (!\contador_scan[1]~16\ & VCC))
-- \contador_scan[2]~18\ = CARRY((contador_scan(2) & !\contador_scan[1]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_scan(2),
	datad => VCC,
	cin => \contador_scan[1]~16\,
	combout => \contador_scan[2]~17_combout\,
	cout => \contador_scan[2]~18\);

-- Location: FF_X32_Y23_N9
\contador_scan[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_scan[2]~17_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_scan(2));

-- Location: LCCOMB_X32_Y23_N10
\contador_scan[3]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_scan[3]~19_combout\ = (contador_scan(3) & (!\contador_scan[2]~18\)) # (!contador_scan(3) & ((\contador_scan[2]~18\) # (GND)))
-- \contador_scan[3]~20\ = CARRY((!\contador_scan[2]~18\) # (!contador_scan(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_scan(3),
	datad => VCC,
	cin => \contador_scan[2]~18\,
	combout => \contador_scan[3]~19_combout\,
	cout => \contador_scan[3]~20\);

-- Location: FF_X32_Y23_N11
\contador_scan[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_scan[3]~19_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_scan(3));

-- Location: LCCOMB_X32_Y23_N12
\contador_scan[4]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_scan[4]~21_combout\ = (contador_scan(4) & (\contador_scan[3]~20\ $ (GND))) # (!contador_scan(4) & (!\contador_scan[3]~20\ & VCC))
-- \contador_scan[4]~22\ = CARRY((contador_scan(4) & !\contador_scan[3]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_scan(4),
	datad => VCC,
	cin => \contador_scan[3]~20\,
	combout => \contador_scan[4]~21_combout\,
	cout => \contador_scan[4]~22\);

-- Location: FF_X32_Y23_N13
\contador_scan[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_scan[4]~21_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_scan(4));

-- Location: LCCOMB_X32_Y23_N14
\contador_scan[5]~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_scan[5]~23_combout\ = (contador_scan(5) & (!\contador_scan[4]~22\)) # (!contador_scan(5) & ((\contador_scan[4]~22\) # (GND)))
-- \contador_scan[5]~24\ = CARRY((!\contador_scan[4]~22\) # (!contador_scan(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_scan(5),
	datad => VCC,
	cin => \contador_scan[4]~22\,
	combout => \contador_scan[5]~23_combout\,
	cout => \contador_scan[5]~24\);

-- Location: FF_X32_Y23_N15
\contador_scan[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_scan[5]~23_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_scan(5));

-- Location: LCCOMB_X32_Y23_N16
\contador_scan[6]~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_scan[6]~25_combout\ = (contador_scan(6) & (\contador_scan[5]~24\ $ (GND))) # (!contador_scan(6) & (!\contador_scan[5]~24\ & VCC))
-- \contador_scan[6]~26\ = CARRY((contador_scan(6) & !\contador_scan[5]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_scan(6),
	datad => VCC,
	cin => \contador_scan[5]~24\,
	combout => \contador_scan[6]~25_combout\,
	cout => \contador_scan[6]~26\);

-- Location: FF_X32_Y23_N17
\contador_scan[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_scan[6]~25_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_scan(6));

-- Location: LCCOMB_X32_Y23_N18
\contador_scan[7]~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_scan[7]~27_combout\ = (contador_scan(7) & (!\contador_scan[6]~26\)) # (!contador_scan(7) & ((\contador_scan[6]~26\) # (GND)))
-- \contador_scan[7]~28\ = CARRY((!\contador_scan[6]~26\) # (!contador_scan(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_scan(7),
	datad => VCC,
	cin => \contador_scan[6]~26\,
	combout => \contador_scan[7]~27_combout\,
	cout => \contador_scan[7]~28\);

-- Location: FF_X32_Y23_N19
\contador_scan[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_scan[7]~27_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_scan(7));

-- Location: LCCOMB_X32_Y23_N20
\contador_scan[8]~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_scan[8]~29_combout\ = (contador_scan(8) & (\contador_scan[7]~28\ $ (GND))) # (!contador_scan(8) & (!\contador_scan[7]~28\ & VCC))
-- \contador_scan[8]~30\ = CARRY((contador_scan(8) & !\contador_scan[7]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_scan(8),
	datad => VCC,
	cin => \contador_scan[7]~28\,
	combout => \contador_scan[8]~29_combout\,
	cout => \contador_scan[8]~30\);

-- Location: FF_X32_Y23_N21
\contador_scan[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_scan[8]~29_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_scan(8));

-- Location: LCCOMB_X32_Y23_N22
\contador_scan[9]~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_scan[9]~31_combout\ = (contador_scan(9) & (!\contador_scan[8]~30\)) # (!contador_scan(9) & ((\contador_scan[8]~30\) # (GND)))
-- \contador_scan[9]~32\ = CARRY((!\contador_scan[8]~30\) # (!contador_scan(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_scan(9),
	datad => VCC,
	cin => \contador_scan[8]~30\,
	combout => \contador_scan[9]~31_combout\,
	cout => \contador_scan[9]~32\);

-- Location: FF_X32_Y23_N23
\contador_scan[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_scan[9]~31_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_scan(9));

-- Location: LCCOMB_X32_Y23_N24
\contador_scan[10]~33\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_scan[10]~33_combout\ = (contador_scan(10) & (\contador_scan[9]~32\ $ (GND))) # (!contador_scan(10) & (!\contador_scan[9]~32\ & VCC))
-- \contador_scan[10]~34\ = CARRY((contador_scan(10) & !\contador_scan[9]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => contador_scan(10),
	datad => VCC,
	cin => \contador_scan[9]~32\,
	combout => \contador_scan[10]~33_combout\,
	cout => \contador_scan[10]~34\);

-- Location: FF_X32_Y23_N25
\contador_scan[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_scan[10]~33_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_scan(10));

-- Location: LCCOMB_X32_Y23_N26
\contador_scan[11]~35\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_scan[11]~35_combout\ = (contador_scan(11) & (!\contador_scan[10]~34\)) # (!contador_scan(11) & ((\contador_scan[10]~34\) # (GND)))
-- \contador_scan[11]~36\ = CARRY((!\contador_scan[10]~34\) # (!contador_scan(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => contador_scan(11),
	datad => VCC,
	cin => \contador_scan[10]~34\,
	combout => \contador_scan[11]~35_combout\,
	cout => \contador_scan[11]~36\);

-- Location: FF_X32_Y23_N27
\contador_scan[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_scan[11]~35_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_scan(11));

-- Location: LCCOMB_X32_Y23_N28
\contador_scan[12]~37\ : cycloneiii_lcell_comb
-- Equation(s):
-- \contador_scan[12]~37_combout\ = \contador_scan[11]~36\ $ (!contador_scan(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => contador_scan(12),
	cin => \contador_scan[11]~36\,
	combout => \contador_scan[12]~37_combout\);

-- Location: FF_X32_Y23_N29
\contador_scan[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \contador_scan[12]~37_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => contador_scan(12));

-- Location: LCCOMB_X32_Y23_N0
\LessThan0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!contador_scan(4) & (!contador_scan(5) & (!contador_scan(3) & !contador_scan(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_scan(4),
	datab => contador_scan(5),
	datac => contador_scan(3),
	datad => contador_scan(6),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X32_Y23_N2
\LessThan0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (contador_scan(9) & (contador_scan(7) & (contador_scan(8) & !\LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_scan(9),
	datab => contador_scan(7),
	datac => contador_scan(8),
	datad => \LessThan0~0_combout\,
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X32_Y23_N30
\LessThan0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = ((!contador_scan(10) & (!contador_scan(11) & !\LessThan0~1_combout\))) # (!contador_scan(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => contador_scan(12),
	datab => contador_scan(10),
	datac => contador_scan(11),
	datad => \LessThan0~1_combout\,
	combout => \LessThan0~2_combout\);

-- Location: FF_X32_Y25_N19
\columna_actual[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \columna_actual[0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => columna_actual(0));

-- Location: LCCOMB_X32_Y25_N24
\Add2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = columna_actual(1) $ (columna_actual(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => columna_actual(1),
	datad => columna_actual(0),
	combout => \Add2~0_combout\);

-- Location: FF_X32_Y25_N17
\columna_actual[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Add2~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => columna_actual(1));

-- Location: LCCOMB_X31_Y25_N0
\Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (columna_actual(1)) # (columna_actual(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => columna_actual(1),
	datad => columna_actual(0),
	combout => \Mux3~0_combout\);

-- Location: FF_X31_Y25_N1
\columnas_out[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux3~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \columnas_out[0]~reg0_q\);

-- Location: LCCOMB_X31_Y25_N26
\Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (!columna_actual(1) & columna_actual(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => columna_actual(1),
	datad => columna_actual(0),
	combout => \Mux2~0_combout\);

-- Location: FF_X31_Y25_N27
\columnas_out[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux2~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \columnas_out[1]~reg0_q\);

-- Location: LCCOMB_X32_Y25_N0
\Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (columna_actual(1) & !columna_actual(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => columna_actual(1),
	datad => columna_actual(0),
	combout => \Mux1~0_combout\);

-- Location: FF_X32_Y25_N1
\columnas_out[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux1~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \columnas_out[2]~reg0_q\);

-- Location: LCCOMB_X32_Y25_N6
\Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (columna_actual(1) & columna_actual(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => columna_actual(1),
	datad => columna_actual(0),
	combout => \Mux0~0_combout\);

-- Location: FF_X32_Y25_N7
\columnas_out[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux0~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \columnas_out[3]~reg0_q\);

-- Location: IOIBUF_X32_Y29_N15
\filas_in[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_filas_in(2),
	o => \filas_in[2]~input_o\);

-- Location: IOIBUF_X32_Y29_N8
\filas_in[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_filas_in(3),
	o => \filas_in[3]~input_o\);

-- Location: IOIBUF_X32_Y29_N1
\filas_in[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_filas_in(0),
	o => \filas_in[0]~input_o\);

-- Location: IOIBUF_X32_Y29_N29
\filas_in[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_filas_in(1),
	o => \filas_in[1]~input_o\);

-- Location: LCCOMB_X32_Y25_N30
\Equal2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (!\filas_in[2]~input_o\ & (\filas_in[3]~input_o\ & (\filas_in[0]~input_o\ & \filas_in[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \filas_in[2]~input_o\,
	datab => \filas_in[3]~input_o\,
	datac => \filas_in[0]~input_o\,
	datad => \filas_in[1]~input_o\,
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X32_Y25_N20
\Equal1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (\filas_in[2]~input_o\ & (\filas_in[3]~input_o\ & (\filas_in[0]~input_o\ & !\filas_in[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \filas_in[2]~input_o\,
	datab => \filas_in[3]~input_o\,
	datac => \filas_in[0]~input_o\,
	datad => \filas_in[1]~input_o\,
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X31_Y25_N30
\Mux5~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux5~4_combout\ = (columna_actual(1) & (((\Equal1~0_combout\ & !columna_actual(0))))) # (!columna_actual(1) & ((\Equal1~0_combout\) # ((\Equal2~0_combout\ & !columna_actual(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datab => columna_actual(1),
	datac => \Equal1~0_combout\,
	datad => columna_actual(0),
	combout => \Mux5~4_combout\);

-- Location: LCCOMB_X32_Y25_N28
\tecla_actual~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \tecla_actual~1_combout\ = (\filas_in[2]~input_o\ & ((\filas_in[3]~input_o\ & (\filas_in[0]~input_o\ $ (\filas_in[1]~input_o\))) # (!\filas_in[3]~input_o\ & (\filas_in[0]~input_o\ & \filas_in[1]~input_o\)))) # (!\filas_in[2]~input_o\ & 
-- (\filas_in[3]~input_o\ & (\filas_in[0]~input_o\ & \filas_in[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \filas_in[2]~input_o\,
	datab => \filas_in[3]~input_o\,
	datac => \filas_in[0]~input_o\,
	datad => \filas_in[1]~input_o\,
	combout => \tecla_actual~1_combout\);

-- Location: LCCOMB_X31_Y25_N28
\Mux5~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux5~5_combout\ = (\Mux5~4_combout\) # ((\tecla_actual~1_combout\ & (columna_actual(1) & columna_actual(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux5~4_combout\,
	datab => \tecla_actual~1_combout\,
	datac => columna_actual(1),
	datad => columna_actual(0),
	combout => \Mux5~5_combout\);

-- Location: FF_X31_Y25_N29
\tecla_actual[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux5~5_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tecla_actual(2));

-- Location: LCCOMB_X32_Y25_N14
\Equal3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (\filas_in[2]~input_o\ & (!\filas_in[3]~input_o\ & (\filas_in[0]~input_o\ & \filas_in[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \filas_in[2]~input_o\,
	datab => \filas_in[3]~input_o\,
	datac => \filas_in[0]~input_o\,
	datad => \filas_in[1]~input_o\,
	combout => \Equal3~0_combout\);

-- Location: LCCOMB_X31_Y25_N24
\Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (columna_actual(0) & (((columna_actual(1))))) # (!columna_actual(0) & ((\Equal3~0_combout\) # ((\Equal2~0_combout\ & columna_actual(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datab => columna_actual(1),
	datac => \Equal3~0_combout\,
	datad => columna_actual(0),
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X31_Y25_N2
\Mux4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux4~1_combout\ = (\Mux4~0_combout\ & ((\tecla_actual~1_combout\) # ((!columna_actual(0))))) # (!\Mux4~0_combout\ & (((\Equal2~0_combout\ & columna_actual(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4~0_combout\,
	datab => \tecla_actual~1_combout\,
	datac => \Equal2~0_combout\,
	datad => columna_actual(0),
	combout => \Mux4~1_combout\);

-- Location: FF_X31_Y25_N3
\tecla_actual[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux4~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tecla_actual(3));

-- Location: LCCOMB_X32_Y25_N10
\Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\filas_in[2]~input_o\ & (\filas_in[3]~input_o\ & (!\filas_in[0]~input_o\ & \filas_in[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \filas_in[2]~input_o\,
	datab => \filas_in[3]~input_o\,
	datac => \filas_in[0]~input_o\,
	datad => \filas_in[1]~input_o\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X32_Y25_N8
\Mux6~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux6~2_combout\ = (\Add2~0_combout\ & (((\Equal0~0_combout\)))) # (!\Add2~0_combout\ & ((\Equal3~0_combout\) # ((\Equal2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~0_combout\,
	datab => \Equal2~0_combout\,
	datac => \Add2~0_combout\,
	datad => \Equal0~0_combout\,
	combout => \Mux6~2_combout\);

-- Location: LCCOMB_X32_Y25_N22
\tecla_actual~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \tecla_actual~0_combout\ = (\filas_in[2]~input_o\ & (\filas_in[0]~input_o\ & (\filas_in[3]~input_o\ $ (\filas_in[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \filas_in[2]~input_o\,
	datab => \filas_in[3]~input_o\,
	datac => \filas_in[0]~input_o\,
	datad => \filas_in[1]~input_o\,
	combout => \tecla_actual~0_combout\);

-- Location: LCCOMB_X32_Y25_N12
\Mux6~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux6~3_combout\ = (\Mux6~2_combout\) # ((columna_actual(1) & (!columna_actual(0) & \tecla_actual~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => columna_actual(1),
	datab => columna_actual(0),
	datac => \Mux6~2_combout\,
	datad => \tecla_actual~0_combout\,
	combout => \Mux6~3_combout\);

-- Location: FF_X32_Y25_N13
\tecla_actual[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux6~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tecla_actual(1));

-- Location: LCCOMB_X32_Y25_N26
\Mux7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\filas_in[3]~input_o\ & (\filas_in[2]~input_o\ $ ((\filas_in[0]~input_o\)))) # (!\filas_in[3]~input_o\ & (\filas_in[2]~input_o\ & (\filas_in[0]~input_o\ & columna_actual(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \filas_in[2]~input_o\,
	datab => \filas_in[0]~input_o\,
	datac => \filas_in[3]~input_o\,
	datad => columna_actual(1),
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X32_Y25_N16
\Mux7~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (columna_actual(1) & (\tecla_actual~0_combout\)) # (!columna_actual(1) & ((\Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tecla_actual~0_combout\,
	datac => columna_actual(1),
	datad => \Equal1~0_combout\,
	combout => \Mux7~1_combout\);

-- Location: LCCOMB_X32_Y25_N2
\Mux7~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = (columna_actual(0) & (((\Mux7~1_combout\)))) # (!columna_actual(0) & (\filas_in[1]~input_o\ & (\Mux7~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \filas_in[1]~input_o\,
	datab => columna_actual(0),
	datac => \Mux7~0_combout\,
	datad => \Mux7~1_combout\,
	combout => \Mux7~2_combout\);

-- Location: FF_X32_Y25_N3
\tecla_actual[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux7~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tecla_actual(0));

-- Location: LCCOMB_X31_Y25_N18
\Equal5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal5~0_combout\ = (tecla_actual(2)) # ((tecla_actual(3)) # ((tecla_actual(1)) # (tecla_actual(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tecla_actual(2),
	datab => tecla_actual(3),
	datac => tecla_actual(1),
	datad => tecla_actual(0),
	combout => \Equal5~0_combout\);

-- Location: LCCOMB_X30_Y23_N2
\debounce_count[0]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[0]~16_combout\ = debounce_count(0) $ (VCC)
-- \debounce_count[0]~17\ = CARRY(debounce_count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(0),
	datad => VCC,
	combout => \debounce_count[0]~16_combout\,
	cout => \debounce_count[0]~17\);

-- Location: LCCOMB_X31_Y25_N10
\tecla_anterior[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \tecla_anterior[2]~feeder_combout\ = tecla_actual(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => tecla_actual(2),
	combout => \tecla_anterior[2]~feeder_combout\);

-- Location: FF_X31_Y25_N11
\tecla_anterior[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tecla_anterior[2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tecla_anterior(2));

-- Location: FF_X31_Y25_N9
\tecla_anterior[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => tecla_actual(3),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tecla_anterior(3));

-- Location: LCCOMB_X31_Y25_N8
\Equal4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal4~1_combout\ = (tecla_anterior(2) & (tecla_actual(2) & (tecla_actual(3) $ (!tecla_anterior(3))))) # (!tecla_anterior(2) & (!tecla_actual(2) & (tecla_actual(3) $ (!tecla_anterior(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tecla_anterior(2),
	datab => tecla_actual(3),
	datac => tecla_anterior(3),
	datad => tecla_actual(2),
	combout => \Equal4~1_combout\);

-- Location: FF_X32_Y25_N5
\tecla_anterior[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => tecla_actual(1),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tecla_anterior(1));

-- Location: FF_X32_Y25_N25
\tecla_anterior[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => tecla_actual(0),
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tecla_anterior(0));

-- Location: LCCOMB_X32_Y25_N4
\Equal4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (tecla_actual(1) & (tecla_anterior(1) & (tecla_actual(0) $ (!tecla_anterior(0))))) # (!tecla_actual(1) & (!tecla_anterior(1) & (tecla_actual(0) $ (!tecla_anterior(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => tecla_actual(1),
	datab => tecla_actual(0),
	datac => tecla_anterior(1),
	datad => tecla_anterior(0),
	combout => \Equal4~0_combout\);

-- Location: LCCOMB_X31_Y25_N4
\Equal4~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal4~2_combout\ = (\Equal4~1_combout\ & \Equal4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal4~1_combout\,
	datad => \Equal4~0_combout\,
	combout => \Equal4~2_combout\);

-- Location: LCCOMB_X30_Y23_N30
\debounce_count[13]~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[13]~44_combout\ = (!\LessThan0~2_combout\ & (((!\tecla_valida~1_combout\) # (!\Equal4~1_combout\)) # (!\Equal4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal4~0_combout\,
	datab => \Equal4~1_combout\,
	datac => \LessThan0~2_combout\,
	datad => \tecla_valida~1_combout\,
	combout => \debounce_count[13]~44_combout\);

-- Location: FF_X30_Y23_N3
\debounce_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[0]~16_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(0));

-- Location: LCCOMB_X30_Y23_N4
\debounce_count[1]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[1]~18_combout\ = (debounce_count(1) & (!\debounce_count[0]~17\)) # (!debounce_count(1) & ((\debounce_count[0]~17\) # (GND)))
-- \debounce_count[1]~19\ = CARRY((!\debounce_count[0]~17\) # (!debounce_count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(1),
	datad => VCC,
	cin => \debounce_count[0]~17\,
	combout => \debounce_count[1]~18_combout\,
	cout => \debounce_count[1]~19\);

-- Location: FF_X30_Y23_N5
\debounce_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[1]~18_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(1));

-- Location: LCCOMB_X30_Y23_N6
\debounce_count[2]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[2]~20_combout\ = (debounce_count(2) & (\debounce_count[1]~19\ $ (GND))) # (!debounce_count(2) & (!\debounce_count[1]~19\ & VCC))
-- \debounce_count[2]~21\ = CARRY((debounce_count(2) & !\debounce_count[1]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(2),
	datad => VCC,
	cin => \debounce_count[1]~19\,
	combout => \debounce_count[2]~20_combout\,
	cout => \debounce_count[2]~21\);

-- Location: FF_X30_Y23_N7
\debounce_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[2]~20_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(2));

-- Location: LCCOMB_X30_Y23_N8
\debounce_count[3]~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[3]~22_combout\ = (debounce_count(3) & (!\debounce_count[2]~21\)) # (!debounce_count(3) & ((\debounce_count[2]~21\) # (GND)))
-- \debounce_count[3]~23\ = CARRY((!\debounce_count[2]~21\) # (!debounce_count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(3),
	datad => VCC,
	cin => \debounce_count[2]~21\,
	combout => \debounce_count[3]~22_combout\,
	cout => \debounce_count[3]~23\);

-- Location: FF_X30_Y23_N9
\debounce_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[3]~22_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(3));

-- Location: LCCOMB_X30_Y23_N10
\debounce_count[4]~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[4]~24_combout\ = (debounce_count(4) & (\debounce_count[3]~23\ $ (GND))) # (!debounce_count(4) & (!\debounce_count[3]~23\ & VCC))
-- \debounce_count[4]~25\ = CARRY((debounce_count(4) & !\debounce_count[3]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(4),
	datad => VCC,
	cin => \debounce_count[3]~23\,
	combout => \debounce_count[4]~24_combout\,
	cout => \debounce_count[4]~25\);

-- Location: FF_X30_Y23_N11
\debounce_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[4]~24_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(4));

-- Location: LCCOMB_X30_Y23_N12
\debounce_count[5]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[5]~26_combout\ = (debounce_count(5) & (!\debounce_count[4]~25\)) # (!debounce_count(5) & ((\debounce_count[4]~25\) # (GND)))
-- \debounce_count[5]~27\ = CARRY((!\debounce_count[4]~25\) # (!debounce_count(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(5),
	datad => VCC,
	cin => \debounce_count[4]~25\,
	combout => \debounce_count[5]~26_combout\,
	cout => \debounce_count[5]~27\);

-- Location: FF_X30_Y23_N13
\debounce_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[5]~26_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(5));

-- Location: LCCOMB_X30_Y23_N14
\debounce_count[6]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[6]~28_combout\ = (debounce_count(6) & (\debounce_count[5]~27\ $ (GND))) # (!debounce_count(6) & (!\debounce_count[5]~27\ & VCC))
-- \debounce_count[6]~29\ = CARRY((debounce_count(6) & !\debounce_count[5]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(6),
	datad => VCC,
	cin => \debounce_count[5]~27\,
	combout => \debounce_count[6]~28_combout\,
	cout => \debounce_count[6]~29\);

-- Location: FF_X30_Y23_N15
\debounce_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[6]~28_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(6));

-- Location: LCCOMB_X30_Y23_N16
\debounce_count[7]~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[7]~30_combout\ = (debounce_count(7) & (!\debounce_count[6]~29\)) # (!debounce_count(7) & ((\debounce_count[6]~29\) # (GND)))
-- \debounce_count[7]~31\ = CARRY((!\debounce_count[6]~29\) # (!debounce_count(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(7),
	datad => VCC,
	cin => \debounce_count[6]~29\,
	combout => \debounce_count[7]~30_combout\,
	cout => \debounce_count[7]~31\);

-- Location: FF_X30_Y23_N17
\debounce_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[7]~30_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(7));

-- Location: LCCOMB_X30_Y23_N18
\debounce_count[8]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[8]~32_combout\ = (debounce_count(8) & (\debounce_count[7]~31\ $ (GND))) # (!debounce_count(8) & (!\debounce_count[7]~31\ & VCC))
-- \debounce_count[8]~33\ = CARRY((debounce_count(8) & !\debounce_count[7]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(8),
	datad => VCC,
	cin => \debounce_count[7]~31\,
	combout => \debounce_count[8]~32_combout\,
	cout => \debounce_count[8]~33\);

-- Location: FF_X30_Y23_N19
\debounce_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[8]~32_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(8));

-- Location: LCCOMB_X30_Y23_N20
\debounce_count[9]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[9]~34_combout\ = (debounce_count(9) & (!\debounce_count[8]~33\)) # (!debounce_count(9) & ((\debounce_count[8]~33\) # (GND)))
-- \debounce_count[9]~35\ = CARRY((!\debounce_count[8]~33\) # (!debounce_count(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(9),
	datad => VCC,
	cin => \debounce_count[8]~33\,
	combout => \debounce_count[9]~34_combout\,
	cout => \debounce_count[9]~35\);

-- Location: FF_X30_Y23_N21
\debounce_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[9]~34_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(9));

-- Location: LCCOMB_X30_Y23_N22
\debounce_count[10]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[10]~36_combout\ = (debounce_count(10) & (\debounce_count[9]~35\ $ (GND))) # (!debounce_count(10) & (!\debounce_count[9]~35\ & VCC))
-- \debounce_count[10]~37\ = CARRY((debounce_count(10) & !\debounce_count[9]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(10),
	datad => VCC,
	cin => \debounce_count[9]~35\,
	combout => \debounce_count[10]~36_combout\,
	cout => \debounce_count[10]~37\);

-- Location: FF_X30_Y23_N23
\debounce_count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[10]~36_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(10));

-- Location: LCCOMB_X30_Y23_N24
\debounce_count[11]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[11]~38_combout\ = (debounce_count(11) & (!\debounce_count[10]~37\)) # (!debounce_count(11) & ((\debounce_count[10]~37\) # (GND)))
-- \debounce_count[11]~39\ = CARRY((!\debounce_count[10]~37\) # (!debounce_count(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_count(11),
	datad => VCC,
	cin => \debounce_count[10]~37\,
	combout => \debounce_count[11]~38_combout\,
	cout => \debounce_count[11]~39\);

-- Location: FF_X30_Y23_N25
\debounce_count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[11]~38_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(11));

-- Location: LCCOMB_X30_Y23_N26
\debounce_count[12]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[12]~40_combout\ = (debounce_count(12) & (\debounce_count[11]~39\ $ (GND))) # (!debounce_count(12) & (!\debounce_count[11]~39\ & VCC))
-- \debounce_count[12]~41\ = CARRY((debounce_count(12) & !\debounce_count[11]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(12),
	datad => VCC,
	cin => \debounce_count[11]~39\,
	combout => \debounce_count[12]~40_combout\,
	cout => \debounce_count[12]~41\);

-- Location: FF_X30_Y23_N27
\debounce_count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[12]~40_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(12));

-- Location: LCCOMB_X30_Y23_N28
\debounce_count[13]~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce_count[13]~42_combout\ = \debounce_count[12]~41\ $ (debounce_count(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => debounce_count(13),
	cin => \debounce_count[12]~41\,
	combout => \debounce_count[13]~42_combout\);

-- Location: FF_X30_Y23_N29
\debounce_count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debounce_count[13]~42_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sclr => \ALT_INV_Equal4~2_combout\,
	ena => \debounce_count[13]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_count(13));

-- Location: LCCOMB_X30_Y23_N0
\LessThan1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (!debounce_count(5) & (!debounce_count(7) & (!debounce_count(6) & !debounce_count(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(5),
	datab => debounce_count(7),
	datac => debounce_count(6),
	datad => debounce_count(4),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X31_Y23_N6
\tecla_valida~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \tecla_valida~0_combout\ = (debounce_count(9) & (debounce_count(10) & (!\LessThan1~0_combout\ & debounce_count(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(9),
	datab => debounce_count(10),
	datac => \LessThan1~0_combout\,
	datad => debounce_count(8),
	combout => \tecla_valida~0_combout\);

-- Location: LCCOMB_X31_Y23_N4
\tecla_valida~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \tecla_valida~1_combout\ = (debounce_count(13) & ((debounce_count(12)) # ((debounce_count(11)) # (\tecla_valida~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_count(12),
	datab => debounce_count(13),
	datac => debounce_count(11),
	datad => \tecla_valida~0_combout\,
	combout => \tecla_valida~1_combout\);

-- Location: LCCOMB_X31_Y23_N20
\numero_tecla[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \numero_tecla[0]~0_combout\ = (!\LessThan0~2_combout\ & (\Equal5~0_combout\ & (\tecla_valida~1_combout\ & \Equal4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~2_combout\,
	datab => \Equal5~0_combout\,
	datac => \tecla_valida~1_combout\,
	datad => \Equal4~2_combout\,
	combout => \numero_tecla[0]~0_combout\);

-- Location: FF_X31_Y23_N21
\tecla_valida~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \numero_tecla[0]~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tecla_valida~reg0_q\);

-- Location: LCCOMB_X31_Y23_N30
\numero_tecla[0]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \numero_tecla[0]~1_combout\ = (!\reset~input_o\ & \numero_tecla[0]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \numero_tecla[0]~0_combout\,
	combout => \numero_tecla[0]~1_combout\);

-- Location: FF_X31_Y23_N31
\numero_tecla[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => tecla_actual(0),
	sload => VCC,
	ena => \numero_tecla[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \numero_tecla[0]~reg0_q\);

-- Location: LCCOMB_X31_Y23_N8
\numero_tecla[1]~reg0feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \numero_tecla[1]~reg0feeder_combout\ = tecla_actual(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => tecla_actual(1),
	combout => \numero_tecla[1]~reg0feeder_combout\);

-- Location: FF_X31_Y23_N9
\numero_tecla[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \numero_tecla[1]~reg0feeder_combout\,
	ena => \numero_tecla[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \numero_tecla[1]~reg0_q\);

-- Location: LCCOMB_X31_Y23_N18
\numero_tecla[2]~reg0feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \numero_tecla[2]~reg0feeder_combout\ = tecla_actual(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => tecla_actual(2),
	combout => \numero_tecla[2]~reg0feeder_combout\);

-- Location: FF_X31_Y23_N19
\numero_tecla[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \numero_tecla[2]~reg0feeder_combout\,
	ena => \numero_tecla[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \numero_tecla[2]~reg0_q\);

-- Location: LCCOMB_X31_Y23_N28
\numero_tecla[3]~reg0feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \numero_tecla[3]~reg0feeder_combout\ = tecla_actual(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => tecla_actual(3),
	combout => \numero_tecla[3]~reg0feeder_combout\);

-- Location: FF_X31_Y23_N29
\numero_tecla[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \numero_tecla[3]~reg0feeder_combout\,
	ena => \numero_tecla[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \numero_tecla[3]~reg0_q\);

ww_columnas_out(0) <= \columnas_out[0]~output_o\;

ww_columnas_out(1) <= \columnas_out[1]~output_o\;

ww_columnas_out(2) <= \columnas_out[2]~output_o\;

ww_columnas_out(3) <= \columnas_out[3]~output_o\;

ww_tecla_valida <= \tecla_valida~output_o\;

ww_numero_tecla(0) <= \numero_tecla[0]~output_o\;

ww_numero_tecla(1) <= \numero_tecla[1]~output_o\;

ww_numero_tecla(2) <= \numero_tecla[2]~output_o\;

ww_numero_tecla(3) <= \numero_tecla[3]~output_o\;
END structure;


