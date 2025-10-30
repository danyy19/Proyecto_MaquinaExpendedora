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

-- DATE "10/30/2025 03:55:13"

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

ENTITY 	servo_pwm IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	position : IN STD.STANDARD.integer range 0 TO 8;
	pwm : OUT std_logic
	);
END servo_pwm;

-- Design Ports Information
-- pwm	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[2]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[1]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[0]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[3]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF servo_pwm IS
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
SIGNAL ww_rst : std_logic;
SIGNAL ww_position : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_pwm : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \pwm~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \counter[0]~20_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \counter[19]~54_combout\ : std_logic;
SIGNAL \counter[19]~55_combout\ : std_logic;
SIGNAL \counter[17]~63\ : std_logic;
SIGNAL \counter[18]~64_combout\ : std_logic;
SIGNAL \counter[18]~65\ : std_logic;
SIGNAL \counter[19]~66_combout\ : std_logic;
SIGNAL \counter[19]~56_combout\ : std_logic;
SIGNAL \counter[19]~59_combout\ : std_logic;
SIGNAL \counter[19]~57_combout\ : std_logic;
SIGNAL \counter[19]~58_combout\ : std_logic;
SIGNAL \counter[19]~60_combout\ : std_logic;
SIGNAL \counter[19]~61_combout\ : std_logic;
SIGNAL \counter[0]~21\ : std_logic;
SIGNAL \counter[1]~22_combout\ : std_logic;
SIGNAL \counter[1]~23\ : std_logic;
SIGNAL \counter[2]~24_combout\ : std_logic;
SIGNAL \counter[2]~25\ : std_logic;
SIGNAL \counter[3]~26_combout\ : std_logic;
SIGNAL \counter[3]~27\ : std_logic;
SIGNAL \counter[4]~28_combout\ : std_logic;
SIGNAL \counter[4]~29\ : std_logic;
SIGNAL \counter[5]~30_combout\ : std_logic;
SIGNAL \counter[5]~31\ : std_logic;
SIGNAL \counter[6]~32_combout\ : std_logic;
SIGNAL \counter[6]~33\ : std_logic;
SIGNAL \counter[7]~34_combout\ : std_logic;
SIGNAL \counter[7]~35\ : std_logic;
SIGNAL \counter[8]~36_combout\ : std_logic;
SIGNAL \counter[8]~37\ : std_logic;
SIGNAL \counter[9]~38_combout\ : std_logic;
SIGNAL \counter[9]~39\ : std_logic;
SIGNAL \counter[10]~40_combout\ : std_logic;
SIGNAL \counter[10]~41\ : std_logic;
SIGNAL \counter[11]~42_combout\ : std_logic;
SIGNAL \counter[11]~43\ : std_logic;
SIGNAL \counter[12]~44_combout\ : std_logic;
SIGNAL \counter[12]~45\ : std_logic;
SIGNAL \counter[13]~46_combout\ : std_logic;
SIGNAL \counter[13]~47\ : std_logic;
SIGNAL \counter[14]~48_combout\ : std_logic;
SIGNAL \counter[14]~49\ : std_logic;
SIGNAL \counter[15]~50_combout\ : std_logic;
SIGNAL \counter[15]~51\ : std_logic;
SIGNAL \counter[16]~52_combout\ : std_logic;
SIGNAL \counter[16]~53\ : std_logic;
SIGNAL \counter[17]~62_combout\ : std_logic;
SIGNAL \position[1]~input_o\ : std_logic;
SIGNAL \position[2]~input_o\ : std_logic;
SIGNAL \position[3]~input_o\ : std_logic;
SIGNAL \position[0]~input_o\ : std_logic;
SIGNAL \duty_cycle~13_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][15]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][14]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][13]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][12]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][11]~0_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][10]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][9]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][8]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][7]~1_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][6]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][5]~2_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][4]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][8]~3_combout\ : std_logic;
SIGNAL \duty_cycle[3]~15\ : std_logic;
SIGNAL \duty_cycle[4]~17\ : std_logic;
SIGNAL \duty_cycle[5]~19\ : std_logic;
SIGNAL \duty_cycle[6]~21\ : std_logic;
SIGNAL \duty_cycle[7]~23\ : std_logic;
SIGNAL \duty_cycle[8]~25\ : std_logic;
SIGNAL \duty_cycle[9]~27\ : std_logic;
SIGNAL \duty_cycle[10]~29\ : std_logic;
SIGNAL \duty_cycle[11]~31\ : std_logic;
SIGNAL \duty_cycle[12]~33\ : std_logic;
SIGNAL \duty_cycle[13]~35\ : std_logic;
SIGNAL \duty_cycle[14]~37\ : std_logic;
SIGNAL \duty_cycle[15]~38_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \duty_cycle[14]~36_combout\ : std_logic;
SIGNAL \duty_cycle[13]~34_combout\ : std_logic;
SIGNAL \duty_cycle[13]~feeder_combout\ : std_logic;
SIGNAL \duty_cycle[12]~32_combout\ : std_logic;
SIGNAL \duty_cycle[11]~30_combout\ : std_logic;
SIGNAL \duty_cycle[11]~feeder_combout\ : std_logic;
SIGNAL \duty_cycle[10]~28_combout\ : std_logic;
SIGNAL \duty_cycle[10]~feeder_combout\ : std_logic;
SIGNAL \duty_cycle[9]~26_combout\ : std_logic;
SIGNAL \duty_cycle[9]~feeder_combout\ : std_logic;
SIGNAL \duty_cycle[8]~24_combout\ : std_logic;
SIGNAL \duty_cycle[8]~feeder_combout\ : std_logic;
SIGNAL \duty_cycle[7]~22_combout\ : std_logic;
SIGNAL \duty_cycle[6]~20_combout\ : std_logic;
SIGNAL \duty_cycle[5]~18_combout\ : std_logic;
SIGNAL \duty_cycle[4]~16_combout\ : std_logic;
SIGNAL \duty_cycle[3]~14_combout\ : std_logic;
SIGNAL \duty_cycle[3]~feeder_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][2]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][1]~4_combout\ : std_logic;
SIGNAL \duty_cycle~40_combout\ : std_logic;
SIGNAL \LessThan1~1_cout\ : std_logic;
SIGNAL \LessThan1~3_cout\ : std_logic;
SIGNAL \LessThan1~5_cout\ : std_logic;
SIGNAL \LessThan1~7_cout\ : std_logic;
SIGNAL \LessThan1~9_cout\ : std_logic;
SIGNAL \LessThan1~11_cout\ : std_logic;
SIGNAL \LessThan1~13_cout\ : std_logic;
SIGNAL \LessThan1~15_cout\ : std_logic;
SIGNAL \LessThan1~17_cout\ : std_logic;
SIGNAL \LessThan1~19_cout\ : std_logic;
SIGNAL \LessThan1~21_cout\ : std_logic;
SIGNAL \LessThan1~23_cout\ : std_logic;
SIGNAL \LessThan1~25_cout\ : std_logic;
SIGNAL \LessThan1~27_cout\ : std_logic;
SIGNAL \LessThan1~29_cout\ : std_logic;
SIGNAL \LessThan1~31_cout\ : std_logic;
SIGNAL \LessThan1~32_combout\ : std_logic;
SIGNAL \LessThan1~34_combout\ : std_logic;
SIGNAL \pwm~reg0_q\ : std_logic;
SIGNAL duty_cycle : std_logic_vector(16 DOWNTO 0);
SIGNAL counter : std_logic_vector(19 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_position <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(position, 4);
pwm <= ww_pwm;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X23_Y0_N30
\pwm~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pwm~reg0_q\,
	devoe => ww_devoe,
	o => \pwm~output_o\);

