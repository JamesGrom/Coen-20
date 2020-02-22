//James Grom
//November 19th 
//lab8 (lab7a)

		.syntax		unified
		.cpu		cortex-m4
		.text
		
		.global		Zeller1
		.thumb_func
	//uint32_t Zeller1(uint32_t k, uint32_t m, uint32_t D , uint32_t C)
Zeller1:
//R0 stores f
		PUSH {R4}
		ADD R0,R0,R2 //f= K+D
		ADD R0,R0,R2,LSR 2 //f=f+D/4
		ADD R0,R0,R3, LSR 2 //f=f +C/4
		SUB R0,R0,R3,LSL 1 //f=f-2*C 
		
		//temp stored in R1
		LDR R4,=13
		MUL R1,R1,R4 //temp =13m
		SUB R1,R1,1 //temp = temp-1
		LDR R4,=5
		UDIV R1,R1,R4 //temp =temp/5
		ADD R0,R0,R1 //f=f+temp
		LDR R4,=7
		SDIV R1,R0,R4 //temp=f/7
		MUL R1,R1,R4 //temp=temp *7
		SUB R1,R0,R1 //temp=f-temp
		
		CMP R1,0
		IT LT 
		ADDLT R1,R1,R4 //if temp<0 then temp=temp+7
		MOV R0,R1
		POP {R4}
		BX LR

		.global		Zeller2
		.thumb_func
		//uint32_t Zeller2(uint32_t k, uint32_t m, uint32_t D, uint32_t C)
Zeller2:
		PUSH {R4}
		ADD R0,R0,R2 //f=k+D
		ADD R0,R0,R2,LSR 2 //f=f+(D>>2)
		ADD R0,R0,R3,LSR 2 //f=f+(C>>2)
		SUB R0,R0,R3,LSL 1 //f=f-2C
		
		LDR R4,=13
		MUL R1,R1,R4 //temp=13m (stored in R1)
		SUB R1,R1,1
		LDR R4,=858993459 //2^32/5
		SMULL R4,R1,R1,R4 //temp=temp/5 (temp is stored in R1)
		ADD R1,R0,R1 //f=f+temp
		
		LDR R4,=613566757 //2^32/7
		SMULL R4,R0,R1,R4 //temp=temp/7
		LDR R4,=7
		MLS R0,R0,R4,r1 //temp=temp*7
		CMP R0,0
		IT LT
		ADDLT R0,R0,7 //temp=temp+7
		
		POP {R4}
		BX LR
		
		.global		Zeller3
		.thumb_func
		// Zeller3(k,m,D,C)
Zeller3:
		ADD R0,R0,R2
		ADD R0,R0,R2,LSR 2
		ADD R0,R0,R3,LSR 2
		SUB R0,R0,R3,LSL 1
		
		ADD R2,R1,R1,LSL 2
		ADD R1,R2,R1,LSL 3
		
		//temp stored in R4
		SUB R1,R1,1
		//temp stored in R1
		LDR R2,=5
		UDIV R1,R1,R2
		ADD R0,R0,R1
		
		LDR R1,=7
		SDIV R2,R0,R1
		RSB R2,R2,R2,lsl 3
		SUBS R0,R0,R2	
		AND R1,R1,R0,ASR 31
		ADDS R0,R0,R1

		BX LR
		.end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		