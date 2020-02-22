//James Grom
// november 5th
//lab 6 (lab5a)

		.syntax		unified
		.cpu		cortex-m4
		.text
		
		.global		MatrixMultiply
	// void MatrixMultiply2(float a[3][3], float b[3][3], float c[3][3])
	
MatrixMultiply:
		PUSH {R4-R9, LR}
		
		//initializations
		MOV R4,R0 //R4=a[][]
		MOV R5,R1 //R5=b[][]
		MOV R6,R2 //R6=c[][]
		
		LDR R7,=0 //row=0		
startrow:	CMP R7,2  
		BHI done //if row>=3 end forrow loop
		
		LDR R8,=0 //col =0		
startcol:	CMP R8,2 
		BHI	endforrow //if col>=3 end forcol loop
			
		//a[row][col]=0
		MOV R3,3
		MLA R3,R3,R7,R8 //store increment value in R1 
		LDR R0,=0
		STR R0,[R4,R3,LSL 2] // a[row][col]=0;
	
		LDR R9,=0 //k=0	
startK:	CMP R9,2
		BHI endforcol 
		
		//float tempA=a[row][col] (store in R0)
		MOV R3,3
		MLA R3,R3,R7,R8 //store value of (3*row +col) in R1
		LDR R0,[R4,R3,LSL 2]
		
		//float tempC=c[k][col] (store in R2)
		MOV R3,3
		MLA R3,R3,R7,R9
		LDR R1,[R5,R3,LSL 2]
		
		//float tempB=b[row][k] (store in R1)
		MOV R3,3
		MLA R3,R7,R9,R8
		LDR R2,[R6,R3,LSL 2]
		
		BL MultAndAdd
		
		//a[row][col]=result
		MOV R3,3
		MLA R3,R3,R7,R8
		STR R0,[R4,R3,LSL 2]
	
		ADD R9,R9,1
		//STR R9,k
		B startK //move back to top of inner for loop
		
endcol:
		ADD R8,R8,1
		//STR R8,col
		B startcol
		
endrow:
		ADD R7,R7,1
		//STR R7,row
		B	startrow

done:
		POP {R4-R9, PC}
		.end
			
		
		