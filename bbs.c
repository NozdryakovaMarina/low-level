#include <stdio.h>


int main() {

	const int p = 259;
	const int q = 563; 
	unsigned int m = p * q;
	int n = 100; 

	unsigned int x;
	printf("Enter the starting number: ");
	(void)scanf("%u", &x);
 
	for (int i = 0; i < n; i++) {  
		x = (x * x) % m;
		unsigned int low_byte = x & 0xFF; 
		printf("%u\n", low_byte);  
	}
	return 0;
}