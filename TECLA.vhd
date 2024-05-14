LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity TECLA is
	port(
		COL: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		FIL: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		TEC: OUT INTEGER RANGE 0 TO 9;
		CLK: IN STD_LOGIC
	);
end entity;

architecture BEAS of TECLA is
SIGNAL CUENTA: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL HAB: STD_LOGIC;
begin
	process(clk)
	begin
		if FALLING_EDGE (CLK) THEN
			if HAB = '1' THEN
				CUENTA<=CUENTA;
			elsif CUENTA="1111" THEN
				CUENTA<="0000";
			else
				CUENTA<=CUENTA + "0001";
			end if;
		end if;
	end process;
	
	WITH CUENTA(1 DOWNTO 0) SELECT
		HAB <= NOT COL(0) WHEN "00", --MSB
			    NOT COL(1) WHEN "01",
		       NOT COL(2) WHEN "10",
             NOT COL(3) WHEN "11"; --LSB
              
   WITH CUENTA (3 DOWNTO 2) SELECT 
		FIL <= "1110" WHEN "00",
			    "1101" WHEN "01",
			    "1011" WHEN "10",
			    "0111" WHEN "11";
				 		 
	WITH CUENTA SELECT
				 
				 TEC <=  0 WHEN "0010", --0
				  1 WHEN "1111", --1
				  2 WHEN "1110", --2
				  3 WHEN "1101", --3
				  4 WHEN "1011", --4
				  5 WHEN "1010", --5
				  6 WHEN "1001", --6
				  7 WHEN "0111", --7
				  8 WHEN "0110", --8
				  9 WHEN OTHERS;
end BEAS;