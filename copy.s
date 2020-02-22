//James Grom
//October 15,2019
//copy.s
//this is my code for lab3 of COEN20

		.syntax		unified
		.cpu		cortex-m4
		.text
	
		.global UseLDRB
		.thumb_func
	//void UseLDRB(void *dst, void *src);
	UseLDRB:
		//write assembly code for 'UseLDRB' function
		.REPT 512 //repeat this code 512 times copy 1 byte 512 times
		LDRB R2,[R1],1 //copy the byte scr is pointing to into r2
		STRB R2,[R0],1 //copy the byte in r2 into where r0 is pointing
		.ENDR //end the loop
		BX LR //return to main
		
		
		.global UseLDRH
		.thumb_func
	//void UseLDRH(void *dst, void *src);
	UseLDRH:
		.REPT 256
		LDRH R2,[R1],2 //copy the halfword r1 is pointing to 
		STRH R2,[R0],2 //copy the halfword in r2 into where r0 is pointing
		.ENDR
		BX LR
		
		.global		UseLDR
		.thumb_func
	//void UseLDR(void *dst,void *src);
	UseLDR:
		.REPT 128
		LDR R2,[R1],4 //copy the register value pointed by r1 into r2
		STR R2,[R0],4// copy the r2 into the register r0 is pointing to 
		.ENDR
		BX LR
	
		.global		UseLDRD
		.thumb_func
	//void UseLDRD(void *dst,void *src);
	UseLDRD:
		.REPT 64
		LDRD R2,R3,[R1],8 //copy the double value pointed by r1 into r2 and r3
		STRD R2,R3,[R0],8 //copy r2 and r3 into the registers pointed by r0
		.ENDR
		BX LR
		
		.global		UseLDM
		.thumb_func
	//void UseLDM(void *dst,void *src);
	UseLDM:
		PUSH {R4-R11} //store the values in r4-r11 into the stack
		.REPT 16
		LDMIA R1!,{R4-R11} //copy the 8 registers pointed by r1 into r4-r11
		STMIA R0!,{R4-R11} //copy the values fromr4-r11 into R0
		.ENDR
		POP {R4-R11} //return the values in r4-r11 to their original state before function call
		BX LR
		
		
		
		
			