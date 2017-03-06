; Class:CSE313 Machine Organization Lab
; Section:01
; Instuctor : Taline Georgiou
; Term: Spring 2014
; Names: James Moseley, Jayhuan Ryu
; Lab#3:  Days of the week
; Description: operating arithmetic function and conditional functions

	.ORIG x3000 ;starts at this momory location
	LEA R0, PROMPT ; LOADS PROMPT ON R0
	PUTS ; DISPLAY ON THE MONITOR
	GETC ; Read one input character from the keyboard and store it into R0 without echoing the character to the console.
	
	ADD R3,R0,X0;
	ADD R3,R3,#-16
	ADD R3,R3,#-16
	ADD R3,R3,#-16 ; GET ASCII 0
	LEA RO, DAYS ; ADDRESS OF "SUNDAY' IN R0
	ADD R3, R3, X0 ; TO BE ABLE TO USE CONDITION CODES

;THE LOOP (4 INSTRUCTIONS) IMPLEMENTS R0 = RO+ 10 * I
LOOP	BRz DISPLAY
	ADD R0,RO,#10 GO TO NEXT DAY
	ADD R3,R3,#-1 DECREMENT LOOP VARIABLE
	BR LOOP

DISPLAY PUTS
	;CHECK VALIDITY OF THE NUMBER ENTERED, HALT OPERATION WHEN # IS INVALID
	
	BRz 
	HALT

NUM	.STRINGZ "PLEASE ENTER  THE NUMBER"

DAYS	.STRINGZ "SUNDAY   "
	.STRINGZ "MONDAY   "
	.STRINGZ "TUESDAY  "
	.STRINGZ "WEDNESDAY"
	.STRINGZ "THURSDAY "
	.STRINGZ "FRIDAY   "
	.STRINGZ "SATURDAY "

	.END