-- Location: IOIBUF_X41_Y15_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G9
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

-- Location: LCCOMB_X6_Y26_N12
\counter[0]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[0]~20_combout\ = counter(0) $ (VCC)
-- \counter[0]~21\ = CARRY(counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datad => VCC,
	combout => \counter[0]~20_combout\,
	cout => \counter[0]~21\);

-- Location: IOIBUF_X0_Y24_N1
\rst~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: LCCOMB_X6_Y25_N20
\counter[19]~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[19]~54_combout\ = (!counter(13) & (!counter(10) & (!counter(12) & !counter(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(13),
	datab => counter(10),
	datac => counter(12),
	datad => counter(11),
	combout => \counter[19]~54_combout\);

-- Location: LCCOMB_X6_Y25_N26
\counter[19]~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[19]~55_combout\ = (!counter(15) & (((!counter(9) & \counter[19]~54_combout\)) # (!counter(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(15),
	datab => counter(9),
	datac => counter(14),
	datad => \counter[19]~54_combout\,
	combout => \counter[19]~55_combout\);

-- Location: LCCOMB_X6_Y25_N14
\counter[17]~62\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[17]~62_combout\ = (counter(17) & (!\counter[16]~53\)) # (!counter(17) & ((\counter[16]~53\) # (GND)))
-- \counter[17]~63\ = CARRY((!\counter[16]~53\) # (!counter(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(17),
	datad => VCC,
	cin => \counter[16]~53\,
	combout => \counter[17]~62_combout\,
	cout => \counter[17]~63\);

-- Location: LCCOMB_X6_Y25_N16
\counter[18]~64\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[18]~64_combout\ = (counter(18) & (\counter[17]~63\ $ (GND))) # (!counter(18) & (!\counter[17]~63\ & VCC))
-- \counter[18]~65\ = CARRY((counter(18) & !\counter[17]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(18),
	datad => VCC,
	cin => \counter[17]~63\,
	combout => \counter[18]~64_combout\,
	cout => \counter[18]~65\);

-- Location: FF_X6_Y25_N17
\counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[18]~64_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(18));

-- Location: LCCOMB_X6_Y25_N18
\counter[19]~66\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[19]~66_combout\ = counter(19) $ (\counter[18]~65\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(19),
	cin => \counter[18]~65\,
	combout => \counter[19]~66_combout\);

-- Location: FF_X6_Y25_N19
\counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[19]~66_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(19));

-- Location: LCCOMB_X6_Y25_N28
\counter[19]~56\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[19]~56_combout\ = (((!counter(18)) # (!counter(19))) # (!counter(17))) # (!counter(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(16),
	datab => counter(17),
	datac => counter(19),
	datad => counter(18),
	combout => \counter[19]~56_combout\);

-- Location: LCCOMB_X6_Y25_N30
\counter[19]~59\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[19]~59_combout\ = (!counter(15) & (!counter(8) & (!counter(6) & !counter(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(15),
	datab => counter(8),
	datac => counter(6),
	datad => counter(7),
	combout => \counter[19]~59_combout\);

-- Location: LCCOMB_X6_Y26_N0
\counter[19]~57\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[19]~57_combout\ = (((!counter(3)) # (!counter(1))) # (!counter(2))) # (!counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datab => counter(2),
	datac => counter(1),
	datad => counter(3),
	combout => \counter[19]~57_combout\);

-- Location: LCCOMB_X6_Y26_N10
\counter[19]~58\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[19]~58_combout\ = ((\counter[19]~57_combout\) # (!counter(5))) # (!counter(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter(4),
	datac => counter(5),
	datad => \counter[19]~57_combout\,
	combout => \counter[19]~58_combout\);

-- Location: LCCOMB_X6_Y25_N24
\counter[19]~60\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[19]~60_combout\ = (\counter[19]~56_combout\) # ((\counter[19]~54_combout\ & (\counter[19]~59_combout\ & \counter[19]~58_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter[19]~54_combout\,
	datab => \counter[19]~56_combout\,
	datac => \counter[19]~59_combout\,
	datad => \counter[19]~58_combout\,
	combout => \counter[19]~60_combout\);

-- Location: LCCOMB_X6_Y25_N22
\counter[19]~61\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[19]~61_combout\ = (\rst~input_o\) # ((!\counter[19]~55_combout\ & !\counter[19]~60_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~input_o\,
	datac => \counter[19]~55_combout\,
	datad => \counter[19]~60_combout\,
	combout => \counter[19]~61_combout\);

-- Location: FF_X6_Y26_N13
\counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[0]~20_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(0));

-- Location: LCCOMB_X6_Y26_N14
\counter[1]~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[1]~22_combout\ = (counter(1) & (!\counter[0]~21\)) # (!counter(1) & ((\counter[0]~21\) # (GND)))
-- \counter[1]~23\ = CARRY((!\counter[0]~21\) # (!counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(1),
	datad => VCC,
	cin => \counter[0]~21\,
	combout => \counter[1]~22_combout\,
	cout => \counter[1]~23\);

-- Location: FF_X6_Y26_N15
\counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[1]~22_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(1));

-- Location: LCCOMB_X6_Y26_N16
\counter[2]~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[2]~24_combout\ = (counter(2) & (\counter[1]~23\ $ (GND))) # (!counter(2) & (!\counter[1]~23\ & VCC))
-- \counter[2]~25\ = CARRY((counter(2) & !\counter[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(2),
	datad => VCC,
	cin => \counter[1]~23\,
	combout => \counter[2]~24_combout\,
	cout => \counter[2]~25\);

-- Location: FF_X6_Y26_N17
\counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[2]~24_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(2));

-- Location: LCCOMB_X6_Y26_N18
\counter[3]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[3]~26_combout\ = (counter(3) & (!\counter[2]~25\)) # (!counter(3) & ((\counter[2]~25\) # (GND)))
-- \counter[3]~27\ = CARRY((!\counter[2]~25\) # (!counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(3),
	datad => VCC,
	cin => \counter[2]~25\,
	combout => \counter[3]~26_combout\,
	cout => \counter[3]~27\);

-- Location: FF_X6_Y26_N19
\counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[3]~26_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(3));

-- Location: LCCOMB_X6_Y26_N20
\counter[4]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[4]~28_combout\ = (counter(4) & (\counter[3]~27\ $ (GND))) # (!counter(4) & (!\counter[3]~27\ & VCC))
-- \counter[4]~29\ = CARRY((counter(4) & !\counter[3]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(4),
	datad => VCC,
	cin => \counter[3]~27\,
	combout => \counter[4]~28_combout\,
	cout => \counter[4]~29\);

-- Location: FF_X6_Y26_N21
\counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[4]~28_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(4));

-- Location: LCCOMB_X6_Y26_N22
\counter[5]~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[5]~30_combout\ = (counter(5) & (!\counter[4]~29\)) # (!counter(5) & ((\counter[4]~29\) # (GND)))
-- \counter[5]~31\ = CARRY((!\counter[4]~29\) # (!counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(5),
	datad => VCC,
	cin => \counter[4]~29\,
	combout => \counter[5]~30_combout\,
	cout => \counter[5]~31\);

-- Location: FF_X6_Y26_N23
\counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[5]~30_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(5));

-- Location: LCCOMB_X6_Y26_N24
\counter[6]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[6]~32_combout\ = (counter(6) & (\counter[5]~31\ $ (GND))) # (!counter(6) & (!\counter[5]~31\ & VCC))
-- \counter[6]~33\ = CARRY((counter(6) & !\counter[5]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(6),
	datad => VCC,
	cin => \counter[5]~31\,
	combout => \counter[6]~32_combout\,
	cout => \counter[6]~33\);

-- Location: FF_X6_Y26_N25
\counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[6]~32_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(6));

-- Location: LCCOMB_X6_Y26_N26
\counter[7]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[7]~34_combout\ = (counter(7) & (!\counter[6]~33\)) # (!counter(7) & ((\counter[6]~33\) # (GND)))
-- \counter[7]~35\ = CARRY((!\counter[6]~33\) # (!counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(7),
	datad => VCC,
	cin => \counter[6]~33\,
	combout => \counter[7]~34_combout\,
	cout => \counter[7]~35\);

-- Location: FF_X6_Y26_N27
\counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[7]~34_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(7));

-- Location: LCCOMB_X6_Y26_N28
\counter[8]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[8]~36_combout\ = (counter(8) & (\counter[7]~35\ $ (GND))) # (!counter(8) & (!\counter[7]~35\ & VCC))
-- \counter[8]~37\ = CARRY((counter(8) & !\counter[7]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(8),
	datad => VCC,
	cin => \counter[7]~35\,
	combout => \counter[8]~36_combout\,
	cout => \counter[8]~37\);

-- Location: FF_X5_Y25_N29
\counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \counter[8]~36_combout\,
	sclr => \counter[19]~61_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(8));

-- Location: LCCOMB_X6_Y26_N30
\counter[9]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[9]~38_combout\ = (counter(9) & (!\counter[8]~37\)) # (!counter(9) & ((\counter[8]~37\) # (GND)))
-- \counter[9]~39\ = CARRY((!\counter[8]~37\) # (!counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(9),
	datad => VCC,
	cin => \counter[8]~37\,
	combout => \counter[9]~38_combout\,
	cout => \counter[9]~39\);

-- Location: FF_X6_Y26_N31
\counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[9]~38_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(9));

-- Location: LCCOMB_X6_Y25_N0
\counter[10]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[10]~40_combout\ = (counter(10) & (\counter[9]~39\ $ (GND))) # (!counter(10) & (!\counter[9]~39\ & VCC))
-- \counter[10]~41\ = CARRY((counter(10) & !\counter[9]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(10),
	datad => VCC,
	cin => \counter[9]~39\,
	combout => \counter[10]~40_combout\,
	cout => \counter[10]~41\);

-- Location: FF_X6_Y25_N1
\counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[10]~40_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(10));

-- Location: LCCOMB_X6_Y25_N2
\counter[11]~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[11]~42_combout\ = (counter(11) & (!\counter[10]~41\)) # (!counter(11) & ((\counter[10]~41\) # (GND)))
-- \counter[11]~43\ = CARRY((!\counter[10]~41\) # (!counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(11),
	datad => VCC,
	cin => \counter[10]~41\,
	combout => \counter[11]~42_combout\,
	cout => \counter[11]~43\);

-- Location: FF_X6_Y25_N3
\counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[11]~42_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(11));

