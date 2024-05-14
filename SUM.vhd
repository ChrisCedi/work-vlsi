LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SUM IS
	PORT(CLK: IN STD_LOGIC;
	FIN: OUT INTEGER RANGE 0 TO 999;
			  R2,R1,NUM: IN INTEGER RANGE 0 TO 9); -- PARA LOS 8 SEG DEL DISPLAY
END ENTITY;

ARCHITECTURE BEAS OF SUM IS
TYPE ESTADOS IS (INICIO, E1, E2, E3);
SIGNAL PRES: ESTADOS := INICIO;
SIGNAL F1, F2, F3 : INTEGER RANGE 0 TO 9;
BEGIN

	PROCESS(R2,R1,NUM,CLK)
	BEGIN
		IF RISING_EDGE(CLK) THEN
			CASE PRES IS
				WHEN INICIO =>
					F1<=NUM;
					PRES<=E1;
				WHEN E1 => 
					F2<=R1;
					PRES<=E2;
				WHEN E2 => 
					F3<=R2;
					PRES<=E3;
				WHEN E3 => 
					FIN<=(NUM+(R1*10)+(R2*100));
			END CASE;
		END IF;
	END PROCESS;

END BEAS;
