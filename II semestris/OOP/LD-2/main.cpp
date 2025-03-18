#include "MenuItem.h"
#include "MainCourse.h"
#include <iostream>
using namespace std;

int main(){
	const int arraySize = 2;

	MenuItem* Itemlist = new MenuItem[arraySize];
	cout << "set 0." << endl;
	Itemlist[0] = MenuItem("a", 0.1, 1);
	cout << "set 1." << endl;
	Itemlist[1] = MainCourse("ilgs", 0.2, 2, 6.0);
	cout << "setting finished" << endl;
	for (int index = 0; index < arraySize; index++) {
		cout << Itemlist[index].print() << endl;
	}
	cout << "===Delete items===" << endl;
	delete[] Itemlist;
	cout << "===Items deleted===" << endl;

	MenuItem* pointerList[arraySize] = {};
	pointerList[0] = new MainCourse();
	pointerList[1] = new MenuItem();

	for (int index = 0; index < arraySize; index++) {
		cout << pointerList[index]->print() << endl;
	}
	for (int index = 0; index < arraySize; index++) {
		cout << "...deleting pointer..." << endl;
		delete pointerList[index];
		cout << "deleted." << endl;
	}

	return 0;
}