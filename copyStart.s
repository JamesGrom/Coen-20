// Vineet Joshi
// October 10, 2019
// copy.s
// This is my starter code for Lab3 of COEN 20.

// If you have never encountered void pointers before:
// 		A void pointer is a pointer that has no associated data type with it.
// 		A void pointer can hold address of any type and can be typcasted to any type.
// (Source: "GeeksforGeeks")

		.syntax		unified
		.cpu		cortex-m4
		.text
		
		.global		UseLDRB
		.thumb_func
		// void UseLDRB(void *dst, void *src);
UseLDRB:
		// TODO: Write your Assembly code for the 'UseLDRB' function.
	
		.global		UseLDRH
		.thumb_func
		// void UseLDRH(void *dst, void *src);
UseLDRH:
		// TODO: Write your Assembly code for the 'UseLDRH' function.
	
		.global		UseLDR
		.thumb_func
		// void UseLDR(void *dst, void *src);
UseLDR:
		// TODO: Write your Assembly code for the 'UseLDR' function.
	
		.global		UseLDRD
		.thumb_func
		// void UseLDRD(void *dst, void *src);
UseLDRD:
		// TODO: Write your Assembly code for the 'UseLDRD' function.
	
		.global		UseLDM
		.thumb_func
		// void UseLDM(void *dst, void *src);
UseLDM:
		// TODO: Write your Assembly code for the 'UseLDM' function.
	
		.end