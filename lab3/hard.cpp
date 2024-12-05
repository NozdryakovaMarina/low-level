#include <cmath>
#include <iostream>


namespace var3 {
	struct S {
		int rdx = 10;
	};

	class C {
	public:
		int rcx = 127;
		int rdx_16 = 1;
		int rcx_c = 0;
		bool check(S* s) {
			auto r9 = this;
			auto r10 = this->rdx_16;
			auto edx = 0x128E3FB9;
			int i = 0;
			int eax = 0;
			int r8d = 0;
			int rcx_4 = 0;

			while (1) {
				auto r8d = reinterpret_cast<uintptr_t>(r9);
				auto rcx = 0;
				if (r8d == 0) break;

				eax = r8d;
				r9++;
				eax ^= edx;
				eax *= this->rcx;
				edx = 0;
				eax += rcx_4;
				eax /= s->rdx;
				
				if (++i == r10) break;
			}

			if (this->rcx_c == edx) return true;
			else return false;
		}
	};

	void hard_check(bool flag) {
		if (flag) puts("Access granted");
		else puts("Access denied");
	}

	void access3(C* c, S* s) {
		auto r13 = c;
		auto r12 = s->rdx; 

		if (r12 == 0) {
			hard_check(false);
			return;
		}

		if (r12 <= 9) {
			hard_check(false);
			return;
		}
		hard_check(c->check(s));
	}
}

int main() {
	var3::C c;
	var3::S s;
	var3::access3(&c, &s);
	return 0;
}
