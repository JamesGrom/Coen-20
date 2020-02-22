// James Grom
// October 30, 2019
// convert.c

#include <stdint.h>

// Converts the given array of bits to an UNSIGNED int.
// For example, 11010001 should be converted to 209.
uint32_t Bits2Unsigned(int8_t bits[8]) {
	// Use hint provided at the end of the Lab 1 PDF! (aka, the "simple loop")
	int i,answer=0;
	for(i=7;i>=0;i--)
	{
		answer=2*answer+bits[i];
	}
	return answer;
}

// Converts the given array of bits to a SIGNED int.
// For example, 11010001 should be converted to -47.
int32_t Bits2Signed(int8_t bits[8]) {
	// Hint: call the above function 'Bits2Unsigned', and convert the result to int32_t.
	int answer=Bits2Unsigned(bits);
	answer=answer-256;
	return answer;
}

// Increments the given array of bits.
// For example, 11010001 should be incremented to 11010010.
void Increment(int8_t bits[8]) {
	int i;
	for(i=0;i<=7;i++)
	{
		if(bits[i]==1)
		{
			bits[i]=0;
		}
		else
		{
			bits[i]=1;
			break;
		}
	}
}

// Converts the given n value (which is UNSIGNED) to an array of bits.
// For example, if the value of n is 209, the array of bits should be 11010001.
void Unsigned2Bits(uint32_t n, int8_t bits[8]) {
	for(int i=0;i<=7;i++)
	{
		bits[i]=n%2;
		n=n/2;
	}
}
