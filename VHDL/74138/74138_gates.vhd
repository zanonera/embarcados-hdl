entity SN74LS138 is
  -- `e1`, `e2`, and `e3` are enable inputs of the 74138.
  -- `a0`, `a1`, and `a2` are address inputs of the 74138.
  -- `o0` to `o7` are (active low) outputs of the 74138.
  port (e1, e2, e3 : in bit; a0, a1, a2 : in bit; o0, o1, o2, o3, o4, o5, o6, o7 : out bit);
end SN74LS138;

architecture gates of SN74LS138 is
signal addr : bit;
begin
  --  This 74138 architecture contains only concurrent assignments using the logic diagram of the unit.
  --  Compute the enable input bit.
  addr <= not e1 and not e2 and e3;
  --  Compute the 8x outputs.
  o0 <= not (addr and not a0 and not a1 and not a2);
  o1 <= not (addr and a0 and not a1 and not a2);
  o2 <= not (addr and not a0 and a1 and not a2);
  o3 <= not (addr and a0 and a1 and not a2);
  o4 <= not (addr and not a0 and not a1 and a2);
  o5 <= not (addr and a0 and not a1 and a2);
  o6 <= not (addr and not a0 and a1 and a2);
  o7 <= not (addr and a0 and a1 and a2);
end gates;