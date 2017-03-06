; Class:CSE313 Machine Organization Lab
; Section:01
; Instuctor : Taline Georgiou
; Term: Spring 2014
; Names: James Moseley, Jayhuan Ryu
; Lab#2:  Arithmetic Function
; Description: operating arithmetic function and conditional functions

	.ORIG x3000 ;starts at this momory location
	LDI R0,X ; Put X in R0
	LDI R1,Y ; PUt Y in R1

	;x-y
	NOT R3,R1 ; 1's complement of Y
	ADD R3, R3, x1 ; 1's comple + 1
	ADD R3, R0, R3 ; Add X+(-Y)
	STI R3,X_Y

	;absolute value of X
	ADD R2, R0,#0 ; doesn't change x value store in R2
	BRzp abs1; x is positivie or 0 then jump into abs1
	NOT R2,R2 ; if x is negative take 1's complement
	ADD R2,R2, x1 ; completing 1's complement
abs1	STI R2, absX
	
	;absolute value of Y
	ADD R3, R1, #0 ; doesn't change y value store in R2
	BRzp abs2; y is positive or 0 jump into abs2
	NOT R3, R3 ; if y is negative take 1's comple
	ADD R3, R3, x1 ; completing 1's complement
abs2	STI R3, absY ; storing it indirectly in absY

	;finding Z
	NOT R4, R3 ; looking for -|Y|
	ADD R4, R4, #1 ; completing 1's comp
	ADD R4,R2, R4 ; |X|-|Y|
	BRz store
	BRn neg
	AND R4, R4, x0 ; R4 = 0 -> clearing register
	ADD R4, R4, x1 ; R4 = 1
        BR store ; move to store to skip neg
neg	AND R4, R4, #0 ;R4 = 0
	ADD R4, R4, #2 ;R4 = 2
store	STI R4, Z ; 

	HALT
X	.FILL x3120 ; x is in memory x3120
Y	.FILL x3121 ; y is in memory x3121
X_Y	.FILL x3122 ; X_Y is in memory x3122
absX	.FILL x3123 ; absolute x is in memory x3123
absY	.FILL x3124 ; absolute y is in memoryx3124
Z	.FILL x3125 ; store Z in x3125

	.END ; finishes the program