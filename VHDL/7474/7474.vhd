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
   DFF1: PROCESS (pr1, clr1, clk1)
      BEGIN
      IF (clr1='0' AND pr1='0') THEN
         q1 <= '1';
         qb1 <= '1';
      ELSIF (clr1='0') THEN
         q1 <= '0';
         qb1 <= '1';
      ELSIF (pr1='0') THEN
         q1 <= '1';
         qb1 <= '0';
      ELSIF (clk1'EVENT AND clk1='1') THEN
         q1 <= d1;
         qb1 <= not d1;
      END IF;
   END PROCESS DFF1;
   
   DFF2: PROCESS (pr2, clr2, clk2)
      BEGIN
      IF (clr2='0' AND pr2='0') THEN
         q2 <= '1';
         qb2 <= '1';
      ELSIF (clr2='0') THEN
         q2 <= '0';
         qb2 <= '1';
      ELSIF (pr2='0') THEN
         q2 <= '1';
         qb2 <= '0';
      ELSIF (clk2'EVENT AND clk2='1') THEN
         q2 <= d2;
         qb2 <= not d2;
      END IF;
   END PROCESS DFF2;
   
END behavior;
 ---------------------------------------