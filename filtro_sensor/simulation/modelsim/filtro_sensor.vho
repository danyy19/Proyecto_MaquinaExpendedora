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

-- DATE "10/26/2025 12:28:25"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	filtro_sensor IS
    PORT (
	clk : IN std_logic;
	reset_n : IN std_logic;
	sensor_in : IN std_logic;
	tick : IN std_logic;
	pulse_out : OUT std_logic
	);
END filtro_sensor;

-- Design Ports Information
-- pulse_out	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tick	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_n	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sensor_in	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF filtro_sensor IS
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
SIGNAL ww_reset_n : std_logic;
SIGNAL ww_sensor_in : std_logic;
SIGNAL ww_tick : std_logic;
SIGNAL ww_pulse_out : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \pulse_out~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \tick~input_o\ : std_logic;
SIGNAL \sensor_in~input_o\ : std_logic;
SIGNAL \sync0~feeder_combout\ : std_logic;
SIGNAL \reset_n~input_o\ : std_logic;
SIGNAL \reset_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \sync0~q\ : std_logic;
SIGNAL \sync1~feeder_combout\ : std_logic;
SIGNAL \sync1~q\ : std_logic;
SIGNAL \stable_cnt~1_combout\ : std_logic;
SIGNAL \stable_cnt~0_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \sampled~q\ : std_logic;
SIGNAL \prev_state~feeder_combout\ : std_logic;
SIGNAL \prev_state~q\ : std_logic;
SIGNAL \pulse_i~0_combout\ : std_logic;
SIGNAL \pulse_i~q\ : std_logic;
SIGNAL stable_cnt : std_logic_vector(1 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_reset_n <= reset_n;
ww_sensor_in <= sensor_in;
ww_tick <= tick;
pulse_out <= ww_pulse_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\reset_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset_n~input_o\);

-- Location: IOOBUF_X0_Y26_N2
\pulse_out~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pulse_i~q\,
	devoe => ww_devoe,
	o => \pulse_out~output_o\);

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

-- Location: IOIBUF_X0_Y26_N22
\tick~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tick,
	o => \tick~input_o\);

-- Location: IOIBUF_X0_Y26_N15
\sensor_in~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sensor_in,
	o => \sensor_in~input_o\);

-- Location: LCCOMB_X1_Y26_N12
\sync0~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sync0~feeder_combout\ = \sensor_in~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sensor_in~input_o\,
	combout => \sync0~feeder_combout\);

-- Location: IOIBUF_X0_Y14_N8
\reset_n~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_n,
	o => \reset_n~input_o\);

-- Location: CLKCTRL_G2
\reset_n~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset_n~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset_n~inputclkctrl_outclk\);

-- Location: FF_X1_Y26_N13
sync0 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \sync0~feeder_combout\,
	clrn => \reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync0~q\);

-- Location: LCCOMB_X1_Y26_N6
\sync1~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sync1~feeder_combout\ = \sync0~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sync0~q\,
	combout => \sync1~feeder_combout\);

-- Location: FF_X1_Y26_N7
sync1 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \sync1~feeder_combout\,
	clrn => \reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync1~q\);

-- Location: LCCOMB_X1_Y26_N28
\stable_cnt~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \stable_cnt~1_combout\ = (\sync1~q\ & ((stable_cnt(1)) # (!stable_cnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stable_cnt(1),
	datac => stable_cnt(0),
	datad => \sync1~q\,
	combout => \stable_cnt~1_combout\);

-- Location: FF_X1_Y26_N29
\stable_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stable_cnt~1_combout\,
	clrn => \reset_n~inputclkctrl_outclk\,
	ena => \tick~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stable_cnt(0));

-- Location: LCCOMB_X1_Y26_N26
\stable_cnt~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \stable_cnt~0_combout\ = (\sync1~q\ & ((stable_cnt(0)) # (stable_cnt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => stable_cnt(0),
	datac => stable_cnt(1),
	datad => \sync1~q\,
	combout => \stable_cnt~0_combout\);

-- Location: FF_X1_Y26_N27
\stable_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stable_cnt~0_combout\,
	clrn => \reset_n~inputclkctrl_outclk\,
	ena => \tick~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stable_cnt(1));

-- Location: LCCOMB_X1_Y26_N18
\LessThan1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (stable_cnt(1) & stable_cnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => stable_cnt(1),
	datad => stable_cnt(0),
	combout => \LessThan1~0_combout\);

-- Location: FF_X1_Y26_N19
sampled : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \LessThan1~0_combout\,
	clrn => \reset_n~inputclkctrl_outclk\,
	ena => \tick~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sampled~q\);

-- Location: LCCOMB_X1_Y26_N8
\prev_state~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \prev_state~feeder_combout\ = \sampled~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sampled~q\,
	combout => \prev_state~feeder_combout\);

-- Location: FF_X1_Y26_N9
prev_state : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \prev_state~feeder_combout\,
	clrn => \reset_n~inputclkctrl_outclk\,
	ena => \tick~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \prev_state~q\);

-- Location: LCCOMB_X1_Y26_N16
\pulse_i~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pulse_i~0_combout\ = (\tick~input_o\ & (!\prev_state~q\ & \sampled~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tick~input_o\,
	datac => \prev_state~q\,
	datad => \sampled~q\,
	combout => \pulse_i~0_combout\);

-- Location: FF_X1_Y26_N17
pulse_i : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pulse_i~0_combout\,
	clrn => \reset_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse_i~q\);

ww_pulse_out <= \pulse_out~output_o\;
END structure;


