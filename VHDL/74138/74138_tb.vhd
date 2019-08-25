--  A testbench has no ports.
entity SN74LS138_tb is
end SN74LS138_tb;

architecture behav of SN74LS138_tb is
  --  Declaration of the component that will be instantiated.
  component SN74LS138 is
    port (e1, e2, e3 : in bit; a0, a1, a2 : in bit; o0, o1, o2, o3, o4, o5, o6, o7 : out bit);
  end component;

  --  Specifies which entity is bound with the component.
  for SN74LS138_0: SN74LS138 use entity work.SN74LS138;
  signal e1, e2, e3, a0, a1, a2, o0, o1, o2, o3, o4, o5, o6, o7 : bit;
begin
  --  Component instantiation.
  SN74LS138_0: SN74LS138 port map (e1 => e1, e2 => e2, e3 => e3,
                                   a0 => a0, a1 => a1, a2=> a2,
             o0 => o0, o1 => o1, o2 => o2, o3 => o3, o4 => o4, o5 => o5, o6 => o6, o7 => o7);

  --  This process does the real job.
  process
    type pattern_type is record
      --  The inputs of the 74138.
      e1, e2, e3, a0, a1, a2 : bit;
      --  The expected outputs of the 74138.
      o0, o1, o2, o3, o4, o5, o6, o7 : bit;
    end record;
    -- The patterns to apply.
    -- From SN74LS138 datasheet's Truth Table
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
      (('1', '0', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1'),   -- Test of Enable Lines
       ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
       ('0', '1', '1', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1'),
       ('0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
       ('1', '1', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1'),
       ('1', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
       ('0', '1', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1'),
       ('0', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
       ('0', '0', '1', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1'),   -- Test of Address/Output
       ('0', '0', '1', '1', '0', '0', '1', '0', '1', '1', '1', '1', '1', '1'),
       ('0', '0', '1', '0', '1', '0', '1', '1', '0', '1', '1', '1', '1', '1'),
       ('0', '0', '1', '1', '1', '0', '1', '1', '1', '0', '1', '1', '1', '1'),
       ('0', '0', '1', '0', '0', '1', '1', '1', '1', '1', '0', '1', '1', '1'),
       ('0', '0', '1', '1', '0', '1', '1', '1', '1', '1', '1', '0', '1', '1'),
       ('0', '0', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1'),
       ('0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0'));
  begin
    --  Check each pattern.
    for i in patterns'range loop
      -- Print the evolutions of the tests
      report "Truth Table line: " & integer'image(i) ;
      --  Set the inputs.
      e1 <= patterns(i).e1;
      e2 <= patterns(i).e2;
      e3 <= patterns(i).e3;
      a0 <= patterns(i).a0;
      a1 <= patterns(i).a1;
      a2 <= patterns(i).a2;
      --  Wait for the results.
      wait for 1 ns;
      --  Check the outputs.
      assert o0 = patterns(i).o0
        report "bad output 0" severity error;
      assert o1 = patterns(i).o1
        report "bad output 1" severity error;  
      assert o2 = patterns(i).o2
        report "bad output 2" severity error;
      assert o3 = patterns(i).o3
        report "bad output 3" severity error;
      assert o4 = patterns(i).o4
        report "bad output 4" severity error;
      assert o5 = patterns(i).o5
        report "bad output 5" severity error;  
      assert o6 = patterns(i).o6
        report "bad output 6" severity error;
      assert o7 = patterns(i).o7
        report "bad output 7" severity error;         
    end loop;
    assert false report "end of test" severity note;
    --  Wait forever; this will finish the simulation.
    wait;
  end process;
end behav;