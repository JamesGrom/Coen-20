		.syntax		unified
		.cpu		cortex-m4
		.text
		
		.global		WritePixel
		.thumb_func
		// void WritePixel(int x, int y, uint8_t colorIndex, uint8_t frameBuffer[256][240]);
WritePixel:
		// TODO: Write your Assembly code for the 'WritePixel' function.
		BX LR
		
		.global		BitmapAddress
		.thumb_func
		// uint8_t *BitmapAddress(char ascii, uint8_t *fontTable, int height, int width);
BitmapAddress:
		// TODO: Write your Assembly code for the 'BitmapAddress' function.
		BX LR
		
		.global		GetBitmapRow
		.thumb_func
		// uint32_t GetBitmapRow(uint8_t *rowAdrs);
GetBitmapRow:
		// TODO: Write your Assembly code for the 'GetBitmapRow' function.
		BX_LR
		
		.end