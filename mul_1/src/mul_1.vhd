library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mul_1 is
	port(	a	: in std_logic_vector(31 downto 0);
		b	: in std_logic_vector(31 downto 0);
		MUL_DIV	: in std_logic_vector(6 downto 0);
		opcode	: in std_logic_vector(6 downto 0);
		sel	: in std_logic_vector(2 downto 0);
		o	: out std_logic_vector(31 downto 0));
end mul_1;

architecture bhv of mul_1 is
begin
	process(a, b, MUL_DIV, opcode, sel)
	begin
		case MUL_DIV is
			when "0000001" =>
				case opcode is
					when "0110011" =>
						case sel is
							when "011" =>
								o <= std_logic_vector(unsigned(a) * unsigned(b)); -- MULHU
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