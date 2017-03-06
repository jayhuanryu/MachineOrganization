; Class:CSE313 Machine Organization Lab
; Section:01
; Instuctor : Taline Georgiou
; Term: Spring 2014
; Names: James Moseley, Jayhuan Ryu
; Lab#1: ALU operation
; Description: Basic ALU operations and testings

	.ORIG x3000 ; start at this memory location
	LEA R2, xFF; R2 <- PC+1+offset value PC is 3000 3000+xFF = x3100
	LDR R1,R2,x0 ; R1<-M[R2+x0] = m[x3100+x0] = m[x3100] R1 = X
	LDR R3,R2,x1 ; R3,_M[R2+x1] = m[x31000+x1]=m[x3101] R3 = Y LDR is reading

;x+y operation
	ADD R4,R1,R3 ; R4=R1+R3
	STR R4,R2,x2 ; x3100+x2=x3102(memeory location)

;X AND Y operation	
	AND R4,R1,R3 ; R4=R1*R3 (be able to reuse variable R4)
	STR R4,R2,x3 ; m[x3100+x3]=m[x3103](memory location) 

;X OR Y operation
	NOT R5, R1 ; invert x
	NOT R6, R3 ; invert y
	AND R4, R5,R6 ; AND
	NOT R4, R4 ; invert it again to make it OR function
	STR R4,R2,x4 ; store m[x3100+x4]=m[x3104]

;NOT X operation
	NOT R4,R1 ; Execute NOT operation
	STR R4,R2,x5 ; storing

;NOT Y operation
	NOT R4,R3 ; execute NOT operation
	STR R4,R2,x6 ; storing

;x+3 operation
	ADD R4,R1,x3 ;hex x decimal#
	STR R4, R2,x7 ; storing

;y-3 operation
	ADD R4,R3,x-3 ;x represent hex #
	STR R4,R2,x8 ; storing

;if x, even 0, odd 1
	AND R4,R1,X1;(BINARY HEXA# DECI# CARRY SAME JOB)
	STR R4,R2,X9 ;STORING

	HALT
	.END


	
	
	
