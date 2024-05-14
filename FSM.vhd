LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FSM IS
	PORT(CLK: IN STD_LOGIC;
			R1, R2, R3, ENT: IN INTEGER RANGE 0 TO 999;
			LEVEL: OUT INTEGER RANGE 1 TO 5;
			R: OUT INTEGER RANGE 0 TO 999;
			TIEMPO: OUT INTEGER RANGE 0 TO 5;
			VER: OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE BEAS OF FSM IS
TYPE EDOS IS (INI, E1, E2, E3, LOSE, WIN);
SIGNAL PRES: EDOS := INI;
SIGNAL T,X,Z: INTEGER RANGE 000 TO 999:=000;
BEGIN

	PROCESS(R1, R2, R3, ENT, CLK)
	BEGIN
		IF RISING_EDGE(CLK) THEN
			CASE PRES IS
				WHEN INI => 
					PRES <= E1;
				WHEN E1 => 
					LEVEL <= 1;
					TIEMPO <= 5;
					T <= ENT;
					R <= R1;
					IF T /= 000 THEN
						IF R1 = ENT THEN
							PRES <= E2;
						ELSE 
							PRES <= LOSE;
						END IF;
					END IF;
					
				WHEN E2 =>
					VER <= '1';
					LEVEL <= 2;
					TIEMPO <= 3;
					
					R <= R2;
					IF R2 = ENT THEN
						VER <= '0';
						PRES <= E3;
					ELSE 
						PRES <= LOSE;
					END IF;
					
				WHEN E3 =>
					LEVEL <= 3;
					TIEMPO <= 1;
					R <= R3;
					IF R3 = ENT THEN
						PRES <= WIN;
					ELSE 
						PRES <= LOSE;
					END IF;
					
				WHEN LOSE =>
					VER <= '1';
					LEVEL <= 5;
					
				WHEN WIN =>
					LEVEL <= 4;				
				
			END CASE;
		END IF;
	END PROCESS;

END BEAS;
