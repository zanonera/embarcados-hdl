library ieee;
use ieee.std_logic_1164.all;

entity SN74LS138 is
  -- `e1`, `e2`, and `e3` are enable inputs of the 74138.
  -- `a0`, `a1`, and `a2` are address inputs of the 74138.
  -- `o0` to `o7` are (active low) outputs of the 74138.
  port (e1, e2, e3 : in bit; a0, a1, a2 : in bit; o0, o1, o2, o3, o4, o5, o6, o7 : out bit);
end SN74LS138;

architecture gates of SN74LS138 is
signal control : bit_vector(5 downto 0);
begin
  --  This 74138 architecture describes the unit using the CASE clause inside the process
  --  Compute the enable/address input bit.
   control <= e1 & e2 & e3 & a0 & a1 & a2;
   process(control)
	variable std_control : std_logic_vector(5 downto 0);
   begin
      std_control := To_StdLogicVector(control);
      case std_control is
      when "1-----" =>
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      when "-1----" =>
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      when "--0---" =>
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '1';         
      when "001000" =>
         o0 <= '0'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      when "001100" =>
         o0 <= '1'; o1 <= '0'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      when "001010" =>
         o0 <= '1'; o1 <= '1'; o2 <= '0'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      when "001110" =>
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '0'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      when "001001" =>
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '0'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      when "001101" =>
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '0'; o6 <= '1'; o7 <= '1';
      when "001011" =>
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '0'; o7 <= '1';
      when "001111" =>
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '0';
      when others =>
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      end case;
   end process;
end gates;