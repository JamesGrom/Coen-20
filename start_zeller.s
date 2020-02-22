		.syntax		unified
		.cpu		cortex-m4
		.text
		
		.global		Zeller1
		.thumb_func
		//                           R0          R1          R2          R3
		// uint32_t Zeller1(uint32_t k, uint32_t m, uint32_t D, uint32_t C);
		// This function can use multiply and divide instructions.
Zeller1:
		BX LR
		
		.global		Zeller2
		.thumb_func
		//                           R0          R1          R2          R3
		// uint32_t Zeller2(uint32_t k, uint32_t m, uint32_t D, uint32_t C);
		// This function CANNOT use divide instructions (SDIV or UDIV).
Zeller2:
		BX LR
		
		.global		Zeller3
		.thumb_func
		//                           R0          R1          R2          R3
		// uint32_t Zeller3(uint32_t k, uint32_t m, uint32_t D, uint32_t C);
		// This function CANNOT use multiply instructions (MUL, MLS, etc.).
Zeller3:
		BX LR
		
		.end