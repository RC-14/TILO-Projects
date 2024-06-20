#include <iostream>

bool not_(bool x) {
	if (x) return false;
	else return true;
}

bool xor_(bool x, bool y) {
	if (x)
		if (y)
			return false;
		else return true;
	else return y;
}

bool and1(bool x, bool y) {
	if (x)
		if (y) return true;
	return false;
}

bool implication1(bool x, bool y) {
	if (x)
		if (y)
			return true;
		else
			return false;
	return true;
}

bool and2(bool x, bool y) {
	return x && y;
}

bool implication2(bool x, bool y) {
	return !(x && !y);
}

int main() {
	std::cout << not_(false) << not_(true) << std::endl;
	std::cout << xor_(false, false) << xor_(false, true) << xor_(true, false) << xor_(true, true) << std::endl;
	std::cout << and1(false, false) << and1(false, true) << and1(true, false) << and1(true, true) << std::endl;
	std::cout << implication1(false, false) << implication1(false, true) << implication1(true, false) << implication1(true, true) << std::endl;
	std::cout << and2(false, false) << and2(false, true) << and2(true, false) << and2(true, true) << std::endl;
	std::cout << implication2(false, false) << implication2(false, true) << implication2(true, false) << implication2(true, true) << std::endl;
	return 0;
}
