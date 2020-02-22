		.syntax		unified
		.cpu		cortex-m4
		.text
		.global		MatrixMultiply
		.thumb_func
		// void MatrixMultiply(int32_t a[3][3], int32_t b[3][3], int32_t c[3][3]);
MatrixMultiply:

		
		BX LR	
		.end