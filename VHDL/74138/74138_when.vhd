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
  --  This 74138 architecture describes the unit using the WHEN/ELSE (conditional signal assignment) clause
  --  Compute the enable/address input bit.
  control <= e1 & e2 & e3 & a0 & a1 & a2;    
  o0 <= '0' when control = "001000" else '1';
  o1 <= '0' when control = "001100" else '1';
  o2 <= '0' when control = "001010" else '1';
  o3 <= '0' when control = "001110" else '1';
  o4 <= '0' when control = "001001" else '1';
  o5 <= '0' when control = "001101" else '1';
  o6 <= '0' when control = "001011" else '1';
  o7 <= '0' when control = "001111" else '1';
end gates;