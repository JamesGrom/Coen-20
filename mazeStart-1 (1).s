			.syntax		unified
			.cpu		cortex-m4
			.text		
			.global		GetNibble
			.thumb_func
			// uint32_t GetNibble(void *nibbles, uint32_t which);
GetNibble:
			BX LR		
	
			.global		PutNibble
			.thumb_func
			// void PutNibble(void *nibbles, uint32_t which, uint32_t value);
PutNibble:
			BX LR
			.end