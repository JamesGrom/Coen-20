//James Grom
//functions.s
//this is my code for Lab2a of COEN 20
	.syntax unified
	.cpu	cortex-m4
	.text
	
	//int32_t Add(int32_t a, int32_t b);
		.global	Add
		.thumb_func
	Add:
		//write assembly code for the 'Add' function
		ADD R0,R0,R1 //add a and  stored in R1 and R0 respectively
		BX LR	//return the value in R0

	//int32_t Less1(int32_t a);
		.global	Less1
		.thumb_func
	Less1:
		//write assembly code for the 'Add' function
		SUB R0,R0,1 //add 1 to a which is stored in R0
		BX LR //return value in R0
		
	//int32_t Square2x(int32_t x);
		.global	Square2x
		.thumb_func
	Square2x:
		//write assembly code for the 'Add' function
		PUSH {LR} //push the List Register to the stack to remember its value
		ADD R0,R0,R0 //add x to itself (stored in R0)
		BL Square //square the value stored in R0
		POP {LR} //pop the previous list register from the stack to get initial LR
		BX LR //return value in R0
	//int32_t Last(int32_t x);
		.global Last
		.thumb_func
	
	Last:
		//write assembly code
		PUSH {R4,LR} //save the values of LR and R4 in the stack
		MOV R4,R0 //save the value of R0 in the temp register
		BL SquareRoot //square x stored in R0
		ADD R0,R0,R4 //add x stored in R4 and square root of x stored in R0 into R0
		POP {R4,LR} //pop the previous values of LR and R4 from the stack 
		BX LR //return R0
		.end
		