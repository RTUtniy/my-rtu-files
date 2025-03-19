#include "Menu.h"
#include <iostream>
using namespace std;

Menu::~Menu() {
	for (int index = 0; index < size; ++index) delete Items[index];
	delete[] Items;
	cout << "Menu un citi" << size << " citi taa elementi ir dezintegreeti" << endl;
}

void Menu::append(MainCourse& a) {
	if (size == maxSize) throw MenuSizeException();

	Items[size++] = new MainCourse(a);
}

void Menu::printAll() const {
	for (int i = 0; i < size; ++i) {
		cout << i + 1 << ". ";
		Items[i]->print();
		cout << endl;
	}
}

float Menu::GetMinPrice() {
	unsigned min_price = Items[0]->GetCena();
	for (int i = 1; i < size; ++i) {
		unsigned s = Items[i]->GetCena();
		if (s < min_price) min_price = s;
	}
	return min_price;
}