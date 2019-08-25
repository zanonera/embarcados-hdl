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
  --  This 74138 architecture describes the unit using the WITH/SELECT (selected signal assignment) clause
  --  Compute the enable/address input bit.
  control <= e1 & e2 & e3 & a0 & a1 & a2;
  with control select o0 <= '0' when "001000", '1' when others;
  with control select o1 <= '0' when "001100", '1' when others;
  with control select o2 <= '0' when "001010", '1' when others;
  with control select o3 <= '0' when "001110", '1' when others;
  with control select o4 <= '0' when "001001", '1' when others;
  with control select o5 <= '0' when "001101", '1' when others;
  with control select o6 <= '0' when "001011", '1' when others;
  with control select o7 <= '0' when "001111", '1' when others;
end gates;