#include <cmath>
#include <iostream>


namespace var5 {
	struct S {
		float c = 6312;
	};

	void medium_check(bool flag) {
		if (flag) puts("Access granted");
		else puts("Access denied");
	}

	void access5(int edx, int r8, double r8_8, float xmm0) { 
		S tmp;
		float result = 0;
		if (r8 >> 32 != r8) {
			medium_check(false);
			return;
		}
		else {
			if (std::isinf(r8_8)) {
				result = float(edx) - xmm0;
				if (result == tmp.c) {
					medium_check(true);
					return;
				}
				else {
					medium_check(false);
					return;
				}
			}
			else {
				medium_check(false);
				return;
			}
		}  
	}
}

int main() {
	var5::access5(6312, 0, std::numeric_limits<double>::infinity(), 0);
	return 0;
}