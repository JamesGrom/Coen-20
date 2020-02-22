//James Grom
//December 3rd
//lab 9 (lab8b)

		.syntax		unified
		.cpu		cortex-m4
		.text
		
		.global		Discriminant
		.thumb_func 
	//float Discriminant(float a, float b, float c);
	Discriminant:
	
		VMUL.F32 S1,S1,S1 //b*b
		VMOV 	 S3,4.0 //s3=4.0
		VMUL.F32 S3,S3,S0 //4.0*a
		VMUL.F32 S3,S3,S2 //4.0*a*c 
		VSUB.F32 S0,S1,S3 //b*b - 4.0*a*c
		BX       LR
		
		.global		Quadratic
		.thumb_func
	//float Quadratic(floatx,floata,floatb,floatc);
	Quadratic:	
		VMUL.F32 S2,S2,S0 //bx
		VMUL.F32 S0,S0,S0 //x*x
		VMUL.F32 S0,S0,S1 //axx
		VADD.F32 S0,S0,S2 //xx+bx
		VADD.F32 S0,S0,S3 //xx+bx+c
		BX 	LR
	
		.global		Root1
		.thumb_func
	//float Root1(floata,floatb,floatc)
	Root1:
		PUSH 		{R4,R5,LR}
		VMOV		R4,S0 //R4 holds a
		VMOV		R5,S1//R5 holds b 
		BL	Discriminant
		VSQRT.F32	S5,S0 //sqrt(disc)
		VMOV 		S4,2.0 
		VMOV 		S0,R4//a in s0
		VMOV		S1,R5 // b in s1
		VMUL.F32	S0,S0,S4//2a
		VNEG.F32	S1,S1//-b
		VADD.F32 	S1,S1,S5
		VDIV.F32	S0,S1,S0
		POP			{R4,R5,PC}
		
		.global		Root2
		.thumb_func
	//float Root2(floata,floatb,floatc)
	Root2:
		PUSH 		{R4,R5,LR}
		VMOV		R4,S0 //R4 holds a
		VMOV		R5,S1//R5 holds b 
		BL	Discriminant
		VSQRT.F32	S5,S0 //sqrt(disc)
		VMOV		S4,2.0 
		VMOV 		S0,R4//a in s0
		VMOV		S1,R5 // b in s1
		VMUL.F32	S0,S0,S4//2a
		VNEG.F32	S1,S1//-b
		VSUB.F32 	S1,S1,S5 //-b-sqrtt(disc)
		VDIV.F32	S0,S1,S0
		POP			{R4,R5,PC}
		
		
	.end