-- Location: LCCOMB_X6_Y25_N4
\counter[12]~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[12]~44_combout\ = (counter(12) & (\counter[11]~43\ $ (GND))) # (!counter(12) & (!\counter[11]~43\ & VCC))
-- \counter[12]~45\ = CARRY((counter(12) & !\counter[11]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(12),
	datad => VCC,
	cin => \counter[11]~43\,
	combout => \counter[12]~44_combout\,
	cout => \counter[12]~45\);

-- Location: FF_X6_Y25_N5
\counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[12]~44_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(12));

-- Location: LCCOMB_X6_Y25_N6
\counter[13]~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[13]~46_combout\ = (counter(13) & (!\counter[12]~45\)) # (!counter(13) & ((\counter[12]~45\) # (GND)))
-- \counter[13]~47\ = CARRY((!\counter[12]~45\) # (!counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(13),
	datad => VCC,
	cin => \counter[12]~45\,
	combout => \counter[13]~46_combout\,
	cout => \counter[13]~47\);

-- Location: FF_X6_Y25_N7
\counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[13]~46_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(13));

-- Location: LCCOMB_X6_Y25_N8
\counter[14]~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[14]~48_combout\ = (counter(14) & (\counter[13]~47\ $ (GND))) # (!counter(14) & (!\counter[13]~47\ & VCC))
-- \counter[14]~49\ = CARRY((counter(14) & !\counter[13]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(14),
	datad => VCC,
	cin => \counter[13]~47\,
	combout => \counter[14]~48_combout\,
	cout => \counter[14]~49\);

-- Location: FF_X6_Y25_N9
\counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[14]~48_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(14));

