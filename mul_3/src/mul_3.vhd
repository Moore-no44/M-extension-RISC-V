library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mul_3 is
	port(	a	: in std_logic_vector(31 downto 0);
		b	: in std_logic_vector(31 downto 0);
		MUL_DIV	: in std_logic_vector(6 downto 0);
		opcode	: in std_logic_vector(6 downto 0);
		sel	: in std_logic_vector(2 downto 0);
		o	: out std_logic_vector(31 downto 0));
end mul_3;

architecture bhv of mul_3 is

	signal	res	: std_logic_vector(63 downto 0);
	signal	sign	: std_logic;
	signal	res2	: std_logic_vector(65 downto 0);

begin
	process(a, b, MUL_DIV, opcode, sel, res, sign)
	begin
		case MUL_DIV is
			when "0000001" =>
				case opcode is
					when "0110011" =>
						case sel is

							when "000" =>
								res <= std_logic_vector(signed(a) * signed(b));
								o <= res(31 downto 0); -- MUL

							when "001" =>
								res <= std_logic_vector(signed(a) * signed(b));
								o <= res(63 downto 32); -- MULH

							when "010" =>
								sign <= a(31);
								if (sign = '0') then
									res <= std_logic_vector (unsigned(a) * unsigned(b));
									o <= res(63 downto 32);
								elsif (sign = '1') then
									res2 <= std_logic_vector(    ("-1") * (      unsigned(a)     *    unsigned(b)    )        );
									o <= res2(63 downto 32);
								end if; -- MULHSU

							when "011" =>
								res <= std_logic_vector(unsigned(a) * unsigned(b));
								o <= res(63 downto 32); -- MULHU

							when others =>
								null;

						end case;
					when others =>
						null;
				end case;
			when others =>
				null;
		end case;
	end process;
end bhv;