library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SN74LS181 is
   port ( A : in std_logic_vector (3 downto 0);
          B : in std_logic_vector (3 downto 0);
          S : in std_logic_vector (3 downto 0);
          M, Cn : in std_logic;
          F : out std_logic_vector (3 downto 0);
          P, G, AeqB, Cn4 : out std_logic);
end SN74LS181;

architecture behave of SN74LS181 is
begin
   process(A,B,S,M,Cn)
   begin
	if (M = '0') then
		-- Active High Inputs : Arithmetic Operations
		case S is
         when "0000" => F <= A + 1 - Cn;
         when "0001" => F <= (A or B) + 1 - Cn;
         when "0010" => F <= (A or (not B)) + 1 - Cn;
         when "0011" => F <= "0000" - Cn;
         when "0100" => F <= A + (A and (not B)) + 1 + Cn;
         when "0101" => F <= (A or B) + (A and (not B)) + 1 + Cn;
         when "0110" => F <= A - B - Cn;
         when "0111" => F <= (A and (not B)) - Cn;
         when "1000" => F <= A + (A and B) - Cn;
         when "1001" => F <= A + B + 1 - Cn;
         when "1010" => F <= (A or B) + (A and B) + 1 - Cn;
         when "1011" => F <= (A and B) - Cn;
         when "1100" => F <= A + A + 1 - Cn;
         when "1101" => F <= (A or B) + A + 1 - Cn;
         when "1110" => F <= (A or (not B)) + A + 1 - Cn;
         when "1111" => F <= A - Cn;
         when others => F <= "XXXX";
		end case;
	elsif (M = '1') then
		-- Active High Inputs : Logic Functions
		case S is
         when "0000" => F <= not A;
         when "0001" => F <= not (A or B);
         when "0010" => F <= (not A) and B;
         when "0011" => F <= "0000";
         when "0100" => F <= not (A and B);
         when "0101" => F <= not B;
         when "0110" => F <= A xor B;
         when "0111" => F <= A and (not B);
         when "1000" => F <= (not A) or B;
         when "1001" => F <= not (A xor B);
         when "1010" => F <= B;
         when "1011" => F <= A and B;
         when "1100" => F <= "1111";
         when "1101" => F <= A or (not B);
         when "1110" => F <= A or B;
         when "1111" => F <= A;
         when others => F <= "XXXX";
		end case;
	end if;
   end process;
end behave;