-- Location: LCCOMB_X6_Y25_N10
\counter[15]~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[15]~50_combout\ = (counter(15) & (!\counter[14]~49\)) # (!counter(15) & ((\counter[14]~49\) # (GND)))
-- \counter[15]~51\ = CARRY((!\counter[14]~49\) # (!counter(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(15),
	datad => VCC,
	cin => \counter[14]~49\,
	combout => \counter[15]~50_combout\,
	cout => \counter[15]~51\);

-- Location: FF_X6_Y25_N11
\counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[15]~50_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(15));

-- Location: LCCOMB_X6_Y25_N12
\counter[16]~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \counter[16]~52_combout\ = (counter(16) & (\counter[15]~51\ $ (GND))) # (!counter(16) & (!\counter[15]~51\ & VCC))
-- \counter[16]~53\ = CARRY((counter(16) & !\counter[15]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(16),
	datad => VCC,
	cin => \counter[15]~51\,
	combout => \counter[16]~52_combout\,
	cout => \counter[16]~53\);

-- Location: FF_X6_Y25_N13
\counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[16]~52_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(16));

-- Location: FF_X6_Y25_N15
\counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[17]~62_combout\,
	sclr => \counter[19]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(17));

-- Location: IOIBUF_X0_Y25_N22
\position[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_position(1),
	o => \position[1]~input_o\);

-- Location: IOIBUF_X0_Y23_N8
\position[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_position(2),
	o => \position[2]~input_o\);

-- Location: IOIBUF_X7_Y29_N15
\position[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_position(3),
	o => \position[3]~input_o\);

-- Location: IOIBUF_X0_Y27_N1
\position[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_position(0),
	o => \position[0]~input_o\);

-- Location: LCCOMB_X7_Y25_N20
\duty_cycle~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle~13_combout\ = (\position[2]~input_o\ & (((\position[1]~input_o\ & \position[0]~input_o\)) # (!\position[3]~input_o\))) # (!\position[2]~input_o\ & (!\position[1]~input_o\ & (\position[3]~input_o\ & !\position[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[2]~input_o\,
	datac => \position[3]~input_o\,
	datad => \position[0]~input_o\,
	combout => \duty_cycle~13_combout\);

-- Location: FF_X7_Y25_N21
\duty_cycle[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle~13_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(16));

-- Location: LCCOMB_X9_Y26_N28
\Mult0|mult_core|romout[0][15]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][15]~combout\ = (\position[1]~input_o\ & ((\position[3]~input_o\) # ((\position[0]~input_o\ & !\position[2]~input_o\)))) # (!\position[1]~input_o\ & ((\position[2]~input_o\ & ((!\position[3]~input_o\))) # (!\position[2]~input_o\ 
-- & (\position[0]~input_o\ & \position[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[0]~input_o\,
	datac => \position[2]~input_o\,
	datad => \position[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][15]~combout\);

-- Location: LCCOMB_X9_Y26_N30
\Mult0|mult_core|romout[0][14]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][14]~combout\ = (\position[0]~input_o\ & (\position[2]~input_o\ $ (((\position[1]~input_o\ & \position[3]~input_o\))))) # (!\position[0]~input_o\ & (!\position[2]~input_o\ & ((\position[1]~input_o\) # (\position[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101111000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[0]~input_o\,
	datac => \position[2]~input_o\,
	datad => \position[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][14]~combout\);

-- Location: LCCOMB_X9_Y26_N20
\Mult0|mult_core|romout[0][13]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][13]~combout\ = (\position[1]~input_o\ & (\position[0]~input_o\ & ((\position[3]~input_o\)))) # (!\position[1]~input_o\ & ((\position[0]~input_o\ & ((!\position[3]~input_o\) # (!\position[2]~input_o\))) # (!\position[0]~input_o\ 
-- & ((\position[2]~input_o\) # (\position[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001110101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[0]~input_o\,
	datac => \position[2]~input_o\,
	datad => \position[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][13]~combout\);

