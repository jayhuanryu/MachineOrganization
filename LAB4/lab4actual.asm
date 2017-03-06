.ORIG X3000
	AND R3, R3, #0	;CLEARS R3
	AND R4, R4, #0  ;CLEARS R4
	AND R2, R2, #0	;CLEARS R2
	AND R1, R1, #0	;CLEARS R1
	ADD R3, R3, #1	;ADDS 1 TO R3 
	ADD R4, R4, #1	;ADDS 1 TO R4
 	LDI R7, FNP	;LOADS FIBINACHI PLACE INTO R7
	ADD R7, R7, #-2 ;MINUSES 2 TO REMOVE R3 AND R4 = 1
	LOOP	ADD R5, R4, R3	;ADDS R3 AND R4 TOGETHER TO FIND THE NEXT FIBANOCHIE NUMBER;
	ADD R3, R4, #0 	;PLACES R4 IN R3
	ADD R4, R5, #0  ;PLACE R5 IN R4
	ADD R7, R7, #-1 ;DECREMENTS THE LOOP
	BRp LOOP	;IF R7 POSITIVE BEGINS THE LOOP AGAIN
	HALT
FNP	.FILL X3100	
	.END