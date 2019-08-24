entity SN74LS138 is
  -- `e1`, `e2`, and `e3` are enable inputs of the 74138.
  -- `a0`, `a1`, and `a2` are address inputs of the 74138.
  -- `o0` to `o7` are (active low) outputs of the 74138.
  port (e1, e2, e3 : in bit; a0, a1, a2 : in bit; o0, o1, o2, o3, o4, o5, o6, o7 : out bit);
end SN74LS138;

architecture gates of SN74LS138 is
begin
  --  This 74138 architecture describes the unit using the IF clause inside the process
   process(e1, e2, e3, a0, a1, a2)
   begin
      if ((e1 = '1') or (e2 = '1') or (e3 = '0')) then
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      elsif ((a0 = '0') and (a1 = '0') and (a2 = '0')) then
         o0 <= '0'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      elsif ((a0 = '1') and (a1 = '0') and (a2 = '0')) then
         o0 <= '1'; o1 <= '0'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      elsif ((a0 = '0') and (a1 = '1') and (a2 = '0')) then
         o0 <= '1'; o1 <= '1'; o2 <= '0'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      elsif ((a0 = '1') and (a1 = '1') and (a2 = '0')) then
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '0'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      elsif ((a0 = '0') and (a1 = '0') and (a2 = '1')) then
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '0'; o5 <= '1'; o6 <= '1'; o7 <= '1';
      elsif ((a0 = '1') and (a1 = '0') and (a2 = '1')) then
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '0'; o6 <= '1'; o7 <= '1';
      elsif ((a0 = '0') and (a1 = '1') and (a2 = '1')) then
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '0'; o7 <= '1';
      elsif ((a0 = '1') and (a1 = '1') and (a2 = '1')) then
         o0 <= '1'; o1 <= '1'; o2 <= '1'; o3 <= '1'; o4 <= '1'; o5 <= '1'; o6 <= '1'; o7 <= '0';
      end if;
   end process;
end gates;