-- Location: LCCOMB_X9_Y26_N2
\Mult0|mult_core|romout[0][12]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][12]~combout\ = (\position[0]~input_o\ & (\position[3]~input_o\ & ((\position[1]~input_o\) # (\position[2]~input_o\)))) # (!\position[0]~input_o\ & (\position[3]~input_o\ $ (((\position[1]~input_o\) # (\position[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[0]~input_o\,
	datac => \position[2]~input_o\,
	datad => \position[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][12]~combout\);

-- Location: LCCOMB_X9_Y26_N8
\Mult0|mult_core|romout[0][11]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][11]~0_combout\ = (\position[1]~input_o\ & (((!\position[0]~input_o\ & \position[3]~input_o\)) # (!\position[2]~input_o\))) # (!\position[1]~input_o\ & (\position[2]~input_o\ $ (((\position[0]~input_o\ & 
-- !\position[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101000011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[0]~input_o\,
	datac => \position[2]~input_o\,
	datad => \position[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][11]~0_combout\);

-- Location: LCCOMB_X9_Y26_N10
\Mult0|mult_core|romout[0][10]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][10]~combout\ = (\position[0]~input_o\ & ((\position[1]~input_o\ & ((\position[2]~input_o\) # (\position[3]~input_o\))) # (!\position[1]~input_o\ & ((!\position[3]~input_o\))))) # (!\position[0]~input_o\ & (\position[1]~input_o\ 
-- $ (((\position[2]~input_o\ & \position[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101011100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[0]~input_o\,
	datac => \position[2]~input_o\,
	datad => \position[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][10]~combout\);

-- Location: LCCOMB_X9_Y26_N16
\Mult0|mult_core|romout[0][9]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][9]~combout\ = (\position[2]~input_o\ & (\position[0]~input_o\ $ (((\position[1]~input_o\ & !\position[3]~input_o\))))) # (!\position[2]~input_o\ & ((\position[0]~input_o\ & ((\position[1]~input_o\) # (!\position[3]~input_o\))) # 
-- (!\position[0]~input_o\ & ((\position[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101101101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[0]~input_o\,
	datac => \position[2]~input_o\,
	datad => \position[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][9]~combout\);

-- Location: LCCOMB_X9_Y26_N18
\Mult0|mult_core|romout[0][8]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][8]~combout\ = (\position[1]~input_o\ & (\position[3]~input_o\ $ (((\position[0]~input_o\ & !\position[2]~input_o\))))) # (!\position[1]~input_o\ & ((\position[2]~input_o\ & ((\position[0]~input_o\) # (!\position[3]~input_o\))) # 
-- (!\position[2]~input_o\ & ((\position[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011101011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[0]~input_o\,
	datac => \position[2]~input_o\,
	datad => \position[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][8]~combout\);

-- Location: LCCOMB_X9_Y26_N0
\Mult0|mult_core|romout[0][7]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][7]~1_combout\ = (\position[1]~input_o\ & (\position[0]~input_o\ $ ((\position[2]~input_o\)))) # (!\position[1]~input_o\ & (((\position[0]~input_o\ & \position[3]~input_o\)) # (!\position[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110100101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[0]~input_o\,
	datac => \position[2]~input_o\,
	datad => \position[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][7]~1_combout\);

-- Location: LCCOMB_X9_Y26_N22
\Mult0|mult_core|romout[0][6]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][6]~combout\ = (\position[1]~input_o\ & (((\position[3]~input_o\)) # (!\position[0]~input_o\))) # (!\position[1]~input_o\ & (\position[0]~input_o\ & ((!\position[3]~input_o\) # (!\position[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[0]~input_o\,
	datac => \position[2]~input_o\,
	datad => \position[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][6]~combout\);

-- Location: LCCOMB_X9_Y26_N24
\Mult0|mult_core|romout[0][5]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][5]~2_combout\ = (\position[0]~input_o\ & (((!\position[1]~input_o\ & !\position[2]~input_o\)) # (!\position[3]~input_o\))) # (!\position[0]~input_o\ & (((\position[2]~input_o\ & \position[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[0]~input_o\,
	datac => \position[2]~input_o\,
	datad => \position[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][5]~2_combout\);

-- Location: LCCOMB_X9_Y26_N6
\Mult0|mult_core|romout[0][4]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][4]~combout\ = (\position[2]~input_o\ & (\position[1]~input_o\ & ((!\position[3]~input_o\)))) # (!\position[2]~input_o\ & (\position[3]~input_o\ & ((!\position[0]~input_o\) # (!\position[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[0]~input_o\,
	datac => \position[2]~input_o\,
	datad => \position[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][4]~combout\);

-- Location: LCCOMB_X9_Y26_N4
\Mult0|mult_core|romout[0][8]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][8]~3_combout\ = \position[3]~input_o\ $ (((\position[1]~input_o\ & ((\position[2]~input_o\) # (!\position[0]~input_o\))) # (!\position[1]~input_o\ & ((!\position[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100010100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[1]~input_o\,
	datab => \position[0]~input_o\,
	datac => \position[2]~input_o\,
	datad => \position[3]~input_o\,
	combout => \Mult0|mult_core|romout[0][8]~3_combout\);

-- Location: LCCOMB_X8_Y26_N4
\duty_cycle[3]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[3]~14_combout\ = \Mult0|mult_core|romout[0][8]~3_combout\ $ (GND)
-- \duty_cycle[3]~15\ = CARRY(!\Mult0|mult_core|romout[0][8]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|romout[0][8]~3_combout\,
	datad => VCC,
	combout => \duty_cycle[3]~14_combout\,
	cout => \duty_cycle[3]~15\);

-- Location: LCCOMB_X8_Y26_N6
\duty_cycle[4]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[4]~16_combout\ = (\Mult0|mult_core|romout[0][4]~combout\ & (!\duty_cycle[3]~15\)) # (!\Mult0|mult_core|romout[0][4]~combout\ & ((\duty_cycle[3]~15\) # (GND)))
-- \duty_cycle[4]~17\ = CARRY((!\duty_cycle[3]~15\) # (!\Mult0|mult_core|romout[0][4]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|romout[0][4]~combout\,
	datad => VCC,
	cin => \duty_cycle[3]~15\,
	combout => \duty_cycle[4]~16_combout\,
	cout => \duty_cycle[4]~17\);

-- Location: LCCOMB_X8_Y26_N8
\duty_cycle[5]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[5]~18_combout\ = (\Mult0|mult_core|romout[0][5]~2_combout\ & ((GND) # (!\duty_cycle[4]~17\))) # (!\Mult0|mult_core|romout[0][5]~2_combout\ & (\duty_cycle[4]~17\ $ (GND)))
-- \duty_cycle[5]~19\ = CARRY((\Mult0|mult_core|romout[0][5]~2_combout\) # (!\duty_cycle[4]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Mult0|mult_core|romout[0][5]~2_combout\,
	datad => VCC,
	cin => \duty_cycle[4]~17\,
	combout => \duty_cycle[5]~18_combout\,
	cout => \duty_cycle[5]~19\);

-- Location: LCCOMB_X8_Y26_N10
\duty_cycle[6]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[6]~20_combout\ = (\Mult0|mult_core|romout[0][6]~combout\ & (!\duty_cycle[5]~19\)) # (!\Mult0|mult_core|romout[0][6]~combout\ & ((\duty_cycle[5]~19\) # (GND)))
-- \duty_cycle[6]~21\ = CARRY((!\duty_cycle[5]~19\) # (!\Mult0|mult_core|romout[0][6]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Mult0|mult_core|romout[0][6]~combout\,
	datad => VCC,
	cin => \duty_cycle[5]~19\,
	combout => \duty_cycle[6]~20_combout\,
	cout => \duty_cycle[6]~21\);

-- Location: LCCOMB_X8_Y26_N12
\duty_cycle[7]~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[7]~22_combout\ = (\Mult0|mult_core|romout[0][7]~1_combout\ & (\duty_cycle[6]~21\ $ (GND))) # (!\Mult0|mult_core|romout[0][7]~1_combout\ & ((GND) # (!\duty_cycle[6]~21\)))
-- \duty_cycle[7]~23\ = CARRY((!\duty_cycle[6]~21\) # (!\Mult0|mult_core|romout[0][7]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Mult0|mult_core|romout[0][7]~1_combout\,
	datad => VCC,
	cin => \duty_cycle[6]~21\,
	combout => \duty_cycle[7]~22_combout\,
	cout => \duty_cycle[7]~23\);

-- Location: LCCOMB_X8_Y26_N14
\duty_cycle[8]~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[8]~24_combout\ = (\Mult0|mult_core|romout[0][8]~combout\ & (\duty_cycle[7]~23\ & VCC)) # (!\Mult0|mult_core|romout[0][8]~combout\ & (!\duty_cycle[7]~23\))
-- \duty_cycle[8]~25\ = CARRY((!\Mult0|mult_core|romout[0][8]~combout\ & !\duty_cycle[7]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Mult0|mult_core|romout[0][8]~combout\,
	datad => VCC,
	cin => \duty_cycle[7]~23\,
	combout => \duty_cycle[8]~24_combout\,
	cout => \duty_cycle[8]~25\);

-- Location: LCCOMB_X8_Y26_N16
\duty_cycle[9]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[9]~26_combout\ = (\Mult0|mult_core|romout[0][9]~combout\ & (\duty_cycle[8]~25\ $ (GND))) # (!\Mult0|mult_core|romout[0][9]~combout\ & (!\duty_cycle[8]~25\ & VCC))
-- \duty_cycle[9]~27\ = CARRY((\Mult0|mult_core|romout[0][9]~combout\ & !\duty_cycle[8]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Mult0|mult_core|romout[0][9]~combout\,
	datad => VCC,
	cin => \duty_cycle[8]~25\,
	combout => \duty_cycle[9]~26_combout\,
	cout => \duty_cycle[9]~27\);

-- Location: LCCOMB_X8_Y26_N18
\duty_cycle[10]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[10]~28_combout\ = (\Mult0|mult_core|romout[0][10]~combout\ & (!\duty_cycle[9]~27\)) # (!\Mult0|mult_core|romout[0][10]~combout\ & ((\duty_cycle[9]~27\) # (GND)))
-- \duty_cycle[10]~29\ = CARRY((!\duty_cycle[9]~27\) # (!\Mult0|mult_core|romout[0][10]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Mult0|mult_core|romout[0][10]~combout\,
	datad => VCC,
	cin => \duty_cycle[9]~27\,
	combout => \duty_cycle[10]~28_combout\,
	cout => \duty_cycle[10]~29\);

-- Location: LCCOMB_X8_Y26_N20
\duty_cycle[11]~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[11]~30_combout\ = (\Mult0|mult_core|romout[0][11]~0_combout\ & (\duty_cycle[10]~29\ $ (GND))) # (!\Mult0|mult_core|romout[0][11]~0_combout\ & (!\duty_cycle[10]~29\ & VCC))
-- \duty_cycle[11]~31\ = CARRY((\Mult0|mult_core|romout[0][11]~0_combout\ & !\duty_cycle[10]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Mult0|mult_core|romout[0][11]~0_combout\,
	datad => VCC,
	cin => \duty_cycle[10]~29\,
	combout => \duty_cycle[11]~30_combout\,
	cout => \duty_cycle[11]~31\);

-- Location: LCCOMB_X8_Y26_N22
\duty_cycle[12]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[12]~32_combout\ = (\Mult0|mult_core|romout[0][12]~combout\ & (!\duty_cycle[11]~31\)) # (!\Mult0|mult_core|romout[0][12]~combout\ & ((\duty_cycle[11]~31\) # (GND)))
-- \duty_cycle[12]~33\ = CARRY((!\duty_cycle[11]~31\) # (!\Mult0|mult_core|romout[0][12]~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|romout[0][12]~combout\,
	datad => VCC,
	cin => \duty_cycle[11]~31\,
	combout => \duty_cycle[12]~32_combout\,
	cout => \duty_cycle[12]~33\);

-- Location: LCCOMB_X8_Y26_N24
\duty_cycle[13]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[13]~34_combout\ = (\Mult0|mult_core|romout[0][13]~combout\ & ((GND) # (!\duty_cycle[12]~33\))) # (!\Mult0|mult_core|romout[0][13]~combout\ & (\duty_cycle[12]~33\ $ (GND)))
-- \duty_cycle[13]~35\ = CARRY((\Mult0|mult_core|romout[0][13]~combout\) # (!\duty_cycle[12]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|romout[0][13]~combout\,
	datad => VCC,
	cin => \duty_cycle[12]~33\,
	combout => \duty_cycle[13]~34_combout\,
	cout => \duty_cycle[13]~35\);

-- Location: LCCOMB_X8_Y26_N26
\duty_cycle[14]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[14]~36_combout\ = (\Mult0|mult_core|romout[0][14]~combout\ & (\duty_cycle[13]~35\ & VCC)) # (!\Mult0|mult_core|romout[0][14]~combout\ & (!\duty_cycle[13]~35\))
-- \duty_cycle[14]~37\ = CARRY((!\Mult0|mult_core|romout[0][14]~combout\ & !\duty_cycle[13]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|romout[0][14]~combout\,
	datad => VCC,
	cin => \duty_cycle[13]~35\,
	combout => \duty_cycle[14]~36_combout\,
	cout => \duty_cycle[14]~37\);

-- Location: LCCOMB_X8_Y26_N28
\duty_cycle[15]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[15]~38_combout\ = \duty_cycle[14]~37\ $ (!\Mult0|mult_core|romout[0][15]~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Mult0|mult_core|romout[0][15]~combout\,
	cin => \duty_cycle[14]~37\,
	combout => \duty_cycle[15]~38_combout\);

-- Location: LCCOMB_X8_Y26_N30
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

-- Location: FF_X8_Y26_N29
\duty_cycle[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle[15]~38_combout\,
	asdata => \~GND~combout\,
	sload => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(15));

-- Location: FF_X8_Y26_N27
\duty_cycle[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle[14]~36_combout\,
	asdata => VCC,
	sload => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(14));

-- Location: LCCOMB_X8_Y25_N20
\duty_cycle[13]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[13]~feeder_combout\ = \duty_cycle[13]~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \duty_cycle[13]~34_combout\,
	combout => \duty_cycle[13]~feeder_combout\);

-- Location: FF_X8_Y25_N21
\duty_cycle[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle[13]~feeder_combout\,
	asdata => VCC,
	sload => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(13));

-- Location: FF_X8_Y26_N23
\duty_cycle[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle[12]~32_combout\,
	asdata => \~GND~combout\,
	sload => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(12));

-- Location: LCCOMB_X8_Y25_N10
\duty_cycle[11]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[11]~feeder_combout\ = \duty_cycle[11]~30_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \duty_cycle[11]~30_combout\,
	combout => \duty_cycle[11]~feeder_combout\);

-- Location: FF_X8_Y25_N11
\duty_cycle[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle[11]~feeder_combout\,
	asdata => \~GND~combout\,
	sload => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(11));

-- Location: LCCOMB_X8_Y25_N8
\duty_cycle[10]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[10]~feeder_combout\ = \duty_cycle[10]~28_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \duty_cycle[10]~28_combout\,
	combout => \duty_cycle[10]~feeder_combout\);

-- Location: FF_X8_Y25_N9
\duty_cycle[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle[10]~feeder_combout\,
	asdata => \~GND~combout\,
	sload => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(10));

-- Location: LCCOMB_X8_Y25_N26
\duty_cycle[9]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[9]~feeder_combout\ = \duty_cycle[9]~26_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \duty_cycle[9]~26_combout\,
	combout => \duty_cycle[9]~feeder_combout\);

-- Location: FF_X8_Y25_N27
\duty_cycle[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle[9]~feeder_combout\,
	asdata => \~GND~combout\,
	sload => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(9));

-- Location: LCCOMB_X8_Y25_N12
\duty_cycle[8]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[8]~feeder_combout\ = \duty_cycle[8]~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \duty_cycle[8]~24_combout\,
	combout => \duty_cycle[8]~feeder_combout\);

-- Location: FF_X8_Y25_N13
\duty_cycle[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle[8]~feeder_combout\,
	asdata => VCC,
	sload => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(8));

-- Location: FF_X8_Y26_N13
\duty_cycle[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle[7]~22_combout\,
	asdata => VCC,
	sload => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(7));

-- Location: FF_X8_Y26_N11
\duty_cycle[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle[6]~20_combout\,
	asdata => \~GND~combout\,
	sload => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(6));

-- Location: FF_X8_Y26_N9
\duty_cycle[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle[5]~18_combout\,
	asdata => VCC,
	sload => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(5));

-- Location: FF_X8_Y26_N7
\duty_cycle[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle[4]~16_combout\,
	asdata => \~GND~combout\,
	sload => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(4));

-- Location: LCCOMB_X8_Y26_N0
\duty_cycle[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle[3]~feeder_combout\ = \duty_cycle[3]~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \duty_cycle[3]~14_combout\,
	combout => \duty_cycle[3]~feeder_combout\);

-- Location: FF_X8_Y26_N1
\duty_cycle[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle[3]~feeder_combout\,
	asdata => VCC,
	sload => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(3));

-- Location: LCCOMB_X8_Y26_N2
\Mult0|mult_core|romout[0][2]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][2]~combout\ = \position[2]~input_o\ $ (((\position[1]~input_o\ & !\position[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[2]~input_o\,
	datab => \position[1]~input_o\,
	datad => \position[0]~input_o\,
	combout => \Mult0|mult_core|romout[0][2]~combout\);

-- Location: FF_X7_Y26_N21
\duty_cycle[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mult0|mult_core|romout[0][2]~combout\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(2));

-- Location: LCCOMB_X7_Y26_N14
\Mult0|mult_core|romout[0][1]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][1]~4_combout\ = \position[0]~input_o\ $ (\position[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \position[0]~input_o\,
	datad => \position[1]~input_o\,
	combout => \Mult0|mult_core|romout[0][1]~4_combout\);

-- Location: FF_X7_Y26_N19
\duty_cycle[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mult0|mult_core|romout[0][1]~4_combout\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(1));

-- Location: LCCOMB_X7_Y26_N4
\duty_cycle~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \duty_cycle~40_combout\ = (!\rst~input_o\ & \position[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~input_o\,
	datac => \position[0]~input_o\,
	combout => \duty_cycle~40_combout\);

-- Location: FF_X7_Y26_N5
\duty_cycle[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \duty_cycle~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty_cycle(0));

-- Location: LCCOMB_X7_Y26_N16
\LessThan1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~1_cout\ = CARRY((!counter(0) & duty_cycle(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datab => duty_cycle(0),
	datad => VCC,
	cout => \LessThan1~1_cout\);

-- Location: LCCOMB_X7_Y26_N18
\LessThan1~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~3_cout\ = CARRY((counter(1) & ((!\LessThan1~1_cout\) # (!duty_cycle(1)))) # (!counter(1) & (!duty_cycle(1) & !\LessThan1~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(1),
	datab => duty_cycle(1),
	datad => VCC,
	cin => \LessThan1~1_cout\,
	cout => \LessThan1~3_cout\);

-- Location: LCCOMB_X7_Y26_N20
\LessThan1~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~5_cout\ = CARRY((counter(2) & (duty_cycle(2) & !\LessThan1~3_cout\)) # (!counter(2) & ((duty_cycle(2)) # (!\LessThan1~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(2),
	datab => duty_cycle(2),
	datad => VCC,
	cin => \LessThan1~3_cout\,
	cout => \LessThan1~5_cout\);

-- Location: LCCOMB_X7_Y26_N22
\LessThan1~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~7_cout\ = CARRY((counter(3) & ((!\LessThan1~5_cout\) # (!duty_cycle(3)))) # (!counter(3) & (!duty_cycle(3) & !\LessThan1~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(3),
	datab => duty_cycle(3),
	datad => VCC,
	cin => \LessThan1~5_cout\,
	cout => \LessThan1~7_cout\);

-- Location: LCCOMB_X7_Y26_N24
\LessThan1~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~9_cout\ = CARRY((duty_cycle(4) & ((!\LessThan1~7_cout\) # (!counter(4)))) # (!duty_cycle(4) & (!counter(4) & !\LessThan1~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => duty_cycle(4),
	datab => counter(4),
	datad => VCC,
	cin => \LessThan1~7_cout\,
	cout => \LessThan1~9_cout\);

-- Location: LCCOMB_X7_Y26_N26
\LessThan1~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~11_cout\ = CARRY((counter(5) & ((!\LessThan1~9_cout\) # (!duty_cycle(5)))) # (!counter(5) & (!duty_cycle(5) & !\LessThan1~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(5),
	datab => duty_cycle(5),
	datad => VCC,
	cin => \LessThan1~9_cout\,
	cout => \LessThan1~11_cout\);

-- Location: LCCOMB_X7_Y26_N28
\LessThan1~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~13_cout\ = CARRY((duty_cycle(6) & ((!\LessThan1~11_cout\) # (!counter(6)))) # (!duty_cycle(6) & (!counter(6) & !\LessThan1~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => duty_cycle(6),
	datab => counter(6),
	datad => VCC,
	cin => \LessThan1~11_cout\,
	cout => \LessThan1~13_cout\);

-- Location: LCCOMB_X7_Y26_N30
\LessThan1~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~15_cout\ = CARRY((counter(7) & ((!\LessThan1~13_cout\) # (!duty_cycle(7)))) # (!counter(7) & (!duty_cycle(7) & !\LessThan1~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(7),
	datab => duty_cycle(7),
	datad => VCC,
	cin => \LessThan1~13_cout\,
	cout => \LessThan1~15_cout\);

-- Location: LCCOMB_X7_Y25_N0
\LessThan1~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~17_cout\ = CARRY((counter(8) & (duty_cycle(8) & !\LessThan1~15_cout\)) # (!counter(8) & ((duty_cycle(8)) # (!\LessThan1~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(8),
	datab => duty_cycle(8),
	datad => VCC,
	cin => \LessThan1~15_cout\,
	cout => \LessThan1~17_cout\);

-- Location: LCCOMB_X7_Y25_N2
\LessThan1~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~19_cout\ = CARRY((counter(9) & ((!\LessThan1~17_cout\) # (!duty_cycle(9)))) # (!counter(9) & (!duty_cycle(9) & !\LessThan1~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(9),
	datab => duty_cycle(9),
	datad => VCC,
	cin => \LessThan1~17_cout\,
	cout => \LessThan1~19_cout\);

-- Location: LCCOMB_X7_Y25_N4
\LessThan1~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~21_cout\ = CARRY((counter(10) & (duty_cycle(10) & !\LessThan1~19_cout\)) # (!counter(10) & ((duty_cycle(10)) # (!\LessThan1~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(10),
	datab => duty_cycle(10),
	datad => VCC,
	cin => \LessThan1~19_cout\,
	cout => \LessThan1~21_cout\);

-- Location: LCCOMB_X7_Y25_N6
\LessThan1~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~23_cout\ = CARRY((counter(11) & ((!\LessThan1~21_cout\) # (!duty_cycle(11)))) # (!counter(11) & (!duty_cycle(11) & !\LessThan1~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(11),
	datab => duty_cycle(11),
	datad => VCC,
	cin => \LessThan1~21_cout\,
	cout => \LessThan1~23_cout\);

-- Location: LCCOMB_X7_Y25_N8
\LessThan1~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~25_cout\ = CARRY((duty_cycle(12) & ((!\LessThan1~23_cout\) # (!counter(12)))) # (!duty_cycle(12) & (!counter(12) & !\LessThan1~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => duty_cycle(12),
	datab => counter(12),
	datad => VCC,
	cin => \LessThan1~23_cout\,
	cout => \LessThan1~25_cout\);

-- Location: LCCOMB_X7_Y25_N10
\LessThan1~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~27_cout\ = CARRY((duty_cycle(13) & (counter(13) & !\LessThan1~25_cout\)) # (!duty_cycle(13) & ((counter(13)) # (!\LessThan1~25_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => duty_cycle(13),
	datab => counter(13),
	datad => VCC,
	cin => \LessThan1~25_cout\,
	cout => \LessThan1~27_cout\);

-- Location: LCCOMB_X7_Y25_N12
\LessThan1~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~29_cout\ = CARRY((counter(14) & (duty_cycle(14) & !\LessThan1~27_cout\)) # (!counter(14) & ((duty_cycle(14)) # (!\LessThan1~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(14),
	datab => duty_cycle(14),
	datad => VCC,
	cin => \LessThan1~27_cout\,
	cout => \LessThan1~29_cout\);

-- Location: LCCOMB_X7_Y25_N14
\LessThan1~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~31_cout\ = CARRY((counter(15) & ((!\LessThan1~29_cout\) # (!duty_cycle(15)))) # (!counter(15) & (!duty_cycle(15) & !\LessThan1~29_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(15),
	datab => duty_cycle(15),
	datad => VCC,
	cin => \LessThan1~29_cout\,
	cout => \LessThan1~31_cout\);

-- Location: LCCOMB_X7_Y25_N16
\LessThan1~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~32_combout\ = (duty_cycle(16) & ((!counter(16)) # (!\LessThan1~31_cout\))) # (!duty_cycle(16) & (!\LessThan1~31_cout\ & !counter(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => duty_cycle(16),
	datad => counter(16),
	cin => \LessThan1~31_cout\,
	combout => \LessThan1~32_combout\);

-- Location: LCCOMB_X7_Y25_N30
\LessThan1~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~34_combout\ = (!counter(17) & (!counter(19) & (!counter(18) & \LessThan1~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(17),
	datab => counter(19),
	datac => counter(18),
	datad => \LessThan1~32_combout\,
	combout => \LessThan1~34_combout\);

-- Location: FF_X7_Y25_N31
\pwm~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \LessThan1~34_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pwm~reg0_q\);

ww_pwm <= \pwm~output_o\;
END structure;


