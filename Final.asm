;Josue Salcedo, Guillermo Castillo, Omar Lucatero
;CIS11 Final Project
;This project is not complete/ will not run. We could not figure out how to have
;the program branch when the numbers were too large were we got an error 
;from (100-90)(89-79) etc. 

.ORIG x3000				;Origination Address
							
LEA R0, PROMPT				;load effective address of label 

PUTS					;Display Prompt using PUTS
IN					;Get user input

AND R1, R1, #0				;Clear R1
ADD R1, R0, #0				;COPY INPUT FROM R0 TO R1, Store input value to R3
			
AND R2, R2, #0				;Clear R2
AND R4, R4, #0				;Cear R4

;*********************Number is multiplied by 10************
ADD R2, R1, R1			
ADD R4, R2, R2
ADD R1, R4, R4	
ADD R1, R1, R2				;Number is multiplied by 10 


;*******************Ask for second number*****************

LEA R0, PROMPT2

PUTS
IN					;Get user second number
ADD R5, R0, x0				;Copy number to R5
ADD R1, R5, R1				;Add number to get number +second number

	



LD R6, ASCII				;Load ASCII value of x30 (48)	
ADD R1, R1, R6				;ADD ASCII value
STI R1, GRADE1				;Store value of grade in GRADE1
ADD R0, R1, #0				;Copy R1 into R0 to display with TRAP x21
OUT

; **********************End of first grade **********
;Repeat for other grades



JSR IFSTA				;Jump to IFSTA subroutine



IFSTA	LD R1, GRADE1			;If statement for A grade
	NOT R1, R1
	LDR R2, GRADE1

	BRn IFSTAB			;Branch to statement for a B grade




AND R1, R1, x0		;clear R1
LD R1, GRADE1		;Load grade 1 into R1.
LD R2, GRADE2		;Load grade  into R1
LD R3, GRADE3		;Load drade 2 into R3
LD R4, GRADEA		;Load gradde average into R4

ADD R6, R1, R2
ADD R6, R6, R3		; the sum of all the grades will be in R5

ADD R0, R6, R5		;Add ASCII
OUT 			; Output the Grade Average




HALT



PROMPT .STRINGZ "\nInput first number: "      ;Declare String Value
PROMPT2 .STRINGZ "\nInput second number: "
ASCII .FILL x30				;ASCII offset
NASCII .FILL xFFD0
GRADE1 .FILL x3001			;Location for first grade
GRADE2 .FILL x3002			;Location for second grade
GRADE3 .FILL x3003			;location for third grade
GRADEA .FILL x3004			;Location for grade average

.END					;End Program

