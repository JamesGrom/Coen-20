		.syntax		unified
		.cpu		cortex-m4
		.text
		.global		MxPlusB
		.thumb_func
		// int32_t MxPlusB(int32_t x, int32_t mtop, int32_t mbtm, int32_t b);
		// Equation: y = mx + b, where m = mtop / mbtm.
		// Compute the value of y, and return it.
		// HINT: To compute value of m, use the equation at the bottom of the lab PDF!		
MxPlusB:
		
		BX LR	
		.end