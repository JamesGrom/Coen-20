//James Grom
//October 29
//Lab 5 (lab4b)

		.syntax		unified
		.cpu		cortex-m4
		.text
		
		.global 	WritePixel
		.thumb_func
	//void WritePixel(int x, int y, uint8_t colorIndex, uint8_t frameBuffer[256][240]);
	WritePixel:
		PUSH {LR,R4} //allow to use save register
		MOV R4,240 //load 240 into an operand
		MLA R4,R4,R1,R0 //finding the offset value to add to the adress stored in R3 (y*240+x)
		STR R2,[R3,R4] //store R2 (the colorIndex) into the correct adress in the 2d bitmap array
		POP {PC,R4} //return to location where function was called
	
	
		.global		BitmapAddress
		.thumb_func
	//uint8_t *BitmapAddress(char ascii, uint8_t *fontTable, int height, int width) ;
	BitmapAddress :
		PUSH {LR, R4}
		SUB R0,R0,' ' //accounting for skipping special characters index 0 starts after ' '
		MOV R4,7
		ADD R3,R3,R4	//calculate the bytes per row (font width +7)
		MOV R4,8
		SDIV R3,R3,R4 //n is stored in R3, bytes per row (fontwidth +7)/8
		MUL R3,R3,R2//calculate the offset per character = n*height= (# of bytes used per character)
		MUL R0,R0,R3 //finds the overall offset to get to character given by the ascii value
		ADD R0,R1,R0 //stores the adress of the offset character
		POP {PC,R4}
	
		.global		GetBitmapRow
		.thumb_func
	//uint32_t GetBitmapRow(uint8_t *rowAdrs) ;
	GetBitmapRow:
		LDR R0,[R0] //load the dereferenced value into R0
		REV R0,R0 //reverse the bit string
		BX LR //return to the location function was called from
		
	.end
	
	