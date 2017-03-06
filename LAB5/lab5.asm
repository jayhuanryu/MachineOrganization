;CLass:CSE313 Machine Organization Lab
;Instructor : Taline Georgiou
;Names : James Mosley, Jayhuan Ryu
;Lab #5 : Subroutnines : multiplication, division, modules
;Description : with the given two integers X and Y, this program will
;computer multiplication and division(find quotient and remainder)
	
	.ORIG x3000
	LDI R0, X	; X is now in R0
	LDI R1, Y	; Y is now in R1
	JSR MULTI	; Jump to Subroutine M
	STI R2, PRO	; Store
	LDI R0, X	; X is now in R0
	LDI R1, Y	; Y is now in R1
	JSR DIV
	STI R4, QUO	; Store quotient in QUO
	STI R0, REM	; Store remainder in REM
	HALT


X	.FILL x3100	; address where x is located
Y	.FILL x3101	; address where y is located
PRO	.FILL x3102	; address where product of XY is stored
QUO	.FILL x3103	; address where quotient of X/Y is stored
REM	.FILL x3104	; address where remainder of X/Y is stored

MULTI	AND R2,R0,R1	; check R0,R1 are not zeros
	BRz EXIT
	AND R2,R2,x0	; clears R2
	ADD R2,R2,x0	; initialize R2
	AND R5,R5,x0	; clears R5(keep track of sign of X)
	AND R6,R6,x0	; clears R6(keep track of sign of Y)
	ADD R5,R5,x0	; initialize R5
	ADD R6,R6,x0	; inintialize R6
	ADD R0,R0,x0	; just to check if x is positive or zero
	BRzp YC
	NOT R0,R0	;1's comple
	ADD R0,R0,x1	;+1 to complete 2's comple
	ADD R5,R5,x1	;to know X is negative
YC	ADD R1,R1,x0	; check if y is postive or zero
	BRzp MLOOP
	NOT R1,R1
	ADD R1,R1,x1
	ADD R6,R6,x1

; actual multiplication

MLOOP	ADD R2,R2,R0	; R2 = R2 + R0
	ADD R1,R1,x-1	; counting
	BRp MLOOP	; if R3 = p then go to the loop again
	ADD R5,R5,R6	
	BRz EXIT
	NOT R2,R2
	ADD R2,R2,x1
EXIT	RET

DIV	AND R2,R2,x0	; clears R2
	AND R3,R3,x0	; clears R3
	AND R5,R5,x0	; clears R5(keep track of sign of X)
	AND R6,R6,x0	; clears R6(keep track of sign of Y)
	ADD R5,R5,x0	; initialize R5
	ADD R6,R6,x0	; inintialize R6
	ADD R1,R1,x0	; check Y
	BRnp CHECK
	AND R0,R0,x0	; if y is zero store 0 to both quotient and remainder
	AND R4,R4,x0
	BR FIN
CHECK	ADD R1,R1,x0	; load y again
	BRp XCH		; y is positive go to check x
	NOT R1,R1	; if y is negative 1's comple
	ADD R1,R1,x1	; complete 2's comple
	ADD R6,R6,x1	; sign of y
XCH	ADD R0,R0,x0	; load R0 to check the signe of X
	BRzp JP
	NOT R0,R0	;1's comple
	ADD R0,R0,x1	;complete 2's comple
	ADD R5,R5,x1	; sign of x
; actual division

JP	ADD R3,R3,R1
	NOT R1,R1	; R1 = -R1
	ADD R1,R1,x1	; complete 2's comple
DLOOP	ADD R4,R4,x1	; counting quotient
	ADD R0,R0,R1	;
	BRp DLOOP	;
	ADD R0,R0,R3
	ADD R4,R4,x-1
	ADD R5,R5,R6
	BRz FIN
	NOT R4,R4
	ADD R4,R4,x1
	ADD R0,R0,x0
	BRz FIN
	NOT R0,R0
	ADD R0,R0,x1
FIN	RET
	
	.END