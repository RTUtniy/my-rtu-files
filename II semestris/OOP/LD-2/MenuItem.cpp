#include "MenuItem.h"
#include <iostream>
using namespace std;

string MenuItem::print() const {
	return GetNosaukums() + " | " + to_string(GetCena()) + ", " + to_string(GetKalorijas()) + " J";
}

MenuItem::~MenuItem() {
	cout << "MenuItem \"" << GetNosaukums() << "\" dezintegrēts" << endl;
}