---------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------------
ENTITY SN74LS74A IS
   PORT ( d1, clk1, clr1, pr1: IN STD_LOGIC;
          d2, clk2, clr2, pr2: IN STD_LOGIC;
          q1, qb1: OUT STD_LOGIC;
          q2, qb2: OUT STD_LOGIC);
END SN74LS74A;
---------------------------------------
ARCHITECTURE behavior OF SN74LS74A IS
BEGIN
   -- DFF1
   q1 <= d1 when (clk1'EVENT AND clk1='1') else '0' when (clr1='0') else '1' when (pr1='0');
   qb1 <= not d1 when (clk1'EVENT AND clk1='1') else '1' when (clr1='0') else '0' when (pr1='0');
   -- DFF2
   q2 <= d2 when (clk2'EVENT AND clk2='1') else '0' when (clr2='0') else '1' when (pr2='0');
   qb2 <= not d2 when (clk2'EVENT AND clk2='1') else '1' when (clr2='0') else '0' when (pr2='0');
END behavior;
 ---------------------------------------