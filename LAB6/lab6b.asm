	.ORIG x3000

	; loads the data
	LDI R0, DAY ; loads the day into R0
	ST R0, SaveReg0
	LDI R1, MON ; loads the month into R1
	ST R1, SaveReg1
	LDI R2, YR  ; loads the year into R2

	;check the values of zeller's formula
	ADD R1, R1,#-2 ; to find m
	BRp GO
	ADD R1, R1, #12
	ADD R2, R2, #-1 ; to find D
	
GO	;getting -2C
	JSR CLOOP


	;getting C/4
	JSR CDLOOP
	
	;getting D/4
	JSR DDLOOP

	;getting (13m-1)/5
	JSR TGO
	
	;getting f
	ADD R7,R0,R2
	LD ST0,SaveReg0
	ADD R7,R7,R0
	ADD R7,R7,R5
	ADD R7,R7,R4
	ADD R7,R7,R3

	PUTS ; display day of the week on screen	
	HALT

DAY	.FILL x31F0
MON	.FILL x31F1
YR	.FILL x31F2

CLOOP	ADD R3,R3,#1
	ADD R2,R2,#-100
	BRp CLOOP
	ADD R2,R2,#100 (get D)
	ST R2,SaveReg2
	ADD R3,R3,#-1 ( get C)
	ADD R3,R3,R3 (compele 2C)
	NOT R3,R3,R3 (1's complement to -2C)
	ADD R3,R3,#1 (completing 2's complement)
	RET

CDLOOP	ADD R4,R4,#1 (R4 will be Quotient of C/4)
	ADD R3,R3,#-4
	BRp CDLOOP
	ADD R4,R4,#-1
	RET

DDLOOP	ADD R5,R5,#1
	ADD R2,R2,#-4
	BRp DDLOOP
	ADD R5,R5,#-1
	LD R2,SaveReg2
	RET

TGO	AND R0,R0,#0 ; clear R7
	ADD R0,R0,#13
TLOOP	ADD R1,R1,R1
	ADD R0,R0,#-1
	BRp TLOOP
	ADD R0,R0,#-1
	AND R0,R0,#0
TDLOOP	ADD R0,R0,#1
	ADD R1,R1,#-5
	BRp TDLOOP
	ADD R0,R0,#5
	ADD R0,R0,#-1 
	RET

DAYS	.STRINGZ "Sunday   "
	.STRINGZ "Monday   "
	.STRINGZ "Tuesday  "
	.STRINGZ "Wednesday"
	.STRINGZ "Thursday "
	.STRINGZ "Friday   "
	.STRINGZ "Saturday "
	.END
