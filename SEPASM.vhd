LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SEPASM IS
	PORT(ALET: IN INTEGER RANGE 0 TO 999999999;
			R1, R2, R3: BUFFER INTEGER RANGE 0 TO 999);
END ENTITY;

ARCHITECTURE BEAS OF SEPASM IS
BEGIN

R1<=ALET MOD 1000;
R2<=((ALET-R1)/1000) MOD 1000;
R3<= ((ALET-R2)/1000000);

END BEAS;
