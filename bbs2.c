#include <stdio.h>


int main() {
	int p = 259;
	int q = 563;
	int m = p * q;
	int n = 100;

	unsigned int x;
	printf("Enter the starting number: ");
	(void)scanf("%u", &x);
	int i = 0;

cycle_start:
	if (i == n) goto cycle_end; {
		x = (x * x) % m;
		unsigned int low_byte = x & 0xFF;
		printf("%u\n", low_byte);
		i = i + 1;
	}
goto cycle_start;
cycle_end:
	return 0;
}