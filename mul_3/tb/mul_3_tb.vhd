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

--------------------------------------------------------------

		wait for SOME_TIME;
		sel	<= "011";
		MUL_DIV	<= "0000001";
		opcode	<= "0110011";
		a	<= std_logic_vector(to_unsigned(3, 32));
		b	<= std_logic_vector(to_unsigned(3, 32));

		wait for SOME_TIME;
		a	<= std_logic_vector(to_unsigned(2147483647, 32));
		b	<= std_logic_vector(to_unsigned(2147483647, 32)); -- risultato diverso da zero se si eccedono 32 bit

--------------------------------------------------------------

		wait for SOME_TIME;
		sel	<= "000";
		a	<= std_logic_vector(to_signed(5, 32));
		b	<= std_logic_vector(to_signed(-5, 32));

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(-5, 32));
		b	<= std_logic_vector(to_signed(-5, 32));

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(-5, 32));
		b	<= std_logic_vector(to_signed(5, 32));

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(5, 32));
		b	<= std_logic_vector(to_signed(5, 32));

--------------------------------------------------------------

		wait for SOME_TIME;
		sel	<= "001";
		a	<= std_logic_vector(to_signed(5, 32));
		b	<= std_logic_vector(to_signed(-5, 32));

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(-5, 32));
		b	<= std_logic_vector(to_signed(-5, 32));

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(-5, 32));
		b	<= std_logic_vector(to_signed(5, 32));

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(5, 32));
		b	<= std_logic_vector(to_signed(5, 32));

--------------------------------------------------------------

		wait for SOME_TIME;
		sel	<= "010";
		a	<= std_logic_vector(to_signed(5, 32));
		b	<= std_logic_vector(to_signed(-5, 32));

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(-5, 32));
		b	<= std_logic_vector(to_signed(-5, 32));

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(-5, 32));
		b	<= std_logic_vector(to_signed(5, 32));

		wait for SOME_TIME;
		a	<= std_logic_vector(to_signed(5, 32));
		b	<= std_logic_vector(to_signed(5, 32));

--------------------------------------------------------------
	

	end process;
end bhv;