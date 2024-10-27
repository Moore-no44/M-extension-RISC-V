library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mul_3_tb is
end mul_3_tb;

architecture bhv of mul_3_tb is
	------------------------------------------------
	-- Device Under Test (DUT) declaration
	------------------------------------------------
	component mul_3 is
		port(	a	: in std_logic_vector(31 downto 0);
			b	: in std_logic_vector(31 downto 0);
			MUL_DIV	: in std_logic_vector(6 downto 0);
			opcode	: in std_logic_vector(6 downto 0);
			sel	: in std_logic_vector(2 downto 0);
			o	: out std_logic_vector(31 downto 0));
	end component;

	------------------------------------------------
	-- Testbench signals
	------------------------------------------------
	signal a	: std_logic_vector(31 downto 0);
	signal b	: std_logic_vector(31 downto 0);
	signal MUL_DIV	: std_logic_vector(6 downto 0);
	signal opcode	: std_logic_vector(6 downto 0);
	signal sel	: std_logic_vector(2 downto 0);
	signal o	: std_logic_vector(31 downto 0);

	------------------------------------------------
	-- Testbench constants
	------------------------------------------------
	constant SOME_TIME	: time := 10ns;

begin
	dut: mul_3
		port map(	a	=> a,
				b	=> b,
				MUL_DIV	=> MUL_DIV,
				opcode	=> opcode,
				sel	=> sel,
				o	=> o);
	test: process
	begin

		MUL_DIV	<= "0000001";
		opcode	<= "0110011";
--------------------------------------------------------------

		-- MULH + MUL
		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(5, 32));
		b	<= std_logic_vector(to_signed(-5, 32));
		sel	<= "001";
		wait for SOME_TIME;
		sel	<= "000";

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(-5, 32));
		b	<= std_logic_vector(to_signed(-5, 32));
		sel	<= "001";
		wait for SOME_TIME;
		sel	<= "000";

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(-5, 32));
		b	<= std_logic_vector(to_signed(5, 32));
		sel	<= "001";
		wait for SOME_TIME;
		sel	<= "000";

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(5, 32));
		b	<= std_logic_vector(to_signed(5, 32));
		sel	<= "001";
		wait for SOME_TIME;
		sel	<= "000";

--------------------------------------------------------------

		-- MULHU + MUL
		wait for SOME_TIME;
		a	<= std_logic_vector(to_unsigned(3, 32));
		b	<= std_logic_vector(to_unsigned(3, 32));
		sel	<= "011";
		wait for SOME_TIME;
		sel	<= "000";

		wait for SOME_TIME;
		a	<= "11111111111111111111111111111101";
		b	<= "11111111111111111111111111111101";
		sel	<= "011";
		wait for SOME_TIME;
		sel	<= "000";

		wait for SOME_TIME;
		a	<= std_logic_vector(to_unsigned(-3, 32));
		b	<= std_logic_vector(to_unsigned(-3, 32));
		sel	<= "011";
		wait for SOME_TIME;
		sel	<= "000";

		wait for SOME_TIME;
		a	<= "11111111111111111111111111111101";
		b	<= "00000000000000000000000000000011";
		sel	<= "011";
		wait for SOME_TIME;
		sel	<= "000";

		wait for SOME_TIME;
		a	<= std_logic_vector(to_unsigned(-3, 32));
		b	<= std_logic_vector(to_unsigned(3, 32));
		sel	<= "011";
		wait for SOME_TIME;
		sel	<= "000";


--------------------------------------------------------------

		-- MULHSU + MUL
		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(10, 32));
		b	<= std_logic_vector(to_signed(10, 32));
		sel	<= "010";
		wait for SOME_TIME;
		sel	<= "000";

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(10, 32));
		b	<= std_logic_vector(to_signed(-10, 32));
		sel	<= "010";
		wait for SOME_TIME;
		sel	<= "000";

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(-10, 32));
		b	<= std_logic_vector(to_signed(10, 32));
		sel	<= "010";
		wait for SOME_TIME;
		sel	<= "000";

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(-10, 32));
		b	<= std_logic_vector(to_signed(-10, 32));
		sel	<= "010";
		wait for SOME_TIME;
		sel	<= "000";

--------------------------------------------------------------
	

	end process;
end bhv;