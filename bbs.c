#include <stdio.h>


int main() {

	int p = 259;
	int q = 563; 
	int m = p * q;
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