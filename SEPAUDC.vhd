LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SEPAUDC IS
	PORT(	R: IN INTEGER RANGE 0 TO 999;
			T: IN INTEGER RANGE 0 TO 5;
			U, D, C: OUT INTEGER RANGE 0 TO 10);
			
END ENTITY;

ARCHITECTURE BEAS OF SEPAUDC IS
SIGNAL TIEMPO: INTEGER RANGE 0 TO 5 :=0;
BEGIN
	PROCESS(TIEMPO)
	BEGIN
		IF TIEMPO=T THEN
			U <= 10;
			D <= 10;
			C <= 10;
		ELSE 
			TIEMPO <= TIEMPO + 1;
			U<=R MOD 10;
			D<=(R/10) MOD 10;
			C<= (R/100) MOD 10;
		END IF;
	END PROCESS;
	

END BEAS;