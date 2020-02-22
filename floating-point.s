				.syntax		unified
				.cpu		cortex-m4
				.text		
				.global		Discriminant
				.thumb_func
				// float Discriminant(float a, float b, float c);
Discriminant:

				BX LR
			
				.global		Quadratic
				.thumb_func
				// float Quadratic(float x, float a, float b, float c);
Quadratic:
		
				BX LR
			
				.global		Root1
				.thumb_func
				// float Root1(float a, float b, float c);
Root1:
		
				.global		Root2
				.thumb_func
				// float Root2(float a, float b, float c);
Root2:
				BX LR		
				.end
				