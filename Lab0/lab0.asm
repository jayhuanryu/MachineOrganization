	;LC-3 Program that displays
	;"Hello World!" to the Console

	.ORIG x3000 
	LEA R0, HW ;load address
	PUTS ;output string
	HALT ;end program

HW	.STRINGZ "HELLO WORLD!"
	.END