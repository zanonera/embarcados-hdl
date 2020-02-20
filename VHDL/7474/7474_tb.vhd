---------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------------

--  A testbench has no ports.
entity SN74LS74A_tb is
end SN74LS74A_tb;

architecture behav of SN74LS74A_tb is
  --  Declaration of the component that will be instantiated.
  component SN74LS74A is
    port ( d1, clk1, clr1, pr1, d2, clk2, clr2, pr2: IN STD_LOGIC; q1, qb1, q2, qb2: OUT STD_LOGIC);
  end component;

  --  Specifies which entity is bound with the component.
  for SN74LS74A_0: SN74LS74A use entity work.SN74LS74A;
  signal d1, clk1, clr1, pr1, q1, qb1: STD_LOGIC;
  signal d2, clk2, clr2, pr2, q2, qb2: STD_LOGIC;
  
  constant clk_period : time := 1 ns;
      
  signal ErrorCount : integer := 0;   -- Integer value to store the qty of errors.  Initialized to zero
  
begin
  --  Component instantiation.
  SN74LS74A_0: SN74LS74A port map ( d1 => d1, clk1 => clk1, clr1 => clr1, pr1 => pr1, q1 => q1, qb1 => qb1,
                                    d2 => d2, clk2 => clk2, clr2 => clr2, pr2 => pr2, q2 => q2, qb2 => qb2);

  --  This process does the real job.
  process
    type pattern_type is record
      --  The inputs of the 74138.
      d1, clr1, pr1, d2, clr2, pr2 : STD_LOGIC;
      --  The expected outputs of the 74138.
      q1, qb1, q2, qb2 : STD_LOGIC;
    end record;
    -- The patterns to apply.
    -- From SN74LS74A datasheet's Truth Table
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
      (('1', '1', '0', '1', '1', '0', '1', '0', '1', '0'), -- Preset State
       ('0', '1', '0', '0', '1', '0', '1', '0', '1', '0'),
       ('1', '0', '1', '1', '0', '1', '0', '1', '0', '1'), -- Clear State
       ('0', '0', '1', '0', '0', '1', '0', '1', '0', '1'),
       ('1', '0', '0', '1', '0', '0', '1', '1', '1', '1'), -- NonStable and Unpredictable Output
       ('0', '0', '0', '0', '0', '0', '1', '1', '1', '1'), -- NonStable and Unpredictable Output
       ('0', '1', '1', '0', '1', '1', '0', '1', '0', '1'),
       ('1', '1', '1', '1', '1', '1', '1', '0', '1', '0'));
  begin
    --  Check each pattern.
    for i in patterns'range loop
      -- Print the evolutions of the tests
      report "Truth Table line: " & integer'image(i+1) & " of " & integer'image(patterns'length);
      --  Set the inputs for DFF1.
      d1 <= patterns(i).d1;
      clr1 <= patterns(i).clr1;
      pr1 <= patterns(i).pr1;
      --  Set the inputs for DFF2.
      d2 <= patterns(i).d2;
      clr2 <= patterns(i).clr2;
      pr2 <= patterns(i).pr2;
      --  Wait for the results.
      wait for 1 ns;
      --  Check the outputs for DFF1.
      if q1 /= patterns(i).q1 then
        report "bad output q1" severity error;
        ErrorCount <= ErrorCount + 1;
      end if;
      if qb1 /= patterns(i).qb1 then
        report "bad output qb1" severity error;
        ErrorCount <= ErrorCount + 1;
      end if;
      --  Check the outputs for DFF2.
      if q2 /= patterns(i).q2 then
        report "bad output q2" severity error;
        ErrorCount <= ErrorCount + 1;
      end if;
      if qb2 /= patterns(i).qb2 then
        report "bad output qb2" severity error;
        ErrorCount <= ErrorCount + 1;
      end if;       
    end loop;
    assert false report "end of test" severity note;
    --Echo to user that report has finished
    report "Test completed with " & integer'image(ErrorCount) & " errors";
    --  Wait forever; this will finish the simulation.
    wait;
  end process;
  
     -- Clock process definitions( clock with 50% duty cycle is generated here.
   clk_process :process
   begin
        clk1 <= '0';
        clk2 <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clk1 <= '1';
        clk2 <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
   end process;
  
end